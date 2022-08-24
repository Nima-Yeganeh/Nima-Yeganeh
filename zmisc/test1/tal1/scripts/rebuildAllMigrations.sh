# remove all migration files
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc"  -delete

# make all migrations
python manage.py makemigrations accounts
python manage.py makemigrations company
python manage.py makemigrations config
python manage.py makemigrations job
python manage.py makemigrations log
python manage.py makemigrations panel
python manage.py makemigrations payment
python manage.py makemigrations resume
python manage.py makemigrations users

# migrate database
rm db.sqlite3
python manage.py migrate