from rest_framework import fields, serializers
from accounts.models import User


class UsersSerializer(serializers.ModelSerializer):
    last_activity = serializers.SerializerMethodField("get_last_activity")

    def get_last_activity(self, obj):
        if obj.last_activity:
            return round(obj.last_activity.timestamp() * 1000)
        else:
            return None
    class Meta:
        model = User
        fields = ['pk', 'email', 'phone', 'get_full_name',
                  'role', 'is_really_admin', 'is_active', 'customer_id', 'last_activity', 'settings']
