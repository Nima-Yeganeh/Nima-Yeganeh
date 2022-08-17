# notes and commands
docker run -d -p 80:80 docker/getting-started
docker images
docker ps -a
# You'll notice a few flags being used. Here's some more info on them:
# -d - run the container in detached mode (in the background)
# -p 80:80 - map port 80 of the host to port 80 in the container
# docker/getting-started - the image to use
# You can combine single character flags to shorten the full command. As an example, the command above could be written as:
docker run -dp 80:80 docker/getting-started
docker image rm docker_test1
docker build -t docker_test1 .
docker images
docker ps -a
docker run -dp 3000:3000 docker_test1
docker ps
# Swap out <the-container-id> with the ID from docker ps
docker stop <the-container-id>
docker rm <the-container-id>
# You can stop and remove a container in a single command by adding the "force" flag to the docker rm command. For example: 
docker rm -f <the-container-id>
docker image ls
docker login
docker tag docker_test1 yeganehnimadgmailcom/docker_test1
docker push yeganehnimadgmailcom/docker_test1
# Now that our image has been built and pushed into a registry, let's try running our app on a brand new instance that has never seen this container image! To do this, we will use Play with Docker.
# https://labs.play-with-docker.com/
docker run -dp 3000:3000 yeganehnimadgmailcom/docker_test1

docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
docker run -it ubuntu ls /

docker volume create todo-db
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
docker volume inspect

docker run -dp 3000:3000 \
    -w /app -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "yarn install && yarn run dev"

docker logs -f <container-id>

docker network create todo-app

docker run -d \
    --network todo-app --network-alias mysql \
    -v todo-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos \
    mysql:5.7

docker exec -it <mysql-container-id> mysql -p

docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"

docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "apk --no-cache --virtual build-dependencies add python2 make g++ && yarn install && yarn run dev"

docker-compose version

docker run -it alpine
docker run -it ubuntu
docker run -it centos
docker run -it debian
docker run -it redis
docker run -it postgres
docker run -it node
docker run -it mysql
docker run -it traefik
docker run -it mongo
docker run -it busybox
docker run -it nginx
docker run -it python
docker run -it mariadb
docker run -it hello-world
docker run -it docker
docker run -it openjdk
docker run -it registry
docker run -it rabbitmq
docker run -it golang
docker run -it httpd
docker run -it memcached
docker run -it influxdb
docker run -it sonarqube
docker run -it nextcloud
docker run -it amazonlinux
docker run -it haproxy
docker run -it ruby
docker run -it elasticsearch
docker run -it maven
docker run -it tomcat
docker run -it php
docker run -it bash
docker run -it mongo-express
docker run -it zookeeper
docker run -it logstash
docker run -it couchdb
docker run -it cassandra
docker run -it java
docker run -it kibana
docker run -it perl
docker run -it jenkins
docker run -it groovy
docker run -it fedora
docker run -it swarm
docker run -it django
docker run -it archlinux
docker run -it varnish

