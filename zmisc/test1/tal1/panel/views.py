from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from core.views import  StandardRender
render = StandardRender.render

# Create your views here.
@login_required()
def admin(request):
    return render(request, 'admin.html')


@login_required
def employee(request):
    if request.user.role == 'applicant':
        return redirect('resume:resume')
    else:
        return redirect('company:jobs')
