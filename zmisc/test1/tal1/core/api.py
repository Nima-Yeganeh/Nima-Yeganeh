from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.urls import reverse
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.http import Http404, JsonResponse
from rest_framework.decorators import api_view
from accounts.models import UploadFile, User
from common.common import ConfigMethods, CoreFunctions, get_abs_url
from job.models import Job
from .models import Location as LocationModel
from typing import (
    List, Dict, Optional,
)
from job.api.serializers import JobSerializer
from log.views import Logging
from rest_framework.permissions import IsAuthenticated


class StandardAPI(APIView):
    """
        return standard response including data, status, message, and pagination(optional)
    """

    def get_response(self, data: Dict, status: int, message: Optional[str] = None, pagination: Optional[Dict] = None):
        response = dict()
        response['data'] = data
        response['status'] = status
        if message:
            response['message'] = message
        if pagination:
            response['pagination'] = pagination
        return Response(response, status=status)

    def response_200(self, data='', message: Optional[str] = '', pagination: Optional[Dict] = None):
        return self.get_response(data=data, status=status.HTTP_200_OK, message=message, pagination=pagination)

    def response_400(self, data='', message: Optional[str] = '', pagination: Optional[Dict] = None):
        return self.get_response(data=data, status=status.HTTP_400_BAD_REQUEST, message=message, pagination=pagination)

    def response_403(self, data='', message: Optional[str] = '', pagination: Optional[Dict] = None):
        return self.get_response(data=data, status=status.HTTP_403_FORBIDDEN, message=message, pagination=pagination)

    def response_404(self, data='', message: Optional[str] = '', pagination: Optional[Dict] = None):
        return self.get_response(data=data, status=status.HTTP_404_NOT_FOUND, message=message, pagination=pagination)

    def get_params(self, request):
        params = dict()
        if request.data:
            params.update(request.data)
        if request.query_params:
            params.update(request.query_params)

        return params

    def get_param(self, key: str, default=None):
        params = self.get_params(self.request)
        # print('params:', params)
        for k in params.keys():
            if k == key:
                if self.request.method.lower() == 'get' or self.request.method.lower() == 'delete':
                    if isinstance(params[k], List) and len(params[k]) > 0:
                        return params[k][0]
                    return params[k]
                else:
                    return params[k]
        return default

        # print('params:', params)
        # return params.get(key, default=default)


class FileUpload(StandardAPI):
    def get(self, request):
        # =>get file id
        file_id = self.get_param('id')
        # find file by id
        file = get_object_or_404(UploadFile, pk=file_id)
        return self.response_200(get_abs_url('/media/uploads/files/{}'.format(file.filename)))

    def put(self, request):
        try:
            # =>get file upload hash
            hash = self.get_param('hash')
            # =>find upload file details by hash
            file_upload_details = CoreFunctions.get_upload_file_details_by_hash(
                hash)
            if file_upload_details:
                return self.response_200(file_upload_details)
            else:
                return self.response_404()
        except Exception as e:
            Logging.error_log(namespace='core', request=request,
                              log_type='file_upload_put', var2=str(e))
            return self.response_404()

    def post(self, request):
        # print('post:', request.data)
        try:
            # =>get params
            hash = request.data['file_hash']
            # print('hashi:', hash)
            # =>find upload file details by hash
            file_upload_details = CoreFunctions.get_upload_file_details_by_hash(
                hash)
            # =>check not have file details
            if not file_upload_details:
                # =>check if user is admin, set default upload details
                if request.user.is_admin:
                    file_upload_details = {
                        'mime_types': (),
                        'max_size': None
                    }
                else:
                    return self.response_400('not_found_details')
            # =>upload file by details
            uploadedFileId = 0
            files = request.FILES.getlist('file')
            for file in files:
                uploadFile = CoreFunctions.upload_file(
                    request, file, file_upload_details['mime_types'], file_upload_details['max_size'])
                # =>get id of uploaded file
                if uploadFile == None:
                    Logging.warning_log(namespace='core', request=request,
                                        log_type='file_upload_post', var1="couldn't upload file, status=400")
                    return self.response_400('not_uploaded')
                uploadedFileId = uploadFile.id
            Logging.info_log(namespace='core', request=request,
                             log_type='file_upload_post', var2='file id: %s' % uploadedFileId)
            return self.response_200(uploadedFileId)
        except Exception as e:
            Logging.error_log(namespace='core', request=request,
                              log_type='file_upload_post', var2=str(e))
            return self.response_400('error')


class Location(StandardAPI):

    def get(self, request):
        try:
            params = self.get_params(request)
            if 'id' in params:
                loc = LocationModel.objects.get(pk=self.get_param('id'))
                if not loc:
                    return self.response_404()
                return self.response_200(data={
                    'state': loc.state,
                    'country': loc.country,
                    'city': loc.city,
                })
            if 'country' in params and 'state' in params:
                # return cities of a country's state
                data = LocationModel.objects.values_list('pk', 'city').filter(
                    country=params['country'][0], state=params['state'][0])
            elif "country" in params:
                # retunr list of states of a country
                data = LocationModel.objects.values('state').filter(
                    country=params['country'][0]).distinct()
            else:
                # return list of countries
                data = LocationModel.objects.values('country').distinct()
            if len(data) == 0:
                return self.response_404(data={})

            is_city = True if isinstance((data[0]), tuple) else False
            data_values = []
            for d in data:
                data_values.append(
                    {"id": d[0], "name": d[1]} if is_city else list(d.values())[0])
            return self.response_200(data=data_values)
        except Exception as e:
            Logging.error_log(namespace='core', request=request,
                              log_type='location', var2=str(e))
            return self.response_400(data={})


class Config(StandardAPI):
    def get(self, request):
        try:
            # =>get params
            namespace = self.get_param('namespace')
            key = self.get_param('key')
            # =>if just namespace
            if namespace and not key:
                configs = ConfigMethods.get_configs_list([namespace], True)
                return self.response_200(configs)
            # =>if has namespace, key
            if namespace and key:
                config = ConfigMethods.get_config(namespace, key)
                return self.response_200(config)

        except Exception as e:
            Logging.error_log(namespace='core', request=request,
                              log_type='config', var2=str(e))
            return self.response_404(data={})


class Home_job(StandardAPI):
    def get(self, request):
        try:
            job_ids = ConfigMethods.get_config("home", "top_jobs")
            job_list = Job.objects.filter(pk__in=job_ids)
            serializer = JobSerializer(job_list, many=True)
            return self.response_200(data=serializer.data)
        except Exception as e:
            Logging.error_log(namespace='core', request=request,
                              log_type='home_job', var2=str(e))
            return self.response_400(data={})


class Urls(StandardAPI):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        # =>get role
        role = self.get_param('role', 'applicant')
        urls = {}
        # =>just return employer urls
        if role == 'employer':
            urls['jobs'] = reverse('company:jobs')
            urls['received_resumes'] = reverse('resume:received_resumes')
            urls['company_info'] = reverse('company:company')
        # =>just return applicant urls
        elif role == 'applicant':
            urls['my_resume'] = reverse('resume:resume')
            urls['sent_resume'] = reverse('resume:sent_resumes')
            urls['recomended_jobs'] = reverse('job:recomended_jobs')
            urls['bookmarked_jobs'] = reverse('job:bookmarked_jobs')
            if request.user.role == 'applicant':
                urls['panel_request'] = reverse('ticket:panel_request')

        # =>common urls
        urls['tickets'] = reverse('ticket:ticket_list'),
        urls['notifications'] = reverse('notification:notification')
        urls['payment_report'] = reverse('payment:payment_report')

        return self.response_200(urls)


class UserInfo(StandardAPI):

    def get(self, request):
        if request.user and request.user.is_authenticated:
            return self.response_200({
                'phone': request.user.phone,
                'email': request.user.email,
                'id': request.user.id,
            })
        else:
            return self.response_403()