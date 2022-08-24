from datetime import timedelta

from django.conf import settings
from django.shortcuts import redirect, get_object_or_404
from django.core.exceptions import PermissionDenied
from django.http.response import Http404
from django.utils import timezone

from accounts.models import User
from common.common import ConfigMethods, get_abs_url
from common.variables import DEFAULT_CONFIGS
from core.models import Location
from job.api.serializers import JobSerializer
from job.models import Job
from talent_admin.models import Config
import json
from django.contrib.auth.decorators import login_required
from ticket.api.serializers import TicketSerializer
from ticket.models import Ticket
from core.views import StandardRender
render = StandardRender.render
# Create your views here.


@login_required()
def dashboard(request):
    if not request.user.is_admin:
        raise PermissionDenied

    return render(request, 'dashboard.html', context={
        'users': User.objects.filter(is_active=True).count(),
        'active_users': User.objects.filter(last_activity__gte=timezone.now()-timedelta(seconds=15)).count(),
        'active_jobs': Job.objects.filter(status='active').count(),
        'active_panel_requests': Ticket.objects.filter(ticket_type='panel_request', settings__is_waiting=True).count(),
    })


@login_required()
def jobs(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'jobs.html', context={
    })


@login_required()
def company_list_admin(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'company_list_admin.html', context={
    })


@login_required()
def jobs_intro(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'jobs_intro.html', context={
    })


@login_required()
def coupon(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'coupon.html', context={
    })

@login_required()
def edit_pages(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'edit_pages.html', context={
    })

@login_required()
def create_coupon(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'create_coupon.html')

@login_required()
def make_employer(request):
    if not request.user.is_admin:
        raise PermissionDenied
    user_id = request.GET['user_id']
    context = {
        'user_id': json.dumps(user_id),
    }
    return render(request, 'make_employer.html', context=context)

@login_required()
def users(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'users.html', context={
    })

@login_required()
def add_notification(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'add_notification.html', context={
    })

@login_required()
def view_job(request):
    if not request.user.is_admin:
        raise PermissionDenied
    # =>get job id
    job_id = request.GET['job_id']
    queryset = Job.objects.filter(pk=job_id)
    # =>check not found
    if not queryset or len(queryset) == 0:
        raise Http404
    # =>get job details
    job = JobSerializer(queryset, many=True).data[0]
    # =>set location, if exist
    if job['settings']['location']:
        loc = Location.objects.get(pk=int(job['settings']['location']))
        job['settings']['location'] = {
            'city': loc.city,
            'state': loc.state,
            'country': loc.country,
        },

    context = {
        'job': json.dumps(job),
    }
    return render(request, 'view_job.html', context=context)


@login_required()
def tickets(request):
    if not request.user.is_admin:
        raise PermissionDenied

    return render(request, 'tickets.html')

@login_required()
def reports(request):
    if not request.user.is_admin:
        raise PermissionDenied

    return render(request, 'reports.html')

@login_required()
def about(request):
    if not request.user.is_admin:
        raise PermissionDenied

    return render(request, 'about.html', context={
        'info': [
            {
                'title': 'نسخه',
                'value': settings.VERSION,
            },
            {
                'title': 'منطقه زمانی',
                'value': settings.TIME_ZONE,
            },
            {
                'title': 'حالت سرور',
                'value': settings.SERVER_MODE,
            },
            {
                'title': 'حالت دیباگ',
                'value': str(settings.DEBUG),
            },
        ]

    })


@login_required()
def view_ticket(request):
    if not request.user.is_admin:
        raise PermissionDenied

    # =>get ticket code
    code = request.GET['code']
    queryset = Ticket.objects.filter(ticket_code=code)
    # =>check not found
    if not queryset or len(queryset) == 0:
        raise Http404
    # =>get ticket
    ticket = TicketSerializer(queryset, many=True).data[0]

    context = {
        'ticket': json.dumps(ticket),
    }
    # =>if panel request
    if ticket['ticket_type'] == 'panel_request':
        return render(request, 'view_panel_request.html', context=context)
    else:
        return render(request, 'view_ticket.html', context=context)


@login_required()
def systemConfig(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'sys_config.html', context={})

@login_required()
def about_resume(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'about_resume.html', context={})

@login_required()
def company_sent_resume(request):
    if not request.user.is_admin:
        raise PermissionDenied
    return render(request, 'company_sent_resume.html', context={})
