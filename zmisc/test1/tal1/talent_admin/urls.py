from django.urls import path, include
from talent_admin import old_api as api, views

app_name = 'talent_admin'
urlpatterns = [
    path('', views.dashboard, name="dashboard"),
    path('jobs/', views.jobs, name="jobs"),
    path('coupon/', views.coupon, name="coupon"),
    path('edit_pages/', views.edit_pages, name="edit_pages"),
    path('create_coupon/', views.create_coupon, name="create_coupon"),
    path('users/', views.users, name="users"),
    path('add_notification/', views.add_notification, name="add_notification"),
    path('view_job/', views.view_job, name="view_job"),
    path('about_resume/', views.about_resume, name="about_resume"),
    path('company_list_admin/', views.company_list_admin, name="company_list_admin"),


    path('system-config', views.systemConfig, name="configuration"),
    path('tickets/view-ticket/', views.view_ticket,
         name="view_ticket"),
    path('tickets/', views.tickets, name="tickets"),
    path('reports/', views.reports, name="reports"),
    path('about/', views.about, name="about"),
    path('jobs-intro/', views.jobs_intro, name="jobs_intro"),
    path('make_employer/', views.make_employer, name="make_employer"),
    path('company-sent-resumes/', views.company_sent_resume, name="company_sent_resume"),

    # API
    # path('api/config/', api.systemConfig, name="get_configs"),
    # path('api/config/save/', api.saveSystemConfig, name="save_config"),
    path('api/config/delete/', api.deleteSystemConfig, name="delete_config"),
    # path('api/ticket/answer-panel-request/',
    #      api.answerPanelRequest, name="answer_panel_request"),
    path('api/job/', api.AdminJobList.as_view(), name="jobs_api"),
    path('api/virtual_login/', api.VirtualLogin.as_view(), name="virtual_login"),
    path('api/users/', api.users.as_view(), name="users_api"),


    path('new_api/', include('talent_admin.api.urls', namespace='api')),
]


urlpatterns += [
    path('api-auth/', include('rest_framework.urls')),
]
