# docker for devops
docker images
docker run busybox echo "hello world"
docker run -it busybox
docker ps
docker container ls
docker run -d busybox sleep 1000

docker ps -a
docker run --rm busybox sleep 1
docker run --name hello_world_busybox busybox

sudo docker run -it --rm tomcat:8.0
sudo docker run -it --rm -p 8888:8080 tomcat:8.0

sudo docker run -d --rm p 8888:8080 tomcat:8.0

docker history busybox

sudo docker run -it debian:jessie
apt update && apt install -y git
sudo docker ps -a
sudo docker commit 58c879feb536 yeganehnimadgmailcom/debian:1.0
sudo docker images
sudo docker run -it yeganehnimadgmailcom/debian:1.0

docker build -t yeganehnimadgmailcom/debian-git:1.0 .
docker images | grep debian-git

docker build -t yeganehnimadgmailcom/debian-git-python:1.0 .
docker images | grep debian-git

docker build -t yeganehnimadgmailcom/test . --no-cache=true

docker tag ID NAME/IMAGE
docker login
docker login --username=nima

docker login
docker push yeganehnimadgmailcom/debian-git:1.0

docker login
docker push yeganehnimadgmailcom/debian-git-python:1.0

docker run -d --name redis redis:3.2.0
docker run -d -p 5000:5000 --link redis dockerapp

docker-compose version
touch docker-compose.yml
subl docker-compose.yml

docker compose up
docker compose up -d
docker compose ps

docker compose logs
docker compose logs -f

docker compose stop
docker compose start

docker compose rm
docker compose build

docker compose down

docker exec -it ID bash

docker run -d --net none busybox sleep 1000

docker exec -it ID /bin/ash

docker network ls
docker netork inspect bridge
sudo docker network inspect bridge | grep IPv4

docker run -d --name container_1 busybox sleep 1000
docker exec -it container_1 ifconfig

sudo docker run -d --name container_2 busybox sleep 1000
sudo docker exec -it container_2 ifconfig | grep inet

docker network create --driver bridge my_bridge_network
docker network ls
docker network inspect my_bridge_network

docker network connect bridge container_1
docker network connect bridge container_2

docker network disconnect bridge container_3

docker run -d --name container_4 --net host busybox sleep 1000

