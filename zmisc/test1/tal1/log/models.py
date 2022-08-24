from django.db import models
from accounts.models import User
# Create your models here.
class Log(models.Model):
    namespace = models.CharField(max_length=30)
    # sub namespace
    log_type = models.CharField(max_length=30, blank=True)
    mode = models.CharField(max_length=15)
    var1 = models.CharField(max_length=100, blank=True)
    var2 = models.TextField(null=True, blank=True)
    created_at =  models.DateTimeField(auto_now_add=True)
    # TODO use safe delete 
    user_id = models.ForeignKey(User, on_delete=models.PROTECT, null=True)
    user_ip = models.CharField(max_length=15, blank=True)

    class Meta:
        app_label = 'log'