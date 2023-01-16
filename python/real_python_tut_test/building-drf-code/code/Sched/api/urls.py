# api/urls.py
from django.urls import path, include
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()
router.register(r"timelines", views.TimelineViewSet, "timeline")
router.register(r"entries", views.EntryViewSet, "entry")

urlpatterns = [
    path("v1/", include(router.urls)),
    path("v1/change_rank/<int:entry_id>/<int:new_rank>/", views.change_rank),
]
