sudo ps aux
sudo ip addr
sudo yum install -y libcgroup libcgroup-tools
sudo lssubsys -M
sudo uname -i
sudo uname -r
sudo grep device-mapper /proc/devices

sudo yum remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine

sudo yum install -y yum-utils \
device-mapper-persistent-data \
lvm2
sudo yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-test
sudo yum install -y docker-ce

sudo systemctl start docker
sudo systemctl enable docker

sudo docker container run hello-world
sudo docker ps -a

sudo systemctl start docker
sudo docker info

sudo yum -y upgrade
sudo systemctl enable docker
sudo yum remove docker-ce
sudo systemctl stop docker

#Installing Docker on Linux with an automated script
sudo curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo docker container run hello-world
sudo docker image pull alpine
sudo docker image ls
sudo docker container run -id --name demo alpine ash
sudo docker container ps

sudo groupadd docker
sudo useradd dockertest
sudo usermod -aG docker dockertest
sudo man docker
sudo man docker ps
sudo man docker-ps

sudo docker version
sudo docker search --limit 5 alpine
sudo docker search \
--filter is-automated=true \
--filter stars=1 alpine
sudo docker search --help

sudo docker image pull ubuntu
sudo docker image pull centos:centos7

sudo docker image pull --all-tags alpine
sudo docker image pull --help

sudo docker image ls
sudo docker images
sudo docker image ls --help

sudo docker container run -i -t --name mycontainer ubuntu /bin/bash
sudo docker container ps -a
sudo docker container start mycontainer
sudo docker container attach mycontainer

ID=$(sudo docker container create -t -i ubuntu /bin/bash)
sudo docker container start -a -i $ID
sudo docker container run -d -i -t ubuntu /bin/bash

ID=$(sudo docker container run -d -t -i ubuntu /bin/bash)
sudo docker attach $ID

sudo docker container run -d ubuntu \
/bin/bash -c \
"while [ true ]; do date; sleep 1; done"

sudo docker run --rm ubuntu date
sudo docker container run --read-only --rm \
ubuntu touch file

sudo docker container run --help

sudo docker container ls
sudo docker ps

