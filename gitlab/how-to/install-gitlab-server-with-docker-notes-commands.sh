# Gitlab CE or Community Edition is an open-source application used to host your Git repositories. Self-hosting your Git repositories gives you total control over your data while providing an easy to use interface for you and your team members.
# Install Gitlab
# Download Gitlab's Docker image from Dockerhub. This image contains everything you need to run Docker - nginx, PostgreSQL, Redis, etc. Run the following command to download the image.
docker pull gitlab/gitlab-ee:latest

# It will take a little while to download the complete the image. When the job is finished, you can run the following command to check all the images currently on your system.
docker images

# Run Gitlab
# We can run Gitlab container straight away at this point by supplying all the options in a single command but that would mean every time you need to run the container, you need to supply these variables. Docker Compose makes this process easier as it will allow you to save the configuration into a .yml file which will be then used to run and launch the container.
# Create a docker-compose.yml.
nano docker-compose.yml
# or
vi docker-compose.yml

# Paste the following code.
web:
  image: 'gitlab/gitlab-ee:latest'
  container_name: 'gitlab-nima-tutorial'
  restart: always
  hostname: 'gitlab.example.com'
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'https://gitlab.example.com'
      gitlab_rails['smtp_enable'] = true
	  gitlab_rails['smtp_address'] = "smtp.gmail.com"
      gitlab_rails['smtp_port'] = 587
      gitlab_rails['smtp_user_name'] = "user@gmail.com"
      gitlab_rails['smtp_password'] = "app-password"
      gitlab_rails['smtp_domain'] = "smtp.gmail.com"
      gitlab_rails['smtp_authentication'] = "login"
      gitlab_rails['smtp_enable_starttls_auto'] = true
      gitlab_rails['smtp_tls'] = false
      gitlab_rails['smtp_openssl_verify_mode'] = 'peer'
      # Add any other gitlab.rb configuration here, each on its own line
  ports:
    - '80:80'
    - '443:443'
    - '22:22'
    - '587:587'
  volumes:
    - '/srv/gitlab/config:/etc/gitlab'
    - '/srv/gitlab/logs:/var/log/gitlab'
    - '/srv/gitlab/data:/var/opt/gitlab'

# Let's see what each of the options above means.
# image refers to the location of the Docker image of Gitlab on Dockerhub.
# container_name allows you to apply a label to your docker container, for use when referencing the container within a Docker network.
# hostname defines the container's internal hostname or in our case, the URL at where your Gitlab will be installed.
# restart specifies a restart policy for the container. We have set it to always which means a container if exited, will automatically get restarted.
# environment supplies the variable GITLAB_OMNIBUS_CONFIG which allows you to enter any Gitlab configuration setting. In this case, we supplied the external URL that Gitlab is supposed to use.
# volume defines the directories mounted on in the server to store persistent data. The three volumes/directories store application data, log files and configuration files. The value to the left of the semi-colon is the local directory on the server, and the value to the right is the directory inside the container.
# publish tells the container to publish ports or a range of ports to the host. Since Gitlab needs ports 22(SSH), 80(HTTP), 443(HTTPS) and 587(SMPT - MSA), we have specified them here. If you want Gitlab to use a non-standard port on your server (probably because it's not available), you would provide the host port first and then the container port. For eg, since your server is already using SSH(22) port, you can tell Gitlab to use SSH via a different port, say 3333. Then you would change 22:22 in the above file to 3333:22. You will also need to add the line gitlab_rails['gitlab_shell_ssh_port'] = 3333 under GITLAB_OMNIBUS_CONFIG above.
# external_url refers to the domain where your Gitlab will be installed. We have chosen https which will automatically install Let's Encrypt SSL certificate for us.
# We have also added additional configuration to configure Gitlab to use Gmail for sending mails. You can use any 3rd party SMTP mail service. Gitlab docs have maintained a detailed guide on how to configure various SMTP services with it.

# Make sure you are in the same directory as docker-compose.yml. Run the following command to start Gitlab.
docker-compose up -d

# It will take several more minutes before you can access Gitlab via the browser. You can find out more about the startup process via the following command.
docker logs -f gitlab-nima-tutorial

# Load the Gitlab site in your browser. If you try to load it too shortly after starting the container, you will get the 502 error. If that happens, wait for a few more minutes and try again.

# Configure Gitlab
# Provide a password for Gitlab's Administrator Password. You will be taken to the login screen next. Use root as the username and password you just chose to log in.

# Manage Gitlab Container
docker-ps
docker stop gitlab-nima-tutorial
docker start gitlab-nima-tutorial
docker container rm gitlab-nima-tutorial

# Upgrade Gitlab
# If you want to upgrade Gitlab to the newest version, you need to stop and remove the existing container, pull the latest image and then recreate the container.
docker stop gitlab-nima-tutorial
docker rm gitlab-nima-tutorial
docker pull gitlab/gitlab-ee:latest
docker-compose up -d

# git lab user pass >> default user: root
docker exec -it gitlab-nima-tutorial cat /etc/gitlab/initial_root_password
