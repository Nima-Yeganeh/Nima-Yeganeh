from django.urls import path, include
from . import api

app_name = 'api'
urlpatterns = [
    path('config/', api.SystemConfig.as_view(), name="sys_config"),
    path('clear_config_cache/', api.ClearConfigCache.as_view(), name="clear_config_cache"),
    path('ticket/', api.Tickets.as_view(), name="tickets"),
    path('company_list/', api.CompanyList.as_view(), name="company_list"),
    path('show_company_jobs/', api.ShowCompanyJobs.as_view(), name="show_company_jobs"),
    path('show_submitted_resumes/', api.ShowSubmittedResumes.as_view(), name="show_submitted_resumes"),
    path('send_notification/', api.SendNotification.as_view(), name="send_notification"),
    path('payment_list/', api.PaymentHistoryList.as_view(), name="payment_list"),

]
urlpatterns += [
    path('api-auth/', include('rest_framework.urls')),
]
