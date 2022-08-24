var context = {
    users: {{users}},
    active_users: {{active_users}},
    active_jobs: {{active_jobs}},
    jobs_page: "{% url 'talent_admin:jobs' %}",
    users_page: "{% url 'talent_admin:users' %}",
    active_panel_requests: {{active_panel_requests}},
    tickets_page: "{% url 'talent_admin:tickets' %}",
    log_API:"{% url 'log:api:get_log' %}",
}  