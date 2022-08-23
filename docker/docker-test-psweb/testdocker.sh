sudo docker images
sudo docker image build -t docker-test-psweb:latest .
sudo docker image ls
sudo docker ps
sudo docker container run -d --name web1 --publish 8080:8080 docker-test-psweb:latest
sudo docker ps
