# api/views.py
from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response

from timelines.models import Timeline, Entry
from .serializers import TimelineSerializer, EntrySerializer


class EntryViewSet(viewsets.ModelViewSet):
    serializer_class = EntrySerializer
    queryset = Entry.objects.all()


class TimelineViewSet(viewsets.ModelViewSet):
    serializer_class = TimelineSerializer
    queryset = Timeline.objects.all()


@api_view(["GET"])
def change_rank(request, entry_id, new_rank):
    entry = get_object_or_404(Entry, id=entry_id)
    entry.rank = new_rank
    entry.save()

    entries = Entry.objects.filter(timeline=entry.timeline)
    serializer = EntrySerializer(entries, many=True, context={"request": request})

    content = {"entries": serializer.data}

    return Response(content)
