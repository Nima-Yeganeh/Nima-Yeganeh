docker-compose up -d
docker-compose down
docker-compose run --rm wpcli sh
docker-compose run --rm wpcli wp --info

wp --info
wp config list
wp config set DB_HOST mysql
wp config set DB_NAME wordpress
wp config set DB_USER wordpress
wp config set DB_PASSWORD wordpress
wp core install --path="/var/www/html" --url="http://localhost:8000" --title="Local Wordpress By Docker" --admin_user=nima --admin_password=P@ssw0rd --admin_email=admin@domain.local
