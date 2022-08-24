from rest_framework import serializers
from .models import Notification


class NotificationSerializer(serializers.ModelSerializer):
    date = serializers.ReadOnlyField(source='time_from_creat')

    class Meta:
        model = Notification
        fields = ['pk', 'title', 'description', 'date']
