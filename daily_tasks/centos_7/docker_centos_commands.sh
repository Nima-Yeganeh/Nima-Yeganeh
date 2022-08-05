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
sudo docker container ls -aq
sudo docker container ls -l

sudo docker container run -d ubuntu \
/bin/bash -c \
"while [ true ]; do date; sleep 1; done"

sudo docker container logs --help

ID=$(sudo docker run -d -i ubuntu /bin/bash)
sudo docker stop $ID
sudo docker stop $(sudo docker ps -q)
sudo docker ps -q
sudo docker container stop --help

ID=$(sudo docker container create ubuntu /bin/bash)
sudo docker container stop $ID
sudo docker container rm $ID

sudo docker container stop $(sudo docker container ls -q)
sudo docker container rm $(sudo docker container ls -aq)
sudo docker container rm --help

sudo docker container create --name c1 ubuntu /bin/bash
sudo docker container run --name c2 ubuntu /bin/bash
sudo docker container prune

sudo docker container prune --help

sudo docker container run --restart=always -d -i -t ubuntu /bin/bash
sudo docker container run --restart=on-failure:3 \
-d -i -t ubuntu /bin/bash

sudo docker container run --privileged -i -t ubuntu /bin/bash
#test inside the container >>
mount --bind /home/ /mnt/
ls /mnt/
touch /home/file-in-home
ls -l /mnt/

sudo docker container run --device=/dev/sdc:/dev/xvdc \
-i -t ubuntu /bin/bash

ID=$(sudo docker container run -d redis)
sudo docker container exec -it $ID /bin/bash

sudo docker container exec --help

ID=$(sudo docker container run -d -i ubuntu /bin/bash)
sudo docker container inspect $ID

ID=$(sudo docker container run -d -i ubuntu /bin/bash)
sudo docker container inspect $ID | more

sudo docker container inspect \
--format='{{.NetworkSettings.IPAddress}}' $ID

docker container inspect \
--format='{{.NetworkSettings.IPAddress}}' demo
docker container inspect \
--format='{{.NetworkSettings.IPAddress}}' demo demo2

sudo docker container inspect --format='{{.NetworkSettings.IPAddress}}' $(sudo docker ps -aq)
sudo docker container inspect --help

sudo docker image ls
sudo docker container run \
--label com.example.container=docker-test \
label-demo date

sudo docker container run --rm alpine pstree -p
sudo docker container run --rm alpine sh -c 'pstree -p'
sudo docker container run --rm --init alpine pstree -p
sudo docker container run --rm --init alpine sh -c 'pstree -p'

sudo docker container run -it ubuntu sh -c 'pwd && apt update && apt install -y apache2'
sudo docker container ls -a
sudo docker container commit --author 'nima-yeganeh' --message 'ubuntu with apache2' 80b32769d5ba myapache2test2
sudo docker image ls
sudo docker container diff 80b32769d5ba
sudo docker container commit --help

sudo docker login
sudo docker logout
sudo docker info
sudo docker info | grep name
sudo docker image tag myapache2test2 yeganehnimad/myapache2test2
sudo docker image push yeganehnimad/myapache2test2
sudo docker push --help

sudo docker image history myapache2test2
sudo docker image inspect myapache2test2
sudo docker image inspect --format='{{.Comment}}' myapache2test2

sudo docker image rm --help
sudo docker image pull centos:latest
sudo docker image tag centos:latest centos:tag1
sudo docker image tag centos:latest centos:tag2
sudo docker image  ls
sudo docker image rm $ID

sudo docker image rm centos:tag1
sudo docker image rm centos:tag2
sudo docker image rm centos

sudo docker container ls -q
sudo docker container stop $(sudo docker container ls -q)

sudo docker container ls -a -q
sudo docker container rm $(sudo docker container ls -a -q)

sudo docker image ls -q
sudo docker image rm $(sudo docker image ls -q)

sudo docker image rm --help

sudo docker image save [-o|--output]=file.tar IMAGE
sudo docker image save --output=myapache2.tar myapache2
sudo docker container export --output=myapache2_cont.tar c71ae52e382d

sudo docker image save -help
sudo docker container export --help

sudo docker image import myapache2.tar apache2:imported

mkdir sampleimage1
cd sampleimage1
cat Dockerfile
echo "" > Dockerfile
echo "
# Use ubuntu as the base image
FROM ubuntu
# Add author name
LABEL maintainer='Nima Yeganeh'
# Add the command to run at the start of container
CMD date" > Dockerfile
cat Dockerfile
sudo docker image build .
sudo docker image build -t sampleimage1 .

