from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Notification
from .serializers import NotificationSerializer
from log.views import Logging
from job.models import JobResumes
from common.common import CoreFunctions


# from core.api import StandardAPI


class ChangeNotification(APIView):
    permission_classes = [IsAuthenticated]
    parser_classes = (MultiPartParser, FormParser,)

    def get_pk(self, request):
        pk_list = request.data['pk']
        pk = [int(x.strip()) for x in pk_list.split(',') if x]
        return pk

    def post(self, request):
        try:
            pk = self.get_pk(request)
            queryset = Notification.objects.filter(pk__in=pk, unread=True, user=request.user)
            if queryset.exists():
                for item in queryset:
                    item.unread = False
                    item.save()
                Logging.info_log(namespace='notification', request=request, log_type='change_notification_(post)',
                                 var1='read notification')
                return Response(status=status.HTTP_200_OK)
            return Response(status=status.HTTP_404_NOT_FOUND)
        except Notification.DoesNotExist as e:
            Logging.error_log(namespace='notification', request=request, log_type='change_notification_(post)',
                              var2=str(e))
            return Response(status=status.HTTP_404_NOT_FOUND)

    def delete(self, request):
        try:
            pk = self.get_pk(request)
            queryset = Notification.objects.filter(pk__in=pk, user=request.user)
            if queryset.exists():
                queryset.delete()
                Logging.info_log(namespace='notification', request=request, log_type='change_notification_(delete)',
                                 var1=f'delete notification {pk}')
                return Response(status=status.HTTP_200_OK)
            return Response(status=status.HTTP_404_NOT_FOUND)
        except Notification.DoesNotExist as e:
            Logging.error_log(namespace='notification', request=request, log_type='change_notification_(delete)',
                              var2=str(e))
            return Response(status=status.HTTP_404_NOT_FOUND)


class ShowNotifications(APIView):
    # permission_classes = [IsAuthenticated]

    def get(self, request):
        if request.user and request.user.is_authenticated:
            try:
                queryset = Notification.objects.filter(user=request.user, unread=True).order_by('-created_at')
                receive_resume = len(JobResumes.objects.filter(job__company__user=self.request.user,
                                                               stage__in=["1", "5"]))
                sent_resume = len(JobResumes.objects.filter(resume__user=self.request.user,
                                                            stage__in=["1", "5"]))
                if queryset.exists():
                    serializer = NotificationSerializer(queryset, many=True)
                    return Response({'count': len(serializer.data), 'notifications': serializer.data[0:3],
                                     "sent_resume_count": sent_resume, "receive_resume_count": receive_resume},
                                    status=status.HTTP_200_OK)
                return Response({'count': 0, 'notifications': [], "sent_resume_count": 0, "receive_resume_count": 0},
                                status=status.HTTP_200_OK)
            except Notification.DoesNotExist:
                return Response({'count': 0, 'notifications': [], "sent_resume_count": 0, "receive_resume_count": 0},
                                status=status.HTTP_200_OK)
        else:
            return Response({'count': 0, 'notifications': [], "sent_resume_count": 0, "receive_resume_count": 0},
                            status=status.HTTP_200_OK)

# # sample using of new StandartApi class
#
# class ShowNotifications(StandardAPI):
#     # permission_classes = [IsAuthenticated]

#     def get(self, request):
#         if request.user and request.user.is_authenticated:
#             try:
#                 queryset = Notification.objects.filter(user=request.user, unread=True).order_by('-created_at')
#                 if queryset.exists():
#                     serializer = NotificationSerializer(queryset, many=True)
#                     return self.get_200_response(data={'count': len(serializer.data), 'notifications': serializer.data[0:3]},
#                         message='')
#                 return self.get_200_response(data={{'count': 0, 'notifications': []}}, message='' )
#             except Notification.DoesNotExist:
#                 return self.get_200_response(data={{'count': 0, 'notifications': []}}, message='' )
#         else:
#             return self.get_200_response(data={{'count': 0, 'notifications': []}}, message='' )
