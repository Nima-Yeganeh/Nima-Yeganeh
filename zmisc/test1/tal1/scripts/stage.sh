export DJANGO_SETTINGS_MODULE=talent.settings.stage

python3 -m venv venv
#deactivate
source ./venv/bin/activate
find -path "*/migrations/*_initial.py" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*_auto_*" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*_alter_*" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*.pyc" -not -path "./venv/lib/*"  -delete

#python manage.py makemigrations users
python manage.py makemigrations accounts
python manage.py makemigrations company
python manage.py makemigrations job
python manage.py makemigrations log
python manage.py makemigrations notification
python manage.py makemigrations panel
python manage.py makemigrations payment
python manage.py makemigrations resume
python manage.py makemigrations talent_admin
python manage.py makemigrations ticket
python manage.py makemigrations

#python manage.py migrate

python manage.py runserver
