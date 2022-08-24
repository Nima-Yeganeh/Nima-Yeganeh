var context = {
    {% autoescape off %}
    ticket: {{ ticket }}, 
    {% endautoescape %}
    userId: Number("{{ request.user.id}}"),
    ticketsList: "{% url 'talent_admin:tickets' %}",
    addTicket: "{% url 'talent_admin:api:tickets' %}",
}  