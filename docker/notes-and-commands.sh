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
