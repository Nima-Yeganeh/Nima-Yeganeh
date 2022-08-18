sudo docker-compose run web django-admin startproject composeexample .
docker-compose run web django-admin startproject composeexample .
sudo chown -R $USER:$USER composeexample manage.py

# settings.py >> change from code1 to code2
# code1
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
# code2
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': 5432,
    }
}

docker-compose up
docker-compose up -d

# http://localhost:8000
# or http://localhost:3003

docker ps
docker-compose down
