sudo ps aux
sudo ip addr

sudo yum install -y libcgroup libcgroup-tools
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo dnf check-update
sudo dnf upgrade
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install docker-ce --nobest --allowerasing -y

sudo systemctl start docker
sudo systemctl status docker

sudo yum update -y
sudo systemctl enable docker
sudo docker run hello-world

sudo docker run -d alpine
sudo docker run -d centos
sudo docker run -d ubuntu
sudo yum update -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker container run hello-world
sudo docker ps -a
sudo docker images

sudo yum install -y curl epel-release
sudo yum update -y
sudo yum install -y jq
sudo yum install -y python3 python3-pip
sudo yum install -y python
sudo pip3 install --upgrade pip
sudo pip install --upgrade pip
sudo pip3 install docker-compose

sudo systemctl start docker
sudo docker info

sudo yum -y upgrade
sudo systemctl enable docker
sudo yum remove docker-ce
sudo systemctl stop docker
