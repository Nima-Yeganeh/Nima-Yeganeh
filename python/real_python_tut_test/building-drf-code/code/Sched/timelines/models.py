# timeline/models.py
from django.db import models
from awl.absmodels import TimeTrackModel
from awl.rankedmodel.models import RankedModel


class Timeline(TimeTrackModel):
    name = models.CharField(max_length=50)

    def __str__(self):
        return f"Timeline({self.name}, {self.id})"


class Entry(TimeTrackModel, RankedModel):
    title = models.CharField(max_length=50)
    length = models.IntegerField()
    timeline = models.ForeignKey(Timeline, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = "Entries"
        ordering = ["rank"]

    def __str__(self):
        return f"Entry({self.title}, {self.id})"

    def grouped_filter(self):
        # Entry is ordered using the "rank" field inherited from RankedModel,
        # the order is within the Timeline this Entry is associated with, so
        # the ranks need to be grouped that way
        return Entry.objects.filter(timeline=self.timeline)
