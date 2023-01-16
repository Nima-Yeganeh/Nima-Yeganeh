# api/serializers.py
from rest_framework import serializers
from timelines.models import Timeline, Entry


class EntrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Entry
        fields = ["id", "url", "title", "length", "rank", "timeline"]


class TimelineSerializer(serializers.ModelSerializer):
    entries = EntrySerializer(source="entry_set", many=True, read_only=True)

    class Meta:
        model = Timeline
        fields = ["id", "name", "entries"]
