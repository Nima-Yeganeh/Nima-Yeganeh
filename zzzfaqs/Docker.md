# docker installation commands
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker <user_name>
Ps -ef | grep docker
sudo service docker status
docker version

# docker basics
docker pull image_name
docker pull nginx
docker run -d -p 80:80 nginx
docker run -it -p 80:80 nginx
docker container log <id>
docker exec afbg ls
docker exec -it container_id /bin/bash
docker container stop ID
docker container start ID
docker image ls
docker container ls
docker image rm nginx
docker container rm NAME
docker container ls –all
docker container run -it alpine
docker ps -a | grep alpine
docker container diff ID
docker container commit ID
docker image ls
docker image tag ID NAME
docker login
docker push NAME
docker volume ls
docker volume create mysql-data
docker volume inspect mysql-data
ls /var/lib/docker/volumes/mysql-data/_data
docker run –name ganesh-mysql -v mysql-data:/var/lib/mysql/ -e MYSQL_ROOT_PASSWORD=mypasswd -d mysql:latest
docker exec -it ganesh-mysql /bin/bash
docker ps -a
docker compose >> tool >> multi container
docker-compose.yml
docker-compose version
