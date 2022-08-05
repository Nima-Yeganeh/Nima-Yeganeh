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


