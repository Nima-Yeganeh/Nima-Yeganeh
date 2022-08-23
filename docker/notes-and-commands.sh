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

