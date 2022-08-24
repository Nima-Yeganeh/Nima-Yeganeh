from random import random

import magic
from django.core.exceptions import ValidationError
from accounts.models import UploadFile, User
from notification.models import Notification
from django.contrib import messages
from django.core.paginator import Paginator
from common import variables
# from talent.settings.development import PAGINATION_DEFAULT_PER_PAGE
import re
from django.utils.crypto import get_random_string
from datetime import datetime, timedelta
import requests
from requests.structures import CaseInsensitiveDict
from resume.models import Resume, Certificate
# from talent import settings
import json
from django.conf import settings
from talent_admin.models import Config
from core.models import Location
import os
from zeep import Client, Transport
from requests import Session
from django.core.mail import EmailMessage
import threading
from django.template.loader import render_to_string
from kavenegar import *

import uuid
from difflib import SequenceMatcher

## for skip ssl error, while calling saman bank payment apis
requests.packages.urllib3.util.ssl_.DEFAULT_CIPHERS += ':HIGH:!DH:!aNULL'

## it works whithout these commands
# try:
#     requests.packages.urllib3.contrib.pyopenssl.util.ssl_.DEFAULT_CIPHERS += ':HIGH:!DH:!aNULL'
# except AttributeError:
#     # no pyopenssl support used / needed / available
#     pass


class CoreFunctions:
    FILE_UPLOAD_HASH_DB = []
    SYSTEM_USER_EMAIL = 'system@site.com'
    SYSTEM_USER = None
    @staticmethod
    def get_system_user():
        if CoreFunctions.SYSTEM_USER:
            return CoreFunctions.SYSTEM_USER
        CoreFunctions.SYSTEM_USER = User.objects.get(email=CoreFunctions.SYSTEM_USER_EMAIL)
        return CoreFunctions.SYSTEM_USER

    @staticmethod
    def get_upload_file_details_by_hash(hash):
        # =>iterate hash db
        # print('hashes:', CoreFunctions.FILE_UPLOAD_HASH_DB)
        for f in CoreFunctions.FILE_UPLOAD_HASH_DB:
            if f['hash'] == hash:
                # CoreFunctions.FILE_UPLOAD_HASH_DB.remove(f)
                # FIXME: remove this hash from db
                return f
        return None

    @staticmethod
    def generate_upload_file_hash(mime_types=(), max_size=0):
        # =>generate new hash
        hash = get_random_string(30)
        # =>append to list
        CoreFunctions.FILE_UPLOAD_HASH_DB.append({
            'hash': hash,
            'mime_types': mime_types,
            'max_size': max_size,
        })
        # print('hash:', hash)
        return hash

    @staticmethod
    def upload_file(request, file, content_types=(), max_size=None, min_size=None):
        if CoreFunctions.file_validator(request, file, content_types, max_size, min_size):
            try:
                mimetype = magic.from_buffer(file.read(), mime=True)
                name_split = file.name.split(".")
                file.name = get_random_string(30) + "." + name_split[len(name_split)-1]
                file.seek(0)
                return UploadFile.objects.create(owner=request.user, filename=file.name, mimetype=mimetype, file=file,
                                                 size=file.size)
            except:
                return None

    @staticmethod
    def file_validator(request, file, content_types=(), max_size=None, min_size=None):
        error_messages = {
            'max_size': "حجم فایل ارسالی باید کمتر از حد تعیین شده باشد.",
            'min_size': "حجم فایل ارسالی باید بیشتر از حد تعیین شده باشد.",
            'content_type': "فرمت فایل ارسال شده پشتیبانی نمی شود.",
        }
        if max_size is not None and file.size > max_size:
            messages.error(request, error_messages['max_size'])
            return False
        if min_size is not None and file.size < min_size:
            messages.error(request, error_messages['min_size'])
            return False
        if content_types:
            content_type = magic.from_buffer(file.read(), mime=True)
            file.seek(0)
            if content_type not in content_types:
                messages.error(request, error_messages['content_type'])
                return False
        return True

    @staticmethod
    def pagination(request, queryset):
        paginator = Paginator(queryset, settings.PAGINATION_DEFAULT_PER_PAGE)
        page_number = request.GET.get('page')
        return paginator.get_page(page_number)

    @staticmethod
    def get_absolute_url(url):
        if url.startswith('http'):
            return url
        else:
            if url.startswith('/'):
                url = url[1:]
            return settings.HOST_NAME + '/' + url


class CustomMessage:
    def __init__(self, title, description, close=True):  # title , des > m
        self.message = {"title": title,
                        "description": description, "close": close}


class PublicMessages:
    ERROR_MESSAGES = {
        # 'login_error': CustomMessage('first title', 'first description', False)
    }

    WARNING_MESSAGES = {
        # 'login_warning': CustomMessage('second title', 'second description')
    }

    INFO_MESSAGES = {
        # 'login_info': CustomMessage('third title', 'third description')
    }

    SUCCESS_MESSAGES = {
        # 'login_success': CustomMessage('fourth title', 'fourth description', False)
    }

    def get_message(self, msg_type, msg_name):
        return_message = {}

        if msg_type == 'error' and msg_name in PublicMessages.ERROR_MESSAGES:
            return_message = PublicMessages.ERROR_MESSAGES[msg_name].message
        elif msg_type == 'warning' and msg_name in PublicMessages.WARNING_MESSAGES:
            return_message = PublicMessages.WARNING_MESSAGES[msg_name].message
        elif msg_type == 'info' and msg_name in PublicMessages.INFO_MESSAGES:
            return_message = PublicMessages.INFO_MESSAGES[msg_name].message
        elif msg_type == 'success' and msg_name in PublicMessages.SUCCESS_MESSAGES:
            return_message = PublicMessages.SUCCESS_MESSAGES[msg_name].message
        return json.dumps(return_message)


class NotificationMessage:
    MESSAGE_TYPES = ['RESUME_CHECKING', 'RESUME_IS_WAITING', 'RESUME_ACCEPTED', 'RESUME_REJECTED', 'JOB_CHECKING', 'JOB_ACCEPTED',
                     'JOB_REJECTED', 'JOB_EXPIRED', 'PANEL_REQUEST_ACCEPTED', 'PANEL_REQUEST_REJECTED',
                     'TICKET_ANSWERED']
    MESSAGES = {
        'RESUME_CHECKING': {
            # TODO: change message
            'title': 'بررسی رزومه',
            'description': 'رزومه ی شما توسط شرکت company در حال بررسی می باشد',
            'link': 'link',
        },
        'RESUME_IS_WAITING': {
            # TODO: change message
            'title': 'در انتظار بررسی رزومه',
            'description': 'رزومه ی شما توسط شرکت company در انتظار بررسی می باشد',
            'link': 'link',
        },
        'RESUME_ACCEPTED': {
            # TODO: change message
            'title': 'تایید رزومه',
            'description': 'شرکت company رزومه ی شما را مورد بررسی قرارداد و شما را در دسته ی افراد تأیید شده دسته بندی کرد.منتظر تماس توسط کادر استخدامی company باشید.',
            'link': 'link',
        },
        'RESUME_REJECTED': {
            'title': 'رد رزومه',
            'description': 'رزومه شما توسط شرکت company رد شد. ',
            'link': 'link',
        },

        'JOB_CHECKING': {
            'title': 'بررسی آگهی',
            'description': 'آگهی شما در حال بررسی می‌باشد.',
            'link': 'link',
        },
        'JOB_ACCEPTED': {
            'title': 'تایید آگهی',
            'description': 'درخواست آگهی شما پذیرفته و منتشر شد.',
            'link': 'link',
        },
        'JOB_REJECTED': {
            'title': 'رد آگهی',
            'description': 'درخواست آگهی شما رد شد.',
            'link': 'link',
        },
        'JOB_EXPIRED': {
            'title': 'انقضای آگهی',
            'description': 'تاریخ انقضای آگهی شما فرارسید و آگهی‌تان حذف شد.',
            'link': 'link',
        },

        'PANEL_REQUEST_ACCEPTED': {
            'title': 'تایید درخواست پنل حقوقی',
            'description': 'درخواست پنل حقوقی شما بررسی و تایید شد.',
            'link': 'link',
        },
        'PANEL_REQUEST_REJECTED': {
            'title': 'رد درخواست پنل حقوقی',
            'description': 'درخواست پنل حقوقی شما بررسی و رد شد.',
            'link': 'link',
        },

        'TICKET_ANSWERED': {
            'title': 'پاسخ تیکت',
            'description': 'پاسخی برای تیکت شما آمده است.',
            'link': 'link',
        }
    }

    @staticmethod
    def create_notification(msg_type, receiver, sender=None, company=None, send_email=False, send_sms=False):
        if company:
            msg = NotificationMessage.get_message(msg_type, **{'company':str(company.title)})
        else:
            msg = NotificationMessage.get_message(msg_type, **{'company':""})
        notification = Notification.objects.create(
            notification_type=msg_type,
            title=msg['title'],
            user=receiver,
            created_by=sender,
            company=company,
            description=msg['description'],
            settings={
               'link': msg['link']
            }
        )
        if settings.SERVER_MODE == "cloud":
            if send_email:
                SendEmail.send_email(receiver, msg['title'], msg['des'])
            if send_sms:
                SMS.send(receiver.phone, msg['des'])

    @staticmethod
    def admin_notification(title, description, receiver, sender, send_email=False, send_sms=False):
        notification = Notification.objects.create(
            notification_type='admin',
            title=title,
            user=receiver,
            created_by=sender,
            description=description,
            settings={}
        )
        if settings.SERVER_MODE == "cloud":
            if send_email:
                SendEmail.send_email(receiver, title, description)
            if send_sms:
                SMS.send(receiver.phone, title + "\n" + description)

    @staticmethod
    def creat_config_notification(namespace, key, msg_type, title, params, receiver, sender=None,
                                  send_email=False, send_sms=False):
        msg = ConfigMethods.get_config(namespace, key)
        for param in params:
            msg = re.sub(param, params[param], msg)
        notification = Notification.objects.create(
            notification_type=msg_type,
            title=title,
            user=receiver,
            created_by=sender,
            description=msg,
            settings={}
        )
        if settings.SERVER_MODE == "cloud":
            if send_email:
                SendEmail.send_email(receiver, title, msg)
            if send_sms:
                SMS.send(receiver.phone, msg)

    @staticmethod
    def get_message(msg_type, **params):
        """
        sample call:
            * NotificationMessage.get_message('RESUME_CHECKING', **{'company':'هیواتک'})
            * NotificationMessage.get_message('RESUME_CHECKING', company = 'هیواتک')
        params can include 'company', 'link', ...
        """
        if not msg_type in NotificationMessage.MESSAGE_TYPES:
            return {}
        msg = NotificationMessage.MESSAGES[msg_type].copy()
        for key in msg:
            for param in params:
                msg[key] = re.sub(param, params[param], msg[key])
        return msg


class EmailThread(threading.Thread):

    def __init__(self, email):
        self.email = email
        threading.Thread.__init__(self)

    def run(self):
        self.email.send()


class SendEmail:
    @staticmethod
    def send_email(user, subject, description):
        email_body = render_to_string('email.html', {
            'user': user,
            'domain': settings.HOST_NAME,
            'description': description,
            'title': subject
        })
        email = EmailMessage(subject=subject, body=email_body,
                             from_email=settings.EMAIL_FROM_USER,
                             to=[user.email]
                             )

        EmailThread(email).start()


class SMS:
    @staticmethod
    def send(receptor, message):
        t = threading.Thread(target=SMS.api_kavenegar, args=[receptor, message])
        t.setDaemon(True)
        t.start()

    @staticmethod
    def api_kavenegar(receptor, message):
        try:
            api = KavenegarAPI(ConfigMethods.get_config('sms', 'api_key'))
            params = {
                'sender': ConfigMethods.get_config('sms', 'sender'),
                'receptor': receptor,
                'message': message
            }
            print("\n\n\n\n\n", params)
            response = api.sms_send(params)

            print("\n\n\n\n\n\n\n\n\n", response)
        except APIException as e:
            print(e)
        except HTTPException as e:
            print(e)


class PaymentMethods:

    @staticmethod
    def generate_payment_hash(title, price, typei, callback_url, vars={}):
        # =>generate new hash
        hash = get_random_string(30)
        # =>append to list
        variables.PAYMENT_HASH_DB.append({
            'hash': hash,
            'title': title,
            'price': price,
            'type': typei,
            'expired_at': datetime.now().timestamp() + (60 * 15),  # 15min
            'vars': vars,
            'final_price': price,
            'callback_url': callback_url,
        })
        # print('hash:', hash)
        return hash

    @staticmethod
    def get_payment_details_by_hash(hash):
        # =>iterate hash db
        for f in variables.PAYMENT_HASH_DB:
            # print('pay:', f)
            if f['hash'] == hash:
                # =>check expired hash
                # if f['expired_at'] > datetime.now().timestamp():
                # return None
                # FIXME: remove this hash from db
                return f
        return None


class ConfigMethods:

    @staticmethod
    def set_to_cache(config):
        is_exist = False
        # =>iterate configs list
        for c in variables.CONFIG_CACHE_DB:
            if c['namespace'] == config['namespace'] and c['key'] == config['key']:
                c['value'] = config['value']
                return True
        variables.CONFIG_CACHE_DB.append(config)
        return True

    """
    get config value by namespace and key
    """
    @staticmethod
    def get_from_cache(namespace, key, update = False):
        # =>iterate configs db
        for c in variables.CONFIG_CACHE_DB:
            # =>check namespace and key
            if c['namespace'] == namespace and c['key'] == key:
                # =>if must update
                if update:
                    config = Config.objects.get(namespace=namespace, key=key)
                    c['value'] = config['value']
                    c['updated_at'] = config['updated_at']
                    return c
                else:
                    return c
        # =>if not exist
        try:
            config = Config.objects.get(namespace=namespace, key=key)
            new_config = {
                'namespace': namespace,
                'key': key,
                'data_type': config.data_type,
                'value': config.value,
                'updated_at': config.updated_at,
                'updated_by': config.updated_by,
                'created_at': config.created_at,
                'created_by': config.created_by,
                'is_array': config.is_array,
                'array_type': config.array_type,

            }
            ConfigMethods.set_to_cache(new_config)
            # print(variables.CONFIG_CACHE_DB)
            return new_config
        except Config.DoesNotExist:
            return None


    """
    get config value by namespace and key
    """
    @staticmethod
    def get_config(namespace, key, default=None):
        print('request config: {}@{} ({} cached)'.format(namespace, key, len(variables.CONFIG_CACHE_DB)))
        # print('configs cache:', variables.CONFIG_CACHE_DB)
        value = None
        data_type = 'string'
        # try:
        # =>read from cache
        config = ConfigMethods.get_from_cache(namespace, key)
        if config:
            value = config['value']
            data_type = config['data_type']
            print('used by cache:', key, value)
        else:
            # =>search on default configs
            value = None
            for conf in variables.DEFAULT_CONFIGS:
                # =>check just local
                if 'just_local' in conf and settings.SERVER_MODE == 'cloud':
                    continue
                # =>check match local conf
                if conf['namespace'] == namespace and conf['key'] == key:
                    ConfigMethods.set_to_cache(conf)
                    value = conf['value']
                    data_type = conf['data_type']
                    break
            # =>search on db
            # config = Config.objects.get(namespace=namespace, key=key)
            # value = config.value
            # data_type = config.data_type
        # except Config.DoesNotExist:
            # =>search on default configs
            # value = None
            # for conf in variables.DEFAULT_CONFIGS:
            #     # =>check just local
            #     if 'just_local' in conf and settings.SERVER_MODE == 'cloud':
            #         continue
            #     # =>check match local conf
            #     if conf['namespace'] == namespace and conf['key'] == key:
            #         value = conf['value']
            #         data_type = conf['data_type']
            #         break
        if value is None:
            return default
        # convert value by data type
        if data_type == 'number':
            value = int(value)
        elif data_type == 'object' and isinstance(value, str):
            value = json.loads(value)
        elif data_type == 'boolean':
            value = bool(value)
        return value


    @staticmethod
    def set_config(namespace, key, value, data_type='string', request=None):
        try:
            # =>search on db
            config = Config.objects.get(namespace=namespace, key=key)
            config.value = json.dumps(
                value) if data_type == 'object' else str(value)
            if request:
                config.updated_by = request.User
            config.save()
            return value
        except Config.DoesNotExist:
            # =>create new config
            config = Config.objects.create(
                namespace=namespace,
                key=key,
                data_type=data_type,
                value=json.dumps(value) if data_type == 'object' else str(value))
            if not request is None:
                config.created_by = request.user
                config.updated_by = request.User
            config.save()
        # =>update cache
        ConfigMethods.get_from_cache(namespace, key, True)
        return value
        # except:
        #     raise
        #     return None

    """
        get list of namespaces and return all configs of them
    """

    # TODO fix data types, add try except
    @staticmethod
    def get_configs_list(namespaces=[], parseValue=True):
        # =>get configs ffrom db
        configs = list(Config.objects.filter(
            namespace__in=namespaces).values())
        # append default configs that not exist
        for config in variables.DEFAULT_CONFIGS:
            # =>check just local
            if 'just_local' in config and settings.SERVER_MODE == 'cloud':
                continue

            # =>check namespace is include
            if not config['namespace'] in namespaces:
                continue
            exist = False
            # =>check if config is exist
            for elem in configs:
                if elem['namespace'] == config['namespace'] and elem['key'] == config['key']:
                    exist = True
                    break
            if exist:
                continue
            # =>add default config
            configs.append(config)

        # =>normalize value
        if parseValue:
            for config in configs:
                if config['data_type'] == 'object' and isinstance(config['value'], str):
                    config['value'] = json.loads(
                        config['value'])
                elif config['data_type'] == 'number':
                    config['value'] = int(config['value'])

        return configs

    """
        return job categories list
        @returns [{key: string, title: string}...]
    """

    @staticmethod
    def get_jobs_list():
        jobs = ConfigMethods.get_configs_list(['job'])
        # =>normalize jobs
        for job in jobs:
            # print('job:', job, type(job['value']))
            if not isinstance(job['value'], dict):
                job['title'] = json.loads(job['value'])['title']
            else:
                job['title'] = job['value']['title']
        return jobs


class IfcApi:

    @staticmethod
    def get_ifc_token():
        token = ConfigMethods.get_config('system', 'token')
        if token is None:
            token = IfcApi.set_new_token()
        # check if token is invalid
        if token['expire_time'] < datetime.timestamp(datetime.now()):
            token = IfcApi.set_new_token()
        if token:
            return token['token']
        return None

    @staticmethod
    def set_new_token():
        data = {'emailOrMobile': ConfigMethods.get_config('system', 'ifc_admin_username'),
                'password': ConfigMethods.get_config('system', 'ifc_admin_password')}
        res = requests.post(ConfigMethods.get_config(
            'system', 'token_url'), json=data, timeout=30)
        if res.status_code == 200 and res.json()['result'] == "Successful":
            token_expire_hour = ConfigMethods.get_config(
                'system', 'token_expire_hour')
            expire_time = datetime.timestamp(
                datetime.now() + timedelta(hours=token_expire_hour))
            value = ConfigMethods.set_config('system', 'token',
                                             {'expire_time': expire_time,
                                              'token': res.json()['token']},
                                             data_type='object')
            return value
        return None

    @staticmethod
    def call_api(url, method, data=None, params=None, page_index=None, page_size=None):
        token = IfcApi.get_ifc_token()
        headers = CaseInsensitiveDict()
        headers["Authorization"] = "Bearer " + token
        if not params:
            params = {}
        if page_index is not None:
            params['pageIndex'] = page_index
        if page_size is not None:
            params['pageSize'] = page_size
        if method.lower() == 'get':
            response = requests.get(
                url, params=params, headers=headers, timeout=30)
            return response
        if method.lower() == 'post':
            response = requests.post(
                url, params=params, headers=headers, json=data, timeout=30)
            return response

    @staticmethod
    def update_user_certificate(user):
        # get user certificates from IFC api
        response = IfcApi.call_api(ConfigMethods.get_config('system', 'customer_certificates'), method='get',
                                   params={'customerId': user.customer_id})
        if response.status_code != 200:
            return False
        # fet user resume and add new certificate
        try:
            user_resume = Resume.objects.get(user=user)
        except:
            return False
        for certificate in response.json():
            try:
                # Check if the user already has the certificate
                if Certificate.objects.filter(certificate_code=certificate['certificateCode']).exists():
                    continue
                # creat new certificate
                cert = Certificate.objects.create(title=certificate['productName'], product_id=certificate['productId'],
                                                  certificate_code=certificate['certificateCode'], type="ifc")
                cert.settings = {}
                for key in certificate:
                    if key not in ['productName', 'productId', 'certificateCode']:
                        cert.settings[key] = certificate[key]
                cert.save()
                # add certificate to user resume
                user_resume.certificate.add(cert)
            except:
                continue
        return True


def get_abs_url(url):
    if url.startswith('http'):
        return url
    if url.startswith('/'):
        url = url[1:]
    return settings.HOST_NAME + '/' + url


class StartupFunctions:
    def insert_locations():
        if Location.objects.first():
            return
        path_to_json = os.path.join(settings.PROJECT_ROOT, 'docs/cities.json')
        f = open(path_to_json)
        cities = json.load(f)
        for loc in cities:
            Location.objects.create(country=loc[2], state=loc[1], city=loc[0])


class SepPayment():
    PAYMENT_URL = ConfigMethods.get_config('payment', 'url')
    VERIFY_URL = ConfigMethods.get_config('payment', 'verify_url')
    REDIRECT_URL = ConfigMethods.get_config('payment', 'redirect_url')
    TERMINAL_ID = ConfigMethods.get_config('payment', 'terminal_id')
    PASSWORD = ConfigMethods.get_config('payment', 'password')

    @staticmethod
    def get_client(url):
        session = Session()
        session.headers = {}
        transport = Transport(session=session)
        transport.session.headers = {}  # DON'T REMOVE THIS LINE.YOU BLOCK FROM SAMAN BANK IF REMOVE THIS LINE
        return Client(url, transport=transport)

    @staticmethod
    def get_token_response(amount, res_num, cell_number=''):
        data = {
            'Action':'Token',
            'Amount':amount,
            'CellNumber':cell_number,
            'RedirectUrl':SepPayment.REDIRECT_URL,
            'TerminalId': SepPayment.TERMINAL_ID,
            'ResNum':res_num
        }
        res = requests.post(url=SepPayment.PAYMENT_URL, data=data)
        if res.status_code == 200:
            return res.json()
        return None

    @staticmethod
    def verify_transaction(ref_num):
        client = SepPayment.get_client(SepPayment.VERIFY_URL)
        result = client.service.verifyTransaction(
            ref_num,
            SepPayment.TERMINAL_ID
        )
        return result

    @staticmethod
    def reverse_transaction(ref_num):
        client = SepPayment.get_client(SepPayment.VERIFY_URL)
        result = client.service.reverseTransaction(
            ref_num,
            SepPayment.TERMINAL_ID,
            SepPayment.TERMINAL_ID,
            SepPayment.PASSWORD
        )
        return result


def get_similarity_rate(a: str, b: str):
    """
    gets two strings and return their similarity
    """
    try:
        return SequenceMatcher(None, a, b).ratio()
    except:
        return None