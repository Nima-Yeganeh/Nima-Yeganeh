docker version
docker image ls
docker container ls
docker system info
docker --version
docker-compose --version
docker-machine --version
notary version

wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker your-user
sudo usermod -aG docker npoulton
cat /etc/group | grep docker

apt-get update
apt-get remove docker docker-engine docker-ce docker.io -y
wget -qO- https://get.docker.com/ | sh
systemctl enable docker
systemctl is-enabled docker

docker container ls
docker service ls

cat /etc/docker/daemon.json
docker system info
