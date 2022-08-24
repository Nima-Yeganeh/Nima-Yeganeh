from django.template import loader
from django.views import View
from django.http import HttpResponse
from common.common import ConfigMethods
from job.models import Job


def home(request):
    return StandardRender.render(request, 'home.html', context={
        'jobs_count': Job.objects.filter(status="active").count(),
    })


def response_200(request):
    return HttpResponse('')


class StandardRender():
    @classmethod
    def get_footer_data(self):
        data = {'footer': {
            'copyright_name': ConfigMethods.get_config('contact', 'copy_right'),
            'copyright_url': ConfigMethods.get_config('url', 'copy_right'),
            'address': ConfigMethods.get_config('contact', 'address'),
            'phone': ConfigMethods.get_config('contact', 'phone'),
            'email': ConfigMethods.get_config('contact', 'email'),
            'abour_url': ConfigMethods.get_config('url', 'about'),
            'contact_url': ConfigMethods.get_config('url', 'contact'),
            'about_us': ConfigMethods.get_config('contact', 'about_us'), 
        }}
        useful_links_list = ConfigMethods.get_configs_list(['useful_links'])
        social_media_list = ConfigMethods.get_configs_list(['social_media'])
        useful_links = {}
        for link in useful_links_list:
            useful_links.update({link.get('key', ''): link.get('value', '')})

        social_media = {}
        for s in social_media_list:
            social_media.update({s.get('key', ''): s.get('value', '')})

        data['footer'].update({'useful_links': useful_links})
        data['footer'].update({'social_media': social_media})
        return data

    @staticmethod
    def render(request, template_name, context=None, content_type=None, status=None, using=None):
        """
        Return a HttpResponse whose content is filled with the result of calling
        django.template.loader.render_to_string() with the passed arguments.

        And Add footer data to content.
        """
        if context is None:
            context = {}
        context.update(StandardRender.get_footer_data())
        content = loader.render_to_string(
            template_name, context, request, using=using)
        return HttpResponse(content, content_type, status)


def exams(request):
    render = StandardRender.render
    return render(request, 'exams.html')

def rules(request):
    render = StandardRender.render
    return render(request, 'rules.html')

def about_us(request):
    render = StandardRender.render
    return render(request, 'about_us.html')

def pcm(request):
    render = StandardRender.render
    return render(request, 'pcm.html')
def evaluation(request):
    return StandardRender.render(request, 'evaluation_and_development.html', context={})
