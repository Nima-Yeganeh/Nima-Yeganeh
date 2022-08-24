python3 -m venv venv
source ./venv/bin/activate
find -path "*/migrations/*_initial.py" -not -path "./venv/lib/*" -delete
find -path "*/migrations/*.pyc" -not -path "./venv/lib/*"  -delete

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver
