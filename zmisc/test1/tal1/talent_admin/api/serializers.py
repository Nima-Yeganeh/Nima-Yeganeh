from rest_framework import fields, serializers
from accounts.models import User
from company.models import Company
from company.api.serializers import LocationSerializer
from job.models import Job


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'email']


class CompanySerializer(serializers.ModelSerializer):
    user = UsersSerializer()
    # location = LocationSerializer()
    # jobs_num = serializers.SerializerMethodField("get_jobs_num")
    # active_jobs_num = serializers.SerializerMethodField("get_active_jobs_num")
    #
    # def get_jobs_num(self, obj):
    #     return Job.objects.filter(company=obj).count()
    #
    # def get_active_jobs_num(self, obj):
    #     return Job.objects.filter(company=obj, status="active").count()

    class Meta:
        model = Company
        # fields = ["pk", "title", "about_company", "is_active", "user", "location", "jobs_num", "active_jobs_num"]
        fields = ["pk", "title", "about_company", "is_active", "user", "settings"]