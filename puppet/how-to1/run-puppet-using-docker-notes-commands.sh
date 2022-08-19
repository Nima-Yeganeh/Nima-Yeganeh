# Docker is an Opensource Container based technology. It is giving us a workflow around containers which is much easy to use. Docker separates application from underlying operating system using container technology, similar to how Virtual Machines separate the operating system from underlying hardware.

# Docker Container Vs Virtual Machines
# The Virtual Machines includes applications, necessary binaries and libraries along with an entire guest operating systems which may weigh around 10s of GBs
# While, the Docker Engine container comprises just the application and its dependencies. It runs as an isolated process in the user space on the host operating system, sharing the kernel with other containers. Thus, it enjoys the resource isolation and allocation benefits of VMs, but is much more fast, portable, scalable and efficient.

# Docker Benefits
# Scalability : These containers are extremely lightweight which makes scaling up and scaling down very fast and very easy to launch more containers as we need them or shut them down as we no longer need them.
# Portablility : We can move them very easily. We're going to get into images and registries. But essentially, we can take  snapshots of  our environment and upload it to the public/private registry and then download that images for making containers of it anywhere.
# Deployments : We can run  these containers almost anywhere  to deploy it namely Desktops, laptops, Virtual machines, Public/Private clouds etc.

# docker installation and pre-req
arch
uname -r
apt-get update
apt-get install apt-transport-https ca-certificates
cat /etc/apt/sources.list.d/docker.list
apt-get purge lxc-docker
apt-cache policy docker-engine
apt-get install linux-image-extra-$(uname -r)
apt-get install docker-engine
service docker start
docker run hello-world
docker run -it ubuntu bash
docker pull ubuntu
docker images

# Creating Puppet inside a Docker container
# For creating puppet containers, first we need to download the Puppet packages from the docker hub.
# puppet/puppet-agent-ubuntu
# puppet/puppetserver
# puppet/puppetdb
# puppet/puppetdb-postgres
docker pull puppet/puppetserver
docker pull puppet/puppetdb
docker pull puppet/puppetdb-postgres
docker pull puppet/puppet-agent-ubuntu
docker network create puppet
docker network ls
docker ps
docker run --net puppet --name puppet-client --hostname puppet-client-linoxide puppet/puppet-agent-ubuntu agent --verbose --no-daemonize --summarize

docker ps
git clone https://github.com/tizzo/docker-puppetdb.git
cd docker-puppetdb/
docker build -t puppetdbpostgres .
docker run --net puppet --name puppetdb-postgres -e POSTGRES_PASSWORD=puppetdb -e POSTGRES_USER=puppetdb -d postgres
docker run --net puppet -d -P --name puppetdb --link puppetdb-postgres:postgres puppet/puppetdb
docker ps

# We can access our PuppetDB Dashboard at the URL >>http://Docker-Server-IP:32771
