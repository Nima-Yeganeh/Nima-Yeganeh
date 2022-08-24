from django.db import models
from accounts.models import User
from company.models import Company
from persiantools.jdatetime import JalaliDate
from persiantools import characters, digits
from django.utils import timezone


class Notification(models.Model):
    notification_type = models.CharField(max_length=50, default='resume')
    user = models.ForeignKey(
        User, on_delete=models.PROTECT, related_name="notification_reciever")
    title = models.CharField(max_length=255)
    created_by = models.ForeignKey(
        User, on_delete=models.PROTECT, related_name="notification_sender", null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    company = models.ForeignKey(Company, on_delete=models.PROTECT, related_name="related_company", null=True,
                                blank=True)
    description = models.TextField(max_length=500, null=True, blank=True)
    unread = models.BooleanField(default=True)
    settings = models.JSONField(null=True, blank=True)

    def get_persian_created_at(self):
        date = JalaliDate(self.created_at)
        return digits.en_to_fa(str(date.year) + "/" + str(date.month) + "/" + str(date.day))

    @property
    def time_from_creat(self):
        date = timezone.now().replace(tzinfo=None) - self.created_at.replace(tzinfo=None)
        if date.days > 0:
            return " %s روز قبل" % (str(date.days))
        elif date.seconds >= 3600:
            return " %s ساعت قبل" % (str(int(date.seconds / 3600)))
        else:
            return " %s دقیقه قبل" % (str(int(date.seconds / 60)))