from django.urls import path, include
from notification import views
from . import api
app_name = 'notification'
urlpatterns = [
    path('', views.notification, name="notification"),
    path('notification_details/<int:pk>/', views.notification_details, name="notification_details"),
    path('api/notification/', api.ChangeNotification.as_view(), name="notification_api"),
    path('api/show_notification/', api.ShowNotifications.as_view(), name="show_notification_api"),
]

urlpatterns += [
    path('api-auth/', include('rest_framework.urls')),
]
