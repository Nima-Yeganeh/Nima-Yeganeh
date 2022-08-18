# docker-compose.yml >> second example
version: '3.7'
services:
  web:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    hostname: 'gitlabtest.domain.local'
    container_name: gitlab-ce
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://gitlabtest.domain.local'
    ports:
      - '8080:80'
      - '8443:443'
    volumes:
      - '$GITLAB_HOME/config:/etc/gitlab'
      - '$GITLAB_HOME/logs:/var/log/gitlab'
      - '$GITLAB_HOME/data:/var/opt/gitlab'
    networks:
      - gitlab
  gitlab-runner:
    image: gitlab/gitlab-runner:alpine
    container_name: gitlab-runner
    restart: always
    depends_on:
      - web
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - '$GITLAB_HOME/gitlab-runner:/etc/gitlab-runner'
    networks:
      - gitlab
networks:
  gitlab:
    name: gitlab-network

# This configuration defines what containers we want to run. In our case, it will be the GitLab service with one GitLab runner (a separate module for running CI / CD tasks). The most important configuration parameters are:
# image – docker image that we want to use in our server
# ports – a list of ports that we make available outside the container. In our configuration, we provide ports 80, 443 (website)
# container_name – the name of our container
# volumes – specifies the volumes that are used by the container. In our configuration, we have directories shared with our system (subdirectories in $ GITLAB_HOME) and an additional volume that allows access to the Docker environment from the GitLab runner.
# networks – defines the virtual network in which the containers will operate. In our case, the www portal and the runner operate in one “gitlab-network”



# commands >>
docker-compose up -d
docker logs -f gitlab-nima-tutorial
docker-ps
docker stop gitlab-nima-tutorial
docker start gitlab-nima-tutorial
docker container rm gitlab-nima-tutorial
docker stop gitlab-nima-tutorial
docker rm gitlab-nima-tutorial
docker pull gitlab/gitlab-ee:latest
docker-compose up -d
docker exec -it gitlab-nima-tutorial cat /etc/gitlab/initial_root_password
