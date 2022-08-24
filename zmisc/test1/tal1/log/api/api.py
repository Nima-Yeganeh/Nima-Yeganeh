from rest_framework.permissions import IsAuthenticated, IsAdminUser
from core.api import StandardAPI
from log.models import Log
from log.api.serializers import LogSerializer


class GetLog(StandardAPI):
    permission_classes = [IsAuthenticated, IsAdminUser]
    PAGE_SIZE = 10

    def post(self, request):
        page_size = self.PAGE_SIZE
        page_index = 1
        params = self.get_params(self.request)
        # set page index and page size
        if 'page_size' in params:
            page_size = int(params['page_size'])
        if 'page_index' in params:
            page_index = int(params['page_index'])
        # get all logs
        if 'namespace' not in params:
            logs = Log.objects.all()
        # if namespace set in request, get logs according namespace
        else:
            if 'log_type' in params:
                logs = Log.objects.filter(namespace=params['namespace'], log_type=params['log_type'])
            else:
                logs = Log.objects.filter(namespace=params['namespace'])
        # sort and pagination logs
        logs = logs.order_by('-created_at')[(page_index - 1) * page_size:page_index * page_size]
        return self.response_200(LogSerializer(logs, many=True).data)
