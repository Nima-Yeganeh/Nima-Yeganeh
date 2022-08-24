from django.shortcuts import redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Notification
from common.common import CoreFunctions
from core.views import  StandardRender
render = StandardRender.render


@login_required()
def notification(request):
    queryset = Notification.objects.filter(user=request.user).order_by('-created_at')
    page_obj = CoreFunctions.pagination(request, queryset)
    return render(request, 'notification.html', {'notifications': page_obj})


@login_required()
def notification_details(request, pk):
    queryset = get_object_or_404(Notification, pk=pk, user=request.user)
    queryset.unread = False
    queryset.save()
    return render(request, 'notification_details.html', {'notification': queryset})
