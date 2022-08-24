var context = {
    {% autoescape off %}
    info: {{ info }}, 
    {% endautoescape %}
    delete_cache_api: "{% url 'talent_admin:api:clear_config_cache' %}",
}