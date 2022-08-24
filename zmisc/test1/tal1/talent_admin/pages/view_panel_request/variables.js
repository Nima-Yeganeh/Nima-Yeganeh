var context = {
    {% autoescape off %}
ticket: JSON.parse(JSON.stringify({{ ticket }})),
    {% endautoescape %}
ticketsApi: "{% url 'talent_admin:api:tickets' %}",
    ticketsList: "{% url 'talent_admin:tickets' %}",
        uploadFileApi: "{% url 'core:file_upload' %}",

}