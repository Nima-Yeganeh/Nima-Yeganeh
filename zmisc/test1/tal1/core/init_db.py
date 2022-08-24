from .models import Location
import json
import os

def insert_cities():
    path_to_json = os.path.abspath('./docs/cities.json')
    f = open(path_to_json)
    cities = json.load(f)

    for city in cities:
        Location.objects.create(country='ایران' , state=city[1], city=city[0])