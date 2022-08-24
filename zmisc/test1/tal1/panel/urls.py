from django.urls import path
from panel import views


app_name = 'panel'
urlpatterns = [
    path('admin/', views.admin, name="admin"),
    path('', views.employee, name="employee"),

]