from django.urls import path
from core import api, views

app_name = 'core'
urlpatterns = [
    path('', views.home, name="home"),
    path('998421.txt/', views.response_200, name="res_enamad"),
    path('exams/', views.exams, name="exams"),
    path('rules/', views.rules, name="rules"),
    path('about_us/', views.about_us, name="about_us"),
    path('pcm/', views.pcm, name="pcm"),
    path('evaluation/', views.evaluation, name="evaluation"),
    # APIs
    path('api/file-upload', api.FileUpload.as_view(), name="file_upload"),
    path('api/location/', api.Location.as_view(), name="location"),
    path('api/config/', api.Config.as_view(), name="config"),
    path('api/home_job/', api.Home_job.as_view(), name="home_job"),
    path('api/urls/', api.Urls.as_view(), name="panel_urls"),
    path('api/user-info/', api.UserInfo.as_view(), name="user_info"),
]
