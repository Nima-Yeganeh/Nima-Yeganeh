var context = {
    {% autoescape off %}
    user: {{ user_id }},
    {% endautoescape %}
    companyApi: "{% url 'talent_admin:api:company_list' %}",
    defImage_r: "{% static '/base/img/change-upload-icon.svg' %} ",
    defImage_l: "{% static '/base/img/file-upload-icon.svg' %} ",
    panel_file_hash: "{% url 'ticket:api:panel_file_hash' %}",
    tick: "{% static '/base/img/tick.png' %}",
}  