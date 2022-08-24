export DJANGO_SETTINGS_MODULE=talent.settings.local

python3 -m venv venv
#deactivate
source ./venv/bin/activate
find -path "*/migrations/*_initial.py" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*_auto_*" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*_alter_*" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*.pyc" -not -path "./venv/lib/*"  -delete

python manage.py makemigrations accounts --skip-checks --no-input

python manage.py makemigrations core --skip-checks --no-input

python manage.py makemigrations company --skip-checks --no-input

python manage.py makemigrations resume --skip-checks --no-input

python manage.py makemigrations job --skip-checks --no-input

python manage.py makemigrations log --skip-checks --no-input

python manage.py makemigrations notification --skip-checks --no-input

python manage.py makemigrations panel --skip-checks --no-input

python manage.py makemigrations payment --skip-checks --no-input

python manage.py makemigrations talent_admin --skip-checks --no-input

python manage.py makemigrations ticket --skip-checks --no-input

python manage.py makemigrations

python manage.py migrate

python manage.py runserver
