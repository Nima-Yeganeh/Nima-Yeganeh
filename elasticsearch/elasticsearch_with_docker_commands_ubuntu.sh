# Elasticsearch and Kibana using Docker

sudo docker images
sudo docker pull ubuntu
sudo docker pull elasticsearch:7.8.1
sudo docker pull kibana:7.8.1

cat docker-compose.yml
sudo vi docker-compose.yml
version: '3'
services:
  elasticsearch:
    image: elasticsearch:7.8.1
    ports:
      - 9200:9200
    environment:
      discovery.type: 'single-node'
      xpack.security.enabled: 'true'
      ELASTIC_PASSWORD: 'P@ssw0rd'
  kibana:
    image: kibana:7.8.1
    volumes:
      - ./kibana.yml:/usr/share/kibana/config/kibana.yml
    ports:
      - 5601:5601
cat docker-compose.yml

cat kibana.yml
sudo vi kibana.yml
# To allow connections from remote users, set this parameter to a non-loopback address.
server.host: "0.0.0.0"
# The URLs of the Elasticsearch instances to use for all your queries.
elasticsearch.hosts: ["http://elasticsearch:9200"]
# If your Elasticsearch is protected with basic authentication, these settings provide
# the username and password that the Kibana server uses to perform maintenance on the Kibana
# index at startup. Your Kibana users still need to authenticate with Elasticsearch, which
# is proxied through the Kibana server.
elasticsearch.username: "elastic"
elasticsearch.password: "P@ssw0rd"
cat kibana.yml

sudo docker ps -a
sudo docker container ls -a
sudo docker-compose up

sudo docker ps -a
curl http://localhost:9200/
curl http://localhost:5601/

