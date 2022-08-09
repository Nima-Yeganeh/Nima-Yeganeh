
sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
python3 -V
pip --version
sudo apt install -y python3-venv
python3 -m pip install django~=4.0.0
python3 -m pip install --upgrade pip
sudo apt install -y python3-django

django-admin startproject django_project .
sudo apt install -y tree
tree .
ls -anp
python3 manage.py runserver
python3 manage.py migrate
python3 manage.py startapp pages
tree .
cat django_project/settings.py

# django_project/settings.py
INSTALLED_APPS = [
"django.contrib.admin",
"django.contrib.auth",
"django.contrib.contenttypes",
"django.contrib.sessions",
"django.contrib.messages",
"django.contrib.staticfiles",
"pages.apps.PagesConfig", # new
]

cat pages/apps.py

# pages/apps.py
from django.apps import AppConfig
class PagesConfig(AppConfig):
default_auto_field = "django.db.models.BigAutoField"
name = "pages"

cat pages/views.py
vi pages/views.py

# pages/views.py
from django.http import HttpResponse
def homePageView(request):
return HttpResponse("Hello, World!")

cat pages/urls.py
vi pages/urls.py

# pages/urls.py
from django.urls import path
from .views import homePageView
urlpatterns = [
path("", homePageView, name="home"),
]

cat django_project/urls.py
vi django_project/urls.py

# django_project/urls.py
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
path("admin/", admin.site.urls),
path("", include("pages.urls")),
]

python3 manage.py runserver
pip freeze > requirements.txt


