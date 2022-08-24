from rest_framework import serializers
from log.models import Log


class LogSerializer(serializers.ModelSerializer):
    created_at = serializers.SerializerMethodField('get_created_at')

    def get_created_at(self, obj):
        return round(obj.created_at.timestamp() * 1000)

    class Meta:
        model = Log
        fields = '__all__'
