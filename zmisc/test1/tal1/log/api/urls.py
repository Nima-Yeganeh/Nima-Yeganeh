from django.urls import path, include
from . import api

app_name = 'api'
urlpatterns = [
    path('get_log/', api.GetLog.as_view(), name="get_log"),

]
urlpatterns += [
    path('api-auth/', include('rest_framework.urls')),
]