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

