from django.conf import settings
from django.db.models.query_utils import Q
from django.shortcuts import get_object_or_404
from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from django.http import Http404, JsonResponse
from rest_framework.decorators import api_view
from accounts.models import User
from common.common import ConfigMethods
from company.models import Company
from job.api.serializers import JobSerializer
from job.models import Job
from .serializers import UsersSerializer
from core.api import StandardAPI
from django.contrib.auth import logout, login, authenticate
from django.utils import timezone

from talent_admin.models import Config
from django.core import serializers
import json
import datetime
from core.api import StandardAPI
import math

from ticket.models import Ticket


class AdminJobList(StandardAPI):
    permission_classes = [IsAdminUser, IsAdminUser]
    PAGE_SIZE = 10
    PAGE_INDEX = 1

    def get(self, request):
        try:
            # =>get params
            type = self.get_param('type')
            page_size = int(self.get_param("page_size", self.PAGE_SIZE))
            page_index = int(self.get_param("page_index", self.PAGE_INDEX))
            jobs = Job.objects.all()
            page_counts = int(math.ceil(jobs.count()/page_size))
            if type == 'all':
                jobs = jobs.order_by("-created_at")[(page_index - 1) * page_size:page_index * page_size]
            else:
                jobs = jobs.filter(status=type).order_by("-created_at")
                page_counts = int(math.ceil(jobs.count()/page_size))
                jobs = jobs[(page_index - 1) * page_size:page_index * page_size]

            return self.response_200({"jobs":JobSerializer(jobs, many=True).data,"page_counts": page_counts})
        except:
            return self.response_400()
    # TODO: std post api
    def post(self, request):
        try:
            # =>get params
            id = request.data['id']
            statusi = request.data['status']
            # =>find job by id
            job = Job.objects.get(id=id)
            job.status = statusi
            job.save()

            return JsonResponse('success', safe=False)
        except:
            return Response('', status=status.HTTP_400_BAD_REQUEST)


@api_view(['DELETE'])
def deleteSystemConfig(request):
    # print('post:', request.data)
    try:
        # =>get params
        # type = request.data['type']
        namespace = request.data['namespace']
        key = request.data['key']
        # =>check exist namespace, key
        obj = Config.objects.get(namespace=namespace, key=key)

        obj.delete()
        return Response('', status=status.HTTP_200_OK)
    except:
        return Response('', status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def answerPanelRequest(request):
    try:
        # =>get params
        code = request.data['code']
        answer = request.data['answer']
        # =>update ticket
        ticket = Ticket.objects.get(ticket_code=code)
        ticket.settings['status'] = answer
        if answer == 'accept':
            # print(ticket.settings)
            # =>create company
            Company.objects.create(
                title=ticket.settings['company_name'],
                settings=ticket.settings,
                user=ticket.created_by,
            )
            # =>change usaer role
            # User.objects.get(pk = ticket.created_by).update(role=).save()
            ticket.created_by.role = 'employer'
            ticket.created_by.save()

        elif answer == 'reject':
            ticket.settings['is_waiting'] = False

        ticket.answer_by = request.user
        ticket.answer_at = datetime.datetime.now()
        ticket.save()

        return JsonResponse(True, safe=False)
    except:
        return Response('', status=status.HTTP_400_BAD_REQUEST)


################################################
class users(StandardAPI):
    permission_classes = [IsAuthenticated]
    PAGE_SIZE = 10
    PAGE_INDEX = 1
    def get(self, request):
        try:
            if self.request.user.is_admin:
                # => filter by role
                role = self.get_param('role')
                if role:
                    if not role in ['applicant', 'employer']:
                        return self.response_400('invalid role')
                    queryset = User.objects.filter(role=role)
                else:
                    queryset = User.objects.all()
                # => sort user
                queryset = queryset.order_by("-last_activity")
                # =>get params
                search = self.get_param('search')
                # =>query on users
                if search and len(search) > 0:
                    queryset = queryset.filter(
                        Q(email__contains=search) | Q(phone__contains=search))   
                serializer = UsersSerializer(queryset, many=True)
                # =>detect&filter readonly users
                users = []
                for user in json.loads(json.dumps(serializer.data)):
                    # print('user:',user)
                    if user['settings'] and 'read_only' in user['settings']:
                        continue
                    users.append(user)
                # pagination
                if self.get_param("has_pagination", True) != "false":
                    page_size = int(self.get_param("page_size", self.PAGE_SIZE))
                    page_index = int(self.get_param("page_index", self.PAGE_INDEX))
                    page_counts = int(math.ceil(len(users) / page_size))
                    users = users[(page_index - 1) * page_size:page_index * page_size]
                    data = {"users": users, "page_counts": page_counts}
                else:
                    data = users
                return self.response_200(data=data)
            else:
                return self.response_403(data={})
        except:
            return self.response_400('')

    def post(self, request):
        try:
            # =>check user is admin
            is_admin = False
            if self.get_param('is_admin', False):
                is_admin = True
            # =>create user
            user = User.objects.create(
                email=self.get_param('email'),
                phone=self.get_param('phone'),
                role=self.get_param('role'),
                is_admin=is_admin,
                is_really_admin=is_admin,
                is_active=True
            )
            # =>set user password
            user.set_password(self.get_param('password'))
            user.save()

            return self.response_200(data=user.id)
        except:
            raise
            return self.response_400(data={})

    def put(self, request):
        try:
            # =>find user by pk
            user = get_object_or_404(User, pk=self.get_param('pk'))
            # =>update is_admin
            if self.get_param('is_really_admin') is not None:
                user.is_admin = self.get_param('is_really_admin')
                user.is_really_admin = self.get_param('is_really_admin')
            # =>update is_active
            user.is_active = self.get_param('is_active', True)

            user.save()

            return self.response_200(data=user.id)
        except:
            raise
            return self.response_400(data={})


class VirtualLogin(StandardAPI):
    permission_classes = [IsAuthenticated, IsAdminUser]

    def post(self, request):
        # TODO: check admin ip for more security
        try:
            params = self.get_params(request)
            user_id = int(params['user_id'])
            current_user = User.objects.get(pk=self.request.user.pk)
            # if admin want leave from customer account
            if current_user.is_admin and not current_user.is_really_admin:
                current_user.is_admin = False
                current_user.save()
            if user_id:
                next_user = User.objects.get(pk=user_id)
                if settings.SERVER_MODE == "local" and not next_user.is_admin:
                    next_user.is_admin = True
                    next_user.last_activity = timezone.now()
                    next_user.save()
                logout(request)
                login(request, next_user)
            return self.response_200(data={})
        except:
            return self.response_400(data={})
