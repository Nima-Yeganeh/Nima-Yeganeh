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
sudo docker system info | grep overlay

# direct-lvm
sudo vi /etc/docker/daemon.json
{
"storage-driver": "devicemapper",
"storage-opts": [
"dm.directlvm_device=/dev/xdf",
"dm.thinp_percent=95",
"dm.thinp_metapercent=1",
"dm.thinp_autoextend_threshold=80",
"dm.thinp_autoextend_percent=20",
"dm.directlvm_device_force=false"
]
}

# /var/run/docker.sock

docker image ls
docker image pull ubuntu:latest
docker image pull microsoft/powershell:nanoserver
docker images

docker container run -it ubuntu:latest /bin/bash
docker container run -it microsoft/powershell:nanoserver pwsh.exe

ps -elf
ps

docker container ls
docker container exec -it vigilant_borg bash
docker container start

docker container exec -it pensive_hamilton pwsh.exe

docker container stop vigilant_borg
docker container rm vigilant_borg

docker container ls -a

git clone https://github.com/Nima-Yeganeh/Nima-Yeganeh.git

docker image build -t docker-test-psweb:latest .
docker image ls
docker ps
docker container run -d --name web1 --publish 8080:8080 docker-test-psweb:latest
docker ps

# localhost:8080 or 127.0.0.1:8080

docker rm -f web1

docker container run --name ctr1 -it alpine:latest sh
ls /var/lib/docker/

docker image pull ubuntu:latest
docker image pull alpine:latest
docker image ls
docker image pull microsoft/powershell:nanoserver
docker image pull microsoft/dotnet:latest

docker image pull mongo:3.3.11
docker image pull redis:latest
docker image pull alpine

docker image ls --filter dangling=true
docker image prune
docker image ls --filter=reference="*:latest"
docker image ls --format "{{.Size}}"
docker image ls --format "{{.Repository}}: {{.Tag}}: {{.Size}}"

docker search ubuntu
docker search alpine

docker search alpine --filter "is-official=true"
docker search alpine --filter "is-automated=true"

docker image inspect ubuntu:latest
docker image ls --digests alpine
docker image rm alpine:latest

docker container run --rm golang go version
docker image rm $(docker image ls -q) -f

docker container run -it ubuntu /bin/bash
docker container run -it microsoft/powershell:nanoserver pwsh.exe

docker container run alpine:latest sleep 10
docker container run microsoft/powershell:nanoserver Start-Sleep -s 10

service docker status
systemctl is-active docker

Get-Service docker

docker container run -it ubuntu:latest /bin/bash
ps -elf

docker container exec -it myapp bash
docker container stop myapp
docker container rm myapp

docker container run --name percy -it ubuntu:latest /bin/bash
docker container exec -it percy bash

docker container run --name neversaydie -it --restart always microsoft/powershell:nanoserver
docker container run --name neversaydie -it --restart always ubuntu

docker container run -d --name always --restart always alpine sleep 1d
docker container run -d --name unless-stopped --restart unless-stopped alpine sleep 1d
docker container ls
docker container stop always unless-stopped
systemlctl restart docker
docker container ls -a

docker container run -d --name webserver -p 80:8080 nigelpoulton/pluralsight-docker-ci
docker image inspect nigelpoulton/pluralsight-docker-ci

docker container ls -aq
docker container rm $(docker container ls -aq) -f
docker image rm $(docker image ls -q)

cd docker-test-psweb
ls
docker image build -t docker-test-psweb2 .
docker image tag docker-test-psweb2 yeganehnimadgmailcom/docker-test-psweb2
docker login
docker image push yeganehnimadgmailcom/docker-test-psweb2
docker image ls
docker container run -d --name c1-docker-test-psweb2 -p 8081:8080 yeganehnimadgmailcom/docker-test-psweb2
docker ps

sudo docker image pull yeganehnimadgmailcom/docker-test-psweb2
sudo docker image ls
sudo docker container run -d --name c1-docker-test-psweb2 -p 8081:8080 yeganehnimadgmailcom/docker-test-psweb2
sudo docker ps

docker image history web:latest
docker image history yeganehnimadgmailcom/docker-test-psweb2
docker image inspect yeganehnimadgmailcom/docker-test-psweb2

cd docker-test-atsea-sample-shop-app
cd app
ls
docker image build -t multi:stage .

cd docker-test-counter-app
ls
docker-compose up -d

docker network ls
docker volume ls
docker-compose down
docker-compose top
docker-compose ps
docker-compose stop

docker-compose restart

docker volume inspect counterapp_counter-vol | grep Mount
docker volume inspect docker-test-counter-app_counter-vol
cp ~/counterapp/app.py /var/lib/docker/volumes/counterapp_counter-vol/_data/app.py

docker swarm init --advertise-addr 10.0.0.1:2377 --listen-addr 10.0.0.1:2377
docker node ls

docker swarm join-token worker
docker swarm join --token TOKEN 10.0.0.1:2377

docker swarm join-token manager
docker swarm join --token TOKEN 10.0.0.1:2377

docker swarm join --token TOKEN 10.0.0.1:2377 --advertise-addr 10.0.0.4:2377 --listen-addr 10.0.0.4:2377
docker swarm join --token TOKEN 10.0.0.1:2377 --advertise-addr 10.0.0.2:2377 --listen-addr 10.0.0.1:2377

docker node ls
docker swarm update --autolock=true
service docker restart

docker swarm unlock
docker service create --name web-fe -p 8080:8080 --replicas 5 nigelpoulton/pluralsight-docker-ci
docker service ps web-fe
docker service inspect --pretty web-fe
docker service scale web-fe=10

docker service scale web-fe=5
docker service rm web-fe

docker network create -d overlay uber-net

docker network ls
docker service create --name uber-svc --network uber-net -p 80:80 --replicas 12 nigelpoulton/tu-demo:v1

docker service ls
docker service ps uber-svc

docker service create --name uber-svc --network uber-net --publish published=80,target=80,mode=host --replicas 12 nigelpoulton/tu-demo:v1

docker service update \
--image nigelpoulton/tu-demo:v2 \
--update-parallelism 2 \
--update-delay 20s uber-svc

docker network inspect bridge
ip link show docker0
docker network inspect bridge | grep bridge.name
docker network create -d bridge localnet
docker network create -d nat localnet

brctl show

docker container run -d --name c1 \
--network localnet \
alpine sleep 1d
docker network inspect localnet --format '{{json .Containers}}'

 docker container run -it --name c2 \
--network localnet \
alpine sh

docker container run -it --name c2 --network localnet microsoft/powershell:nanoserver

ping c1


docker container run -d --name web \
--network localnet \
--publish 5000:80 \
nginx

docker port web

docker network create -d macvlan \
--subnet=10.0.0.0/24 \
--ip-range=10.0.00/25 \
--gateway=10.0.0.1 \
-o parent=eth0.100 \
macvlan100

docker service create -d --name svc1 \
--publish published=5000,target=80,mode=host \
nginx

docker container exec -it 396c8b142a85 bash
apt-get update
apt-get install iputils-ping

docker volume create myvol
docker volume inspect myvol
docker volume prune
docker volume rm


docker container run -dit --name voltainer \
--mount source=bizvol,target=/vol \
alpine

docker container run -dit --name voltainer --mount source=bizvol,target=c:\vol microsoft/powershell:nanoserver

ls -l /var/lib/docker/volumes/bizvol/_data/
cat /var/lib/docker/volumes/bizvol/_data/file1


