from django import template
import json

register = template.Library()


@register.filter
def json_loads(value):
    try:
        return json.loads(str(value))
    except:
        return value
