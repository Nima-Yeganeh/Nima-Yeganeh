docker rm -f myhttpdsite1 myhttpdsite2
docker container run -d -p 8081:80 --name myhttpdsite1 httpd
docker container run -d -p 8082:80 --name myhttpdsite2 httpd
docker ps
