var context = {
    add_notification: '{% url "talent_admin:api:send_notification" %}',
    jobs_list: "{% url 'talent_admin:jobs' %}",
    courses_api: "{% url 'job:api:get_courses' %}",
    job_action_api: "{% url 'job:api:job_action' %}",
    {% autoescape off %}
    job_details: {{ job }}, 
    {% endautoescape %}
}  