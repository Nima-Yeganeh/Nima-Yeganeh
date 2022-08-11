# install-and-use-docker-on-ubuntu-22
# Docker is an application that simplifies the process of managing application processes in containers. Containers let you run your applications in resource-isolated processes. They’re similar to virtual machines, but containers are more portable, more resource-friendly, and more dependent on the host operating system.
# The Docker installation package available in the official Ubuntu repository may not be the latest version. To ensure we get the latest version, we’ll install Docker from the official Docker repository. To do that, we’ll add a new package source, add the GPG key from Docker to ensure the downloads are valid, and then install the package.

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

# By default, the docker command can only be run the root user or by a user in the docker group, which is automatically created during Docker’s installation process. If you attempt to run the docker command without prefixing it with sudo or without being in the docker group, you’ll get an output like this:
sudo usermod -aG docker ${USER}
su - ${USER}
groups
sudo usermod -aG docker username

docker [option] [command] [arguments]
docker docker-subcommand --help
docker info

# Docker containers are built from Docker images. By default, Docker pulls these images from Docker Hub, a Docker registry managed by Docker, the company behind the Docker project. Anyone can host their Docker images on Docker Hub, so most applications and Linux distributions you’ll need will have images hosted there.
docker run hello-world
docker search ubuntu
docker pull ubuntu
docker images

docker run -it ubuntu
apt update
apt install nodejs
node -v

docker ps
docker ps -a
docker ps -l

docker start 1c08a7a0d0e4
docker stop dazzling_taussig
docker rm adoring_kowalevski

docker commit -m "What you did to the image" -a "Author Name" container_id repository/new_image_name
docker commit -m "added Node.js" -a "sammy" d9b100f2f636 sammy/ubuntu-nodejs
docker images
docker login -u docker-registry-username
docker tag sammy/ubuntu-nodejs docker-registry-username/ubuntu-nodejs
docker push docker-registry-username/docker-image-name
docker push sammy/ubuntu-nodejs

docker login
docker pull sammy/ubuntu-nodejs
