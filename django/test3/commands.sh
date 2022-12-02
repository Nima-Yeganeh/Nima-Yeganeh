docker compose build web
docker compose up -d database_default

docker compose run web python manage.py migrate
docker compose run web python manage.py createsuperuser
docker compose run web python manage.py createsuperuser --username root --email admin@domain.local --noinput

docker compose up -d
