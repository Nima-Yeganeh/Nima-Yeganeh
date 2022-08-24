from django.urls import path, include


app_name = 'log'
urlpatterns = [
    path('api/', include('log.api.urls', namespace='api')),
    ]