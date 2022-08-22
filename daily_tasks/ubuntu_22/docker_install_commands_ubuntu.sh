sudo apt-get update -y
sudo apt-get install -y ca-certificates curl gnupg lsb-release

sudo apt install -y python3 python3-pip
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
cat /etc/apt/sources.list.d/docker.list

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-cache madison docker-ce
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo pip install docker-compose

sudo docker run hello-world
sudo docker run -d alpine
sudo docker run -d ubuntu
sudo docker run -d centos

# how to remove ?!
sudo apt-get remove -y docker docker-engine docker.io containerd runc
