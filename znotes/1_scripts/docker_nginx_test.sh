docker ps
docker rm -f mynginxsite1
docker rm -f mynginxsite2
docker container run -d -p 8083:80 --name mynginxsite1 nginx
docker container run -d -p 8084:80 --name mynginxsite2 nginx
docker ps
ip a | grep inet
