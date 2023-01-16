# timeline/views.py
from django.shortcuts import render, get_object_or_404

from .models import Timeline


def home(request):
    data = {
        "title": "Home",
        "timelines": Timeline.objects.all(),
    }

    return render(request, "home.html", data)


def edit_timeline(request, timeline_id):
    timeline = get_object_or_404(Timeline, id=timeline_id)

    data = {
        "title": f"Edit Timeline {timeline.name}",
        "timeline": timeline,
    }

    return render(request, "edit_timeline.html", data)
