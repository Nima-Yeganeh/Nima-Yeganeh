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


