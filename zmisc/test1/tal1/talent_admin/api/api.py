import json
from datetime import datetime

from django.conf import settings

from django.db.models import Q, Sum
from company.models import Company
from accounts.models import User
from job.models import Job, JobResumes
from payment.api.serializers import PaymentSerializer
from payment.models import PaymentHistory
from job.api.serializers import JobSerializer, JobResumeSerializer
from core.api import StandardAPI
from common.common import ConfigMethods, NotificationMessage, CoreFunctions
from common import variables
from talent_admin.models import Config
from django.core import serializers
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from ticket.api.serializers import TicketSerializer
from ticket.models import Ticket
from django.utils import timezone
from log.views import Logging
from .serializers import CompanySerializer
import math
from threading import Thread


class SystemConfig(StandardAPI):
    permission_classes = [IsAdminUser]

    def get(self, request):
        try:
            # =>get params
            type = request.query_params['type']
            print('type:', type)
            if type == 'public':
                configs = ConfigMethods.get_configs_list(
                    ['price', 'social_media', 'url', 'contact', 'time', 'resume', 'home', 'payment'])
            else:
                configs = ConfigMethods.get_configs_list([type])
            if len(configs) > 0:
                for conf in configs:
                    # =>convert date to timestamp, if can
                    if conf.get('updated_at', False):
                        conf['updated_at'] = conf['updated_at'].timestamp() * 1000
                    # =>convert values to json, if can
                    if conf['data_type'] == 'object' and isinstance(conf['value'], str):
                        conf['value'] = json.loads(conf['value'])

            # print(configs)
            return self.response_200(configs)
        except Exception as e:
            Logging.error_log(namespace='talent_admin', request=request, log_type='system_config_(get)', var2=str(e))
            return self.response_200([])

    """
    insert or update config record
    """

    def post(self, request):
        # print('post:', request.data)
        try:
            # =>get params
            # type = request.data['type']
            namespace = self.get_param('namespace')
            key = self.get_param('key')
            value = self.get_param('value')
            data_type = self.get_param('data_type')
            is_array = self.get_param('is_array', False)
            array_type = self.get_param('array_type', 'string')
            print(namespace, key, value)
            try:
                # => check value type
                if data_type == 'number':
                    if not (isinstance(value, int) or value.isdigit()):
                        return self.response_400('value does not match with data type')
                if data_type == 'object' and not isinstance(value, str):
                    value = json.dumps(value)
                # =>check exist namespace, key
                obj = Config.objects.get(namespace=namespace, key=key)
                obj.value = value
                obj.updated_by = request.user
                obj.save()
                Logging.info_log(namespace='talent_admin', request=request, log_type='system_config_(post)',
                                 var1='update config')
            except Config.DoesNotExist:
                # =>create config, if not exist
                obj = Config.objects.create(
                    namespace=namespace,
                    key=key,
                    data_type=data_type,
                    value=value,
                    is_array=is_array,
                    array_type=array_type,
                    created_by=request.user,
                    updated_by=request.user)
            Logging.info_log(namespace='talent_admin', request=request, log_type='system_config_(post)',
                             var1='create config')
            # =>update config
            ConfigMethods.set_to_cache({
                'namespace': obj.namespace,
                'key': obj.key,
                'value': obj.value,
            })
            return self.response_200(json.loads(serializers.serialize('json', [obj])))
        except Exception as e:
            Logging.error_log(namespace='talent_admin', request=request, log_type='system_config_(post)', var2=str(e))
            return self.response_400('')


class Tickets(StandardAPI):
    permission_classes = [IsAdminUser]
    PAGE_SIZE = 10
    PAGE_INDEX = 1

    def get_user_ticket_list(self):
        ticket_code = 0
        ticket_pks = []
        tickets = Ticket.objects.all().order_by("ticket_code", "created_at")
        # get last ticket pk for each ticket code
        for ticket in tickets:
            if ticket.ticket_code != ticket_code:
                ticket_pks.append(ticket.pk)
                ticket_code = ticket.ticket_code
        user_ticket_list = Ticket.objects.filter(pk__in=ticket_pks).order_by("-created_at")
        return user_ticket_list

    def get(self, request):
        try:
            # =>get params
            typei = self.get_param('type', 'all')
            page_size = int(self.get_param("page_size", self.PAGE_SIZE))
            page_index = int(self.get_param("page_index", self.PAGE_INDEX))
            tickets = self.get_user_ticket_list()
            if typei != 'all':
                tickets = tickets.filter(ticket_type=typei)
            page_counts = int(math.ceil(tickets.count() / page_size))
            tickets = tickets[(page_index - 1) * page_size:page_index * page_size]
            return self.response_200({"tickets": TicketSerializer(tickets, many=True).data, "page_counts": page_counts})
        except Exception as e:
            Logging.error_log(namespace='talent_admin', request=request, log_type='tickets_(get)', var2=str(e))
            return self.response_200([])

    def post(self, request):
        try:
            # =>get params
            code = self.get_param('code')
            answer = self.get_param('answer')
            # =>update ticket
            ticket = Ticket.objects.get(ticket_code=code)
            ticket.settings['status'] = answer
            system_user = CoreFunctions.get_system_user()
            if answer == 'accept':
                # print(ticket.settings)
                # =>create company
                ticket.settings["is_waiting"] = False
                Company.objects.create(
                    title=ticket.settings['company_name'],
                    settings=ticket.settings,
                    user=ticket.created_by,
                    website_url=ticket.settings['website_url'],
                )
                # =>change usaer role
                # User.objects.get(pk = ticket.created_by).update(role=).save()
                ticket.created_by.role = 'employer'
                ticket.created_by.save()
                NotificationMessage.create_notification(
                    'PANEL_REQUEST_ACCEPTED', ticket.created_by, system_user, None)
            elif answer == 'reject':
                ticket.settings['is_waiting'] = False
                NotificationMessage.create_notification(
                    'PANEL_REQUEST_REJECTED', ticket.created_by, system_user, None)

            ticket.answer_by = request.user
            ticket.answer_at = timezone.now()
            ticket.save()
            Logging.info_log(namespace='talent_admin', request=request, log_type='tickets_(post)',
                             var1='create panel_request')
            return self.response_200(ticket.id)
        except Exception as e:
            Logging.error_log(namespace='talent_admin', request=request, log_type='tickets_(get)', var2=str(e))
            return self.response_400()

    def put(self, request):
        try:
            # =>get params
            code = self.get_param('code')
            des = self.get_param('description')
            title = self.get_param('title')
            # =>add new ticket
            ticket = Ticket.objects.create(
                ticket_type='support',
                title=title,
                description=des,
                ticket_code=code,
                created_by=request.user,
                settings={}
            )
            # =>set answer id for user ticket
            user_ticket = Ticket.objects.filter(~Q(created_by=self.request.user), ticket_code=code).order_by(
                "-created_at").first()
            user_ticket.answer_by = self.request.user
            user_ticket.answer_at = timezone.now()
            user_ticket.answer_id = ticket
            user_ticket.save()
            Logging.info_log(namespace='talent_admin', request=request, log_type='tickets_(put)', var1='create ticket')
            return self.response_200()
        except Exception as e:
            Logging.error_log(namespace='talent_admin', request=request, log_type='tickets_(put)', var2=str(e))
            return self.response_400()


class CompanyList(StandardAPI):
    permission_classes = [IsAdminUser]
    PAGE_SIZE = 10
    PAGE_INDEX = 1

    def get(self, request):
        try:
            tab = self.get_param("tab")
            page_size = int(self.get_param("page_size", self.PAGE_SIZE))
            page_index = int(self.get_param("page_index", self.PAGE_INDEX))
            company_list = Company.objects.all()
            if tab and tab == "active":
                company_list = company_list.filter(is_active=True)
            if tab and tab == "inactive":
                company_list = company_list.filter(is_active=False)
            page_counts = int(math.ceil(company_list.count() / page_size))
            company_list = company_list[(page_index - 1) * page_size:page_index * page_size]
            return self.response_200(
                {"companies": CompanySerializer(company_list, many=True).data, "page_counts": page_counts})
        except:
            return self.response_400()

    def post(self, request):
        try:
            company_id = self.get_param("company_id")
            status = self.get_param("active")
            company = Company.objects.filter(pk=company_id)
            if not company.exists():
                return self.response_404()
            if status == "true" or status == "True":
                status = True
            if status == "false" or status == "False":
                status = False
            company = company.first()
            company.is_active = status
            company.save()
            # change jobs status if company status changes
            if company.is_active:
                jobs = Job.objects.filter(company=company, status="expired")
                if jobs.exists():
                    for job in jobs:
                        if "company_expired" in job.settings and job.settings["company_expired"]:
                            if job.expiration_date > timezone.now():
                                job.status = "active"
                            job.settings["company_expired"] = False
                            job.save()
            else:
                jobs = Job.objects.filter(company=company, status="active")
                if jobs.exists():
                    for job in jobs:
                        job.status = "expired"
                        job.settings["company_expired"] = True
                        job.save()
            return self.response_200()
        except:
            return self.response_400()

    def put(self, request):
        try:
            # check user role
            user_id = self.get_param("user_id")
            user = User.objects.get(pk=int(user_id))
            if user.role == "employer":
                return self.response_403()

            input_list = ['company_name', 'national_id', 'registration_number', 'registration_date', 'company_phone',
                          'CEO_name', 'CEO_phone', 'address', 'website_url']
            settings_fields = {}
            for input_name in input_list:
                settings_fields[input_name] = self.get_param(input_name)
            for file_name in ['statute', 'last_edition']:
                file = self.get_param(file_name)
                if file:
                    settings_fields[file_name] = file
                elif file_name == 'statute':
                    return self.response_400(data={})
            company = Company.objects.create(
                title=settings_fields['company_name'],
                settings=settings_fields,
                user=user,
                website_url=settings_fields['website_url'],
            )
            user.role = "employer"
            user.save()
            return self.response_200(CompanySerializer(company).data)
        except:
            return self.response_400()


class ShowCompanyJobs(StandardAPI):
    permission_classes = [IsAdminUser]

    def get(self, request):
        try:
            company_id = self.get_param("company_id")
            company = Company.objects.filter(pk=company_id)
            if not company.exists():
                return self.response_404()
            company = company.first()

            jobs = Job.objects.filter(company=company)
            if not jobs.exists():
                return self.response_404()

            return self.response_200(JobSerializer(jobs, many=True).data)
        except:
            return self.response_400()


class ShowSubmittedResumes(StandardAPI):
    permission_classes = [IsAdminUser]

    def get(self, request):
        try:
            company_id = self.get_param("company_id")
            job_id = self.get_param("job_id")

            if job_id is None:
                company = Company.objects.filter(pk=company_id)
                if not company.exists():
                    return self.response_404()
                company = company.first()

                jobResumes = JobResumes.objects.filter(job__company=company)
                if not jobResumes.exists():
                    return self.response_404()
            else:
                jobResumes = JobResumes.objects.filter(job__id=job_id)
                if not jobResumes.exists():
                    return self.response_404()

            return self.response_200(JobResumeSerializer(jobResumes, many=True).data)
        except Exception as e:
            Logging.error_log(namespace='talent_admin', request=request, log_type='Show_submitte_resumes_get',
                              var2=str(e))
            return self.response_400()


'''
sample input:
{
"title":"title", # max:255
"description":"hi there", # max: 500

"receiver":employer, applicant, admin, all, custom
"user_list":[1,2],

"send_email": true,
"send_sms":true
}

{
"title":"admin notif for all users",
"description":"hello everyone",
"receiver":"all",
"user_list":[1,2],
"send_email": false,
"send_sms":false
}

url : http://127.0.0.1:8000/admin-panel/new_api/send_notification/
NotificationMessamge.admin_notification(...)
'''


class SendNotification(StandardAPI):
    permission_classes = [IsAdminUser]

    def post(self, request):
        try:
            title = self.get_param('title')
            description = self.get_param('description')
            receiver = self.get_param('receiver')
            user_list = self.get_param('user_list')
            send_email = self.get_param('send_email')
            send_sms = self.get_param('send_sms')

            # check validation of input fields
            is_valid, message = self.validate(
                title=title,
                description=description,
                send_email=send_email,
                send_sms=send_sms,
                receiver=receiver,
                user_list=user_list
            )
            if not is_valid:
                return self.response_400(data=message)

            # create a thread to send all notifications
            self.create_thread(title, description, self.request.user, send_email, send_sms, receiver, user_list)
            Logging.info_log('talent_admin', request=request, log_type="send_notification",
                             var1="sender: %s" % request.user.email)
            return self.response_200(data='your request is executing...')
        except Exception as e:
            Logging.error_log("talent_admin", request=request, log_type='send_notification', var2=str(e))
            return self.response_400('')

    def send_notification(self, title, description, sender, send_email, send_sms, receiver, user_list):
        if receiver == 'all':
            users = User.objects.all()
        elif receiver in ['employer', 'applicant']:
            users = User.objects.filter(role=receiver)
        elif receiver == 'admin':
            users = User.objects.filter(is_admin=True)
        elif user_list:  # custom recievers
            users = User.objects.filter(pk__in=user_list)
        else:
            # final user list is empty
            des = "لیست کاربران خالی است!"
            self.create_status_notification("ارسال پیام", des, self.request.user)
            return
        failed_users = []
        for user in users:
            try:
                NotificationMessage.admin_notification(
                    title=title,
                    description=description,
                    receiver=user,
                    sender=self.request.user,
                    send_email=send_email,
                    send_sms=send_sms
                )
            except Exception as e:
                failed_users.append(user)
        if failed_users:
            # send status notification to sender admin and save error log
            pk_list = list(map(lambda x: x.pk, failed_users))

            des = "ارسال پیام برای کاربران زیر با مشکل مواجه شد.\n" + str(pk_list)
            self.create_status_notification("ارسال پیام", des, self.request.user)

            Logging.error_log("talent_admin", request=self.request, log_type="send_notification",
                              var1="failed to send notification for some users", var2="pk_list: %s" % str(pk_list))
            return

        des = "ارسال پیام ها با موفقیت انجام شد"
        self.create_status_notification("ارسال پیام", des, self.request.user)
        return

    def create_thread(self, title, description, sender, send_email, send_sms, receiver, user_list):
        thread = Thread(target=self.send_notification,
                        args=(title, description, sender, send_email, send_sms, receiver, user_list))
        thread.start()

    def validate(self, title, description, send_email, send_sms, receiver, user_list):
        str_list = [title, description]
        bool_list = [send_email, send_sms]
        receiver_fields = ['all', 'employer', 'applicant', 'admin', 'custom']

        # check if there is a not str object in str_list, or not bool object in boo_list
        if False in list(map(lambda x: isinstance(x, str), str_list)):
            return False, 'invalid input type'
        if False in list(map(lambda x: isinstance(x, bool), bool_list)):
            return False, 'invalid input type'

        if not receiver in receiver_fields:
            return False, 'invalid reciever'
        if user_list and not isinstance(user_list, list):
            return False, 'invalid user_list type'
        if receiver == 'custom' and (user_list == None or len(user_list) == 0):
            return False, 'user list is needed for custom recievers'

        if len(title) > 255 or len(description) > 500:
            return False, 'too long title or description'

        return True, 'ok'

    def create_status_notification(self, title, description, receiver):
        try:
            system_user = CoreFunctions.get_system_user()
            NotificationMessage.admin_notification(
                title=title,
                description=description,
                receiver=receiver,
                sender=system_user,
                send_email=False,
                send_sms=False
            )
        except Exception as e:
            Logging.error_log("talent_admin", request=self.request, log_type="send_notification",
                              var1="couldn't send status notification to sender admin", var2=str(e))


class PaymentHistoryList(StandardAPI):
    permission_classes = [IsAdminUser]
    PAGE_SIZE = 10
    PAGE_INDEX = 1

    def get(self, request):
        try:
            status = self.get_param("status")
            date = self.get_param("date")
            res_num = self.get_param("res_num")
            user_id = self.get_param("user_id")
            page_size = int(self.get_param("page_size", self.PAGE_SIZE))
            page_index = int(self.get_param("page_index", self.PAGE_INDEX))
            payment_list = PaymentHistory.objects.all().order_by("-updated_at")
            total_price = payment_list.filter(result="success").aggregate(Sum("final_price"))
            total_payment = payment_list.filter(result="success").count()
            if res_num:
                payment_list = payment_list.filter(res_num=res_num)
            if user_id:
                user = User.objects.get(pk=int(user_id))
                payment_list = payment_list.filter(user=user)
            if status:
                payment_list = payment_list.filter(result=status)
            if date:
                payment_list = payment_list.filter(updated_at__gte=datetime.fromtimestamp(int(date) / 1000))
            page_counts = int(math.ceil(payment_list.count() / page_size))
            payment_list = payment_list[(page_index - 1) * page_size:page_index * page_size]
            date = PaymentSerializer(payment_list, many=True).data
            data = {
                "payment": date,
                "page_counts": page_counts,
                "total_price": total_price.get("final_price__sum"),
                "total_payment": total_payment
            }
            return self.response_200(data=data)
        except Exception as e:
            Logging.error_log(namespace='user_payment_list', request=request, log_type='get', var2=str(e))
            return self.response_400()


class ClearConfigCache(StandardAPI):
    def post(self, request):
        variables.CONFIG_CACHE_DB = []
        Logging.info_log(namespace='talent_admin', request=request, log_type='clear config cache')
        return self.response_200()
