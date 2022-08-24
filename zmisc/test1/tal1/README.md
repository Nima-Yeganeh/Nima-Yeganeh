# Deployment of this project is following:

- python3 -m venv venv
- source ./venv/bin/activate
- venv\Scripts\activate (in windows)
- export DJANGO_SETTINGS_MODULE=talent.settings.development
- sudo apt-get install build-essential python3-dev
- sudo apt-get install default-libmysqlclient-dev (for connecting to mysql)
- pip3 install -r requirements.txt
- python3 manage.py makemigrations
- python3 manage.py migrate
- python3 manage.py runserver

# For create new app

- go to root of project (with manage.py)
- then: `python3 manage.py startapp [app_name]`

# Update database, static files, locales

manage.py syncdb --noinput
manage.py migrate
manage.py collectstatic --noinput
manage.py makemessages -a
manage.py compilemessages

# How to create a Django project from your template

### from local template

` django-admin startproject --template ~/django-template new_django_project new_django_project`

### or from remote git

`django-admin startproject --template https://github.com/username/repo/archive/master.zip new_django_project new_django_project`
