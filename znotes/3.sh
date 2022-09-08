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
