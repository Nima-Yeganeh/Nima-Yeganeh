sudo apt update
sudo apt install net-tools
sudo apt-get install sudo
sudo adduser nima sudo

sudo cat /etc/apt/sources.list
sudo vi /etc/apt/sources.list
deb http://deb.debian.org/debian bullseye main
deb-src http://deb.debian.org/debian bullseye main

sudo cat /etc/apt/sources.list
sudo apt-get update

sudo apt -y install apt-transport-https
sudo apt -y install ca-certificates
sudo apt -y install gnupg2
sudo apt -y install software-properties-common
sudo apt remove libcurl4 -y
sudo apt install curl -y

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo cat /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
docker –version

sudo systemctl status docker
sudo docker run hello-world
sudo docker images
sudo docker ps -a

sudo systemctl start docker
sudo apt update -y
sudo systemctl enable docker
sudo docker run hello-world
sudo docker run -d alpine
sudo docker run -d centos
sudo docker run -d ubuntu
sudo apt update -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker container run hello-world
sudo docker ps -a
sudo docker images


sudo apt install -y curl
sudo apt update -y
sudo apt install -y jq
sudo apt install -y python3 python3-pip
sudo apt install -y python
sudo pip3 install --upgrade pip
sudo pip install --upgrade pip
sudo pip3 install docker-compose
