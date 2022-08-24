var context = {
    companyApi: "{% url 'talent_admin:api:company_list' %}",
    url: '{% url "company:company_detail" 0 %}',
    uploadFileApi: "{% url 'core:file_upload' %}",
    recieved_resumes_url: "{% url 'talent_admin:company_sent_resume' %}",
}