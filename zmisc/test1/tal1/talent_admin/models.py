from django.db import models
from accounts.models import User


# Create your models here.
class Config(models.Model):
    namespace = models.CharField(max_length=100)
    key = models.CharField(max_length=50)
    value = models.TextField(null=True)
    data_type = models.CharField(max_length=100, default='string')
    created_by = models.ForeignKey(User, on_delete=models.PROTECT, related_name='created_by', null=True, blank=True)
    is_array = models.BooleanField(default=False)
    array_type = models.CharField(max_length=100, default='string')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_by = models.ForeignKey(User, on_delete=models.PROTECT, related_name='updated_by', null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
