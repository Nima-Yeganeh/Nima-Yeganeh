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

# Gitlab installation
# Containers are started using the command:
docker-compose up -d

# To log in to GitLab for the first time, you need a temporary password, which is generated automatically during installation. We get the password using the command:
docker exec -it gitlab-ce grep 'Password:' /etc/gitlab/initial_root_password
docker exec -it gitlab-ce cat /etc/gitlab/initial_root_password

# GitLab launching
# Our GitLab is available at: http: //localhost:8080
# To log in to the portal, we must enter the “root” in Username field and the temporary password that we obtained earlier in the Password field.

# GitLab runner configuration
# To use the GitLab runner in GitLab, you need to configure it. For correct configuration, we will need a token copied from the portal. # To do this, go to the address: http://localhost:8080/admin/runners and click the Copy token button.
# In the next step, it goes to the console and run the following command:
docker exec -it gitlab-runner gitlab-runner register --url "http://gitlab-ce" --clone-url "http://gitlab-ce"

# After launching, a configuration module will appear. The module provides the following information:
# Enter the GitLab instance URL: confirm the entered value (click enter)
# Enter the registration token: enter the token copied before.
# Enter a description for the runner: enter the name of the runner, e.g. docker-runner
# Enter tags for the runner: leave the field blank here
# Enter an executor: enter docker here
# Enter the default Docker image: here we provide the default docker image, e.g. maven: latest
# After proper configuration, we should see confirmation Runner registred successfully:

# In addition to the basic configuration, we also need to allow access for containers launched from the runner to the virtual network in which GitLab operates. To do this, we run the editor (e.g. vi)
sudo vi gitlab/gitlab-runner/config.toml
# Then we add new line to the end of the runner configuration: network_mode = “gitlab-network”

# To check if the runner is available from the GitLab level, go to the following address:http://localhost:8080/admin/runners

# docker commands >>
docker-compose up -d
docker-compose down
docker logs -f gitlab-ce
docker-ps
docker stop gitlab-ce
docker start gitlab-ce
docker container rm gitlab-ce
docker stop gitlab-ce
docker rm gitlab-ce
docker pull gitlab/gitlab-ee:latest
docker-compose up -d
docker exec -it gitlab-ce cat /etc/gitlab/initial_root_password
