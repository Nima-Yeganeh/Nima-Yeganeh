# Create Docker-Compose.YAML
# Another best way to run Jenkins is by using the docker-compose command. By using docker-compose. yaml, you can deploy multiple Jenkins containers more quickly.
# Open your favourite text editor and create a new file named “docker-compose.yaml”, and paste the below YAML manifest into the file. And the save and exit.
# sudo vim docker-compose.yml
version: "3.9"
services:
  jenkins:
    image: jenkins/jenkins:lts
    container_name: jenkins-server
    privileged: true
    hostname: jenkinsserver
    user: root
    labels:
      com.example.description: "Jenkins-Server by nima"
    ports:
      - "8080:8080"
      - "50000:50000"
    networks:
      jenkins-net:
        aliases: 
          - jenkins-net
    volumes: 
     - jenkins-data:/var/jenkins_home
     - /var/run/docker.sock:/var/run/docker.sock
volumes: 
  jenkins-data:
networks:
  jenkins-net:

# You can change this docker-compose file as you want. But, here I’ll explain the most essential sections only.
# image = The base image name used to create a docker instance. Generally, this will be pulled from the docker hub docker registry.
# Ports = This defines port mapped between docker container and the docker host machine
# volume = This defines container data storage volume mapped between the docker container and the docker host machine. This allows accessing containerized data from the docker host.
# Container_name = This defines the name of the container that you are going to spin up. In here, I’m using “jenkins-server” as my container name.

docker-compose up -d

# http://<YOUR-IP-OR-FQDN>:8080/

docker exec jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword

docker run -v /var/run/docker.sock:/var/run/docker.sock -ti --name docker-test docker
docker run -v /var/run/docker.sock:/var/run/docker.sock -d --name docker-test docker

# check >> http://127.0.0.1:2375/containers/json
# check >> http://127.0.0.1:2375/images/json
