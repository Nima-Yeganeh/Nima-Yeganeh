# timeline/urls.py
from django.urls import path

from . import views

urlpatterns = [
    path("", views.home),
    path("edit_timeline/<int:timeline_id>/", views.edit_timeline, name="edit_timeline"),
]
