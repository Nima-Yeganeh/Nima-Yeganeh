var context = {
    get_configs_api: "{% url 'talent_admin:api:sys_config' %}",
    delete_configs_api: "{% url 'talent_admin:delete_config' %}",
    uploadFileApi: "{% url 'core:file_upload' %}",
}