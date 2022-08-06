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
CMD date
" > Dockerfile
cat Dockerfile
sudo docker image build .
sudo docker image build -t sampleimage1 .

mkdir sampleimage2
cd sampleimage2
cat Dockerfile
echo "" > Dockerfile
pwd
ls -anp
echo "
FROM alpine:3.6
LABEL maintainer='Nima Yeganeh'
RUN apk add --no-cache apache2 && \
mkdir -p /run/apache2 && \
echo '<html><h1>Docker Test</h1></html>' > \
/var/www/localhost/htdocs/index.html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
" > Dockerfile
cat Dockerfile
sudo docker image build -t sampleimage2 .

ID=$(sudo docker container run -d -p 8081:80 sampleimage2)
sudo docker container inspect $ID
IP=$(sudo docker container inspect --format='{{.NetworkSettings.IPAddress}}' $ID)
sudo curl $IP

sudo docker container run -d -p 5000:5000 \
--name registry registry:2
sudo docker tag apache2 localhost:5000/apache2
sudo docker image push localhost:5000/apache2

sudo ip addr
sudo ip addr docker0

sudo docker container run --rm -it alpine
sudo docker container run --rm --network=host alpine brctl show
sudo iptables -t nat -L -n
sudo docker run --rm alpine traceroute -m 3 -n 8.8.8.8

sudo docker container run -d -p 80:80 test/apache2
sudo /proc/sys/net/ipv4/ip_local_port_range
sudo docker container run -it --rm alpine ip addr
sudo docker container run -it --rm --net=host alpine ip addr

sudo docker network ls
sudo docker container run -it --rm --net=none alpine ip addr

sudo docker container run -itd --name=ipcontainer alpine
sudo docker container exec ipcontainer ip addr
sudo docker container run --rm --net container:ipcontainer alpine ip addr
sudo docker container run -itd --net container:ipcontainer --name service1 alpine
sudo docker container exec service1 ip addr

sudo docker network create newnet
sudo docker network inspect newnet

sudo docker network create 10dot1net --subnet 10.1.0.0/16
sudo docker container run -itd --name container1 --network-alias netalias --net newnet alpine
sudo docker container run -itd --name container2 --network-alias netalias --net newnet alpine
sudo docker container inspect container1
sudo docker container inspect container2
sudo docker container run --rm --net newnet alpine ping -c1 container1
sudo docker container run --rm --net newnet alpine ping -c1 container2
sudo docker container run --rm --net newnet alpine ping -c1 netalias

sudo dig -h
sudo docker volume create datavol
sudo docker volume ls
sudo docker container run -it --rm -v datavol:/data alpine
echo "This is a named volume demo" > /data/demo.txt
sudo docker container run --rm -v datavol:/data ubuntu cat /data/demo.txt
sudo docker container run --rm -v datavol:/data ubuntu ls -anp /data/
sudo docker volume inspect datavol

sudo yum install -y tree
sudo tree -a /var/lib/docker/volumes/datavol
sudo docker volume create -help
sudo docker volume ls -help
sudo docker volume inspect -help

mkdir /home/nima/data_share/
echo 'data sharing demo' > /home/nima/data_share/demo.txt
cat /home/nima/data_share/demo.txt
sudo docker container run --rm -v /home/nima/data_share:/data ubuntu cat /data/demo.txt
sudo docker container run --rm -v /home/nima/data_share:/data ubuntu ls -anp /data/
sudo docker container run --rm -v /home/nima/data_share:/testfolder centos ls -anp /testfolder

touch /home/nima/data_share/file
sudo docker container run --rm -v /home/nima/data_share/file:/file:rw ubuntu sh -c "echo rw mode >> /file"
cat /home/nima/data_share/file

sudo yum install -y curl epel-release
sudo yum update -y
sudo yum install -y jq
sudo curl -s --unix-socket /var/run/docker.sock http://images/json | jq "."

sudo yum install -y python3 python3-pip
sudo pip3 install docker

sudo systemctl docker status | grep Loaded
sudo service docker status | grep Loaded
sudo cat /lib/systemd/system/docker.service
sudo vi /lib/systemd/system/docker.service
# Continue on to configure dockerd to accept connections from remote systems by appending -H tcp://0.0.0.0:2375 to the ExecStart line in the unit file
# ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
# default setting >> ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375 --containerd=/run/containerd/containerd.sock
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo yum install -y net-tools
sudo netstat -nap | grep 2375
sudo curl http://127.0.0.1:2375/version | jq "."
sudo docker -H tcp://127.0.0.1:2375 version
sudo export DOCKER_HOST=tcp://dockerhost.example.com:2375
sudo export DOCKER_HOST=tcp://127.0.0.1:2375

sudo docker container run -it -c 100 alpine ash
sudo docker container run -it --cpuset=0,3 alpine ash
sudo docker container run -it -m 512M alpine ash
sudo docker container run -it --ulimit data=8192 alpine ash

sudo setenforce 0
sudo setenforce 1

sudo yum install -y nuttcp netperf

sudo docker stats

sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel
sudo yum update -y
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
sudo tar xzf Python-3.7.0.tgz
cd Python-3.7.0
sudo ./configure --enable-optimizations
sudo make altinstall
python3.7 -V

cd /usr/src
sudo curl -O https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz
sudo tar -xzf Python-3.8.1.tgz
cd Python-3.8.1/
sudo ./configure --enable-optimizations
sudo make altinstall

sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
sudo pip install docker-compose
sudo pip3 install docker-compose

mkdir wordpress_compose
cd wordpress_compose
ls -anp
cat docker-compose.yml
echo "
version: '3.1'
services:
  wordpress:
    image: wordpress
    restart: always
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_PASSWORD: example
  mysql:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example
" > docker-compose.yml
cat docker-compose.yml
sudo docker-compose up
sudo docker-compose down
sudo docker-compose build
sudo docker-compose exec wordpress bash
sudo docker-compose ps

sudo docker node ls
sudo docker service create --name demo --publish 80:80 nginx
sudo docker service ls
sudo docker service ps demo
sudo docker service scale demo=3

echo "mypass" | docker secret create my_pass -
sudo docker service create --name="my-service" --secret="my_pass"
sudo docker service ps my-service
sudo docker container exec $(sudo docker container ls --filter name=my-service -q) cat /run/secrets/my_pass
sudo docker secret inspect secret_name
sudo docker secret ls
sudo docker secret rm secret_name
sudo docker service update --secret-rm secret_name service_name

sudo kubectl get pods
sudo kubectl get rs
sudo kubectl scale --replicas=1 deployment/my-nginx
sudo kubectl get services
sudo kubectl get secrets
sudo kubectl get pvc

sudo docker search ubuntu
sudo useradd dockertest
sudo passwd dockertest
sudo groupadd docker
sudo gpasswd -a dockertest docker

sudo setenforce 1
sudo getenforce
sudo docker info

sudo docker container run -it -v /tmp:/tmp/host:z alpine ash
sudo docker container run -it -v /tmp:/tmp/host:z alpine ash

sudo docker container run -it --net=host --pid=host --ipc=host alpine ash
sudo docker -D
sudo cat /etc/docker/daemon.json
sudo docker container run alpine echo "hello world"

sudo journalctl -u docker.service

cat Dockerfile
echo '
FROM alpine:3.8
RUN apk add --update nginx && mkdir /tmp/nginx && rm -rf /var/cache/apk/*
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
' > Dockerfile
cat Dockerfile
sudo docker image build -t sampleimage3 --no-cache - < Dockerfile
sudo docker images

sudo docker network create br0 --subnet 192.168.2.1/24
sudo docker network ls

sudo docker container run -d --network br0 --name br0demo redis
sudo docker container inspect br0demo

sudo docker network rm br0

sudo dockerd --log-driver=none
sudo dockerd --log-driver=syslog
sudo docker container run -it --log-driver syslog alpine ash
sudo docker events --since '2015-01-01'
sudo docker events --filter 'event=start'
sudo docker events --filter 'image=alpine:3.5'
sudo docker events --format 'ID={{.ID }} Type={{.Type}} Status={{.Status}}'

sudo docker events --format '{{json .}}'


