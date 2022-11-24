docker-compose run --rm wpcli1 sh
wp config list
wp config set WP_REDIS_HOST redis1
wp config set WP_CACHE_KEY_SALT wp-docker-5DknvYepdjyJMo8gDqrLhrpAJUQ
wp config set WP_REDIS_PORT 6379
wp config set WP_REDIS_PASSWORD wordpress
wp config set WP_REDIS_MAXTTL 86400
wp config set WP_REDIS_SCHEME tls
wp config set WP_REDIS_SCHEME unix
wp config delete WP_REDIS_SCHEME
wp plugin install redis-cache --activate
wp redis status
wp redis enable --force

wp plugin delete akismet
wp plugin delete hello
wp config set EP_HOST http://elk1:9200
wp plugin install elasticpress --activate
wp elasticpress index --setup


docker container exec -it test6-redis1-1 sh
redis-cli
PING
redis-cli -h 127.0.0.1 -a wordpress
keys *

curl -X GET localhost:9200 

sudo apt-get update && sudo apt-get install elasticsearch
systemctl start elasticsearch
systemctl enable elasticsearch
systemctl status elasticsearch

nano /etc/elasticsearch/elasticsearch.yml
hostname -i

