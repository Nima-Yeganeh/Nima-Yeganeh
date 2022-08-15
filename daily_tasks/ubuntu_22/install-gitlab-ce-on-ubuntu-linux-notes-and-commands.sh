
# Step 1: Update system & install dependencies
# Kickoff the installation by ensuring your system is updated:
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y net-tools

# Install GitLab dependencies below:
sudo apt install -y ca-certificates curl openssh-server tzdata

# Step 2: Configure Postfix Send-Only SMTP Server
# GitLab should be able to send emails to you on Git activities. Configure Postfix SMTP Server using the guide below:
sudo apt update
sudo hostnamectl set-hostname server1.example.com
sudo apt install mailutils
cat /etc/postfix/main.cf
inet_interfaces = loopback-only
myhostname=myserver.example.com
sudo systemctl restart postfix
echo "Postfix Send-Only Server" | mail -s "Postfix Testing" userx@example.com
mail -s "Mail Subject" user@example.com < /home/jmutai/file.txt

# Step 3: Add the GitLab CE Repository
# Install dependency packages required:
sudo apt update
sudo apt install curl debian-archive-keyring lsb-release ca-certificates apt-transport-https software-properties-common -y

# Import GitLab repo GPG key
gpg_key_url="https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey"
curl -fsSL $gpg_key_url | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/gitlab.gpg

# Add repository contents to /etc/apt/sources.list.d/gitlab_gitlab-ce.list file.
sudo tee /etc/apt/sources.list.d/gitlab_gitlab-ce.list<<EOF
deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ focal main
deb-src https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ focal main
EOF
cat /etc/apt/sources.list.d/gitlab_gitlab-ce.list

# Confirm configured repository is working by updating APT package index.
sudo apt update
# The repository contents are added to:
cat /etc/apt/sources.list.d/gitlab_gitlab-ce.list
# Once the repository has been added, install GitLab CE on Ubuntu 22.04|20.04|18.04 using the apt package manager command:
sudo apt update
sudo apt install gitlab-ce

# Edit the GitLab configuration file to set hostname and other parameters:
sudo cat /etc/gitlab/gitlab.rb
sudo vi /etc/gitlab/gitlab.rb
external_url 'http://gitlab.example.com'
external_url 'http://gitlab.domain.local'

# Replace gitlab.example.com with valid domain for GitLab server.
# When done, start your GitLab instance by running the following command:
sudo gitlab-ctl reconfigure
# All GitLab services should be started after configuration.

# Step 5: Access GitLab CE Web Interface
# open the URL http://gitlab.example.com on your browser to finish the installation of Gitlab.
# A password for root user is randomly generated and stored for 24 hours in /etc/gitlab/initial_root_password. You can check the password with the commands below:
sudo cat /etc/gitlab/initial_root_password
# Example >> Password: kOtOjWp7v70OjkjtadnSJAhcDbCNo9nTNGVC5UoSCyE=
# Use this password with username root to login.
# Reset root user password
# Go to root user profile > Preferences
# Then Password section
# Input the current password, and set new one.

# Whenever you edit GitLab configuration file – /etc/gitlab/gitlab.rb,reconfigure GitLab service by running:
sudo gitlab-ctl reconfigure
sudo gitlab-rake gitlab:check
# To check the status of all GitLab service, use:
sudo gitlab-ctl status
# To stop all GitLab services, use:
sudo gitlab-ctl stop
# To restart all GitLab services, use:
sudo gitlab-ctl restart
# You can restart a specific service by proving service name at the end
sudo gitlab-ctl restart logrotate

sudo ufw status
sudo ufw allow http
sudo ufw allow https
sudo ufw allow OpenSSH
sudo ufw status

sudo cat ~/.ssh/id_rsa.pub
sudo ssh-keygen
sudo cat /root/.ssh/id_rsa
sudo cat /root/.ssh/id_rsa.pub
sudo cat ~/.ssh/id_rsa.pub

# nameserver 178.22.122.100

# In order to install the gitlab-runner service, you’ll add the official GitLab repository. Download and inspect the install script:
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh > script.deb.sh
less script.deb.sh
# Once you are satisfied with the safety of the script, run the installer:
sudo bash script.deb.sh
# Next install the gitlab-runner service:
sudo apt install gitlab-runner

# Verify the installation by checking the service status:
sudo systemctl status gitlab-runner
sudo systemctl start gitlab-runner
sudo systemctl enable gitlab-runner

# To register the runner, you need to get the project token and the GitLab URL:
# In your GitLab project, navigate to Settings > CI/CD > Runners.
# In the Set up a specific Runner manually section, you’ll find the registration token and the GitLab URL. Copy both to a text editor; you’ll need them for the next command. They will be referred to as https://your_gitlab.com and project_token.
# Back to your terminal, register the runner for your project:
sudo gitlab-runner register -n --url https://your_gitlab.com --registration-token project_token --executor docker --description "Deployment Runner" --docker-image "docker:stable" --tag-list deployment --docker-privileged
sudo gitlab-runner register -n --url http://gitlab.domain.local --registration-token 73rHm4AkaExMSsuVx2jW --executor docker --description "Deployment Runner" --docker-image "docker:stable" --tag-list deployment --docker-privileged
sudo cat /etc/gitlab-runner/config.toml

sudo gitlab-runner register -n --url http://gitlab.domain.local --registration-token GR134894146_R4wESuBoomKecKJex --executor docker --description "Deployment Runner" --docker-image "docker:stable" --tag-list deployment --docker-privileged
sudo cat /etc/gitlab-runner/config.toml

# The command options can be interpreted as follows:
# -n executes the register command non-interactively (we specify all parameters as command options).
# --url is the GitLab URL you copied from the runners page in GitLab.
# --registration-token is the token you copied from the runners page in GitLab.
# --executor is the executor type. docker executes each CI/CD job in a Docker container (see GitLab’s documentation on executors).
# --description is the runner’s description, which will show up in GitLab.
# --docker-image is the default Docker image to use in CI/CD jobs, if not explicitly specified.
# --tag-list is a list of tags assigned to the runner. Tags can be used in a pipeline configuration to select specific runners for a CI/CD job. The deployment tag will allow you to refer to this specific runner to execute the deployment job.
# --docker-privileged executes the Docker container created for each CI/CD job in privileged mode. A privileged container has access to all devices on the host machine and has nearly the same access to the host as processes running outside containers (see Docker’s documentation about runtime privilege and Linux capabilities). The reason for running in privileged mode is so you can use Docker-in-Docker (dind) to build a Docker image in your CI/CD pipeline. It is good practice to give a container the minimum requirements it needs. For you it is a requirement to run in privileged mode in order to use Docker-in-Docker. Be aware, you registered the runner for this specific project only, where you are in control of the commands being executed in the privileged container.
# Verify the registration process by going to Settings > CI/CD > Runners in GitLab, where the registered runner will show up.

# Creating a Deployment User
# You are going to create a user that is dedicated for the deployment task. You will later configure the CI/CD pipeline to log in to the server with that user.
# On your server, create a new user:
sudo adduser deployer
# You’ll be guided through the user creation process. Enter a strong password and optionally any further user information you want to specify. Finally confirm the user creation with Y.
# Add the user to the Docker group:
sudo usermod -aG docker deployer
# This permits deployer to execute the docker command, which is required to perform the deployment.
# You are going to create an SSH key for the deployment user. GitLab CI/CD will later use the key to log in to the server and perform the deployment routine.
# Let’s start by switching to the newly created deployer user for whom you’ll generate the SSH key:
su deployer
whoami
# Next, generate a 4096-bit SSH key. It is important to answer the questions of the ssh-keygen command correctly:
# First question: answer it with ENTER, which stores the key in the default location (the rest of this tutorial assumes the key is stored in the default location).
# Second question: configures a password to protect the SSH private key (the key used for authentication). If you specify a passphrase, you’ll have to enter it each time the private key is used. In general, a passphrase adds another security layer to SSH keys, which is good practice. Somebody in possession of the private key would also require the passphrase to use the key. For the purposes of this tutorial, it is important that you have an empty passphrase, because the CI/CD pipeline will execute non-interactively and therefore does not allow to enter a passphrase.
# To summarize, run the following command and confirm both questions with ENTER to create a 4096-bit SSH key and store it in the default location with an empty passphrase:
ssh-keygen -b 4096
cat /home/deployer/.ssh/id_rsa
ls -anp /home/deployer/.ssh/
cat /home/deployer/.ssh/id_rsa.pub
# To authorize the SSH key for the deployer user, you need to append the public key to the authorized_keys file:
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# ~ is short for the user home in Linux. The cat program will print the contents of a file; here you use the >> operator to redirect the output of cat and append it to the authorized_keys file.

# Storing the Private Key in a GitLab CI/CD Variable
# You are going to store the SSH private key in a GitLab CI/CD file variable, so that the pipeline can make use of the key to log in to the server.
# When GitLab creates a CI/CD pipeline, it will send all variables to the corresponding runner and the variables will be set as environment variables for the duration of the job. In particular, the values of file variables are stored in a file and the environment variable will contain the path to this file.
# While you’re in the variables section, you’ll also add a variable for the server IP and the server user, which will inform the pipeline about the destination server and user to log in.

# Start by showing the SSH private key:
cat ~/.ssh/id_rsa
# Copy the output to your clipboard. Make sure to add a linebreak after -----END RSA PRIVATE KEY-----:
# Now navigate to Settings > CI / CD > Variables in your GitLab project and click Add Variable. Fill out the form as follows:
# Key: ID_RSA
# Value: Paste your SSH private key from your clipboard (including a line break at the end).
# Type: File
# Environment Scope: All (default)
# Protect variable: Checked
# Mask variable: Unchecked
# A file containing the private key will be created on the runner for each CI/CD job and its path will be stored in the $ID_RSA environment variable.

# Create another variable with your server IP. Click Add Variable and fill out the form as follows:
# Key: SERVER_IP
# Value: your_server_IP
# Type: Variable
# Environment scope: All (default)
# Protect variable: Checked
# Mask variable: Checked

# Finally, create a variable with the login user. Click Add Variable and fill out the form as follows:
# Key: SERVER_USER
# Value: deployer
# Type: Variable
# Environment scope: All (default)
# Protect variable: Checked
# Mask variable: Checked

# Configuring the .gitlab-ci.yml File
# You are going to configure the GitLab CI/CD pipeline. The pipeline will build a Docker image and push it to the container registry. GitLab provides a container registry for each project. You can explore the container registry by going to Packages & Registries > Container Registry in your GitLab project.

# Now you’re going to create the .gitlab-ci.yml file that contains the pipeline configuration. In GitLab, go to the Project overview page, click the + button and select New file. Then set the File name to .gitlab-ci.yml.
# To begin add the following:
stages:
  - publish
  - deploy

# Each job is assigned to a stage. Jobs assigned to the same stage run in parallel (if there are enough runners available). Stages will be executed in the order they were specified. Here, the publish stage will go first and the deploy stage second. Successive stages only start when the previous stage finished successfully (that is, all jobs have passed). Stage names can be chosen arbitrarily.
# When you want to combine this CD configuration with your existing CI pipeline, which tests and builds the app, you may want to add the publish and deploy stages after your existing stages, such that the deployment only takes place if the tests passed.
# Following this, add this to your .gitlab-ci.yml file:
variables:
  TAG_LATEST: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_NAME:latest
  TAG_COMMIT: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_NAME:$CI_COMMIT_SHORT_SHA

# The variables section defines environment variables that will be available in the context of a job’s script section. These variables will be available as usual Linux environment variables; that is, you can reference them in the script by prefixing with a dollar sign such as $TAG_LATEST. GitLab creates some predefined variables for each job that provide context specific information, such as the branch name or the commit hash the job is working on (read more about predefined variable). Here you compose two environment variables out of predefined variables. They represent:

# CI_REGISTRY_IMAGE: Represents the URL of the container registry tied to the specific project. This URL depends on the GitLab instance. For example, registry URLs for gitlab.com projects follow the pattern: registry.gitlab.com/your_user/your_project. But since GitLab will provide this variable, you do not need to know the exact URL.
# CI_COMMIT_REF_NAME: The branch or tag name for which project is built.
# CI_COMMIT_SHORT_SHA: The first eight characters of the commit revision for which the project is built.
# Both of the variables are composed of predefined variables and will be used to tag the Docker image.

# TAG_LATEST will add the latest tag to the image. This is a common strategy to provide a tag that always represents the latest release. For each deployment, the latest image will be overridden in the container registry with the newly built Docker image.

# TAG_COMMIT, on the other hand, uses the first eight characters of the commit SHA being deployed as the image tag, thereby creating a unique Docker image for each commit. You will be able to trace the history of Docker images down to the granularity of Git commits. This is a common technique when doing continuous deployments, because it allows you to quickly deploy an older version of the code in case of a defective deployment.

# For your TAG_COMMIT variable you used the second option, where image will be replaced with the branch name.
# Next, add the following to your .gitlab-ci.yml file:
publish:
  image: docker:latest
  stage: publish
  services:
    - docker:dind
  script:
    - docker build -t $TAG_COMMIT -t $TAG_LATEST .
    - docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY
    - docker push $TAG_COMMIT
    - docker push $TAG_LATEST

# The publish section is the first job in your CI/CD configuration. Let’s break it down:
# image is the Docker image to use for this job. The GitLab runner will create a Docker container for each job and execute the script within this container. docker:latest image ensures that the docker command will be available.
# stage assigns the job to the publish stage.
# services specifies Docker-in-Docker—the dind service. This is the reason why you registered the GitLab runner in privileged mode.

# The script section of the publish job specifies the shell commands to execute for this job. The working directory will be set to the repository root when these commands will be executed.
# docker build ...: Builds the Docker image based on the Dockerfile and tags it with the latest commit tag defined in the variables section.
# docker login ...: Logs Docker in to the project’s container registry. You use the predefined variable $CI_BUILD_TOKEN as an authentication token. GitLab will generate the token and stay valid for the job’s lifetime.
# docker push ...: Pushes both image tags to the container registry.
# Following this, add the deploy job to your .gitlab-ci.yml:
deploy:
  image: alpine:latest
  stage: deploy
  tags:
    - deployment
  script:
    - chmod og= $ID_RSA
    - apk update && apk add openssh-client
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker pull $TAG_COMMIT"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker container rm -f my-app || true"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker run -d -p 80:80 --name my-app $TAG_COMMIT"

# Alpine is a lightweight Linux distribution and is sufficient as a Docker image here. You assign the job to the deploy stage. The deployment tag ensures that the job will be executed on runners that are tagged deployment, such as the runner you configured in Step 2.
# The script section of the deploy job starts with two configurative commands:
# chmod og= $ID_RSA: Revokes all permissions for group and others from the private key, such that only the owner can use it. This is a requirement, otherwise SSH refuses to work with the private key.
# apk update && apk add openssh-client: Updates Alpine’s package manager (apk) and installs the openssh-client, which provides the ssh command.

# In each ssh statement you are executing command on the remote server. To do so, you authenticate with your private key.
# The options are as follows:
# -i stands for identity file and $ID_RSA is the GitLab variable containing the path to the private key file.
# -o StrictHostKeyChecking=no makes sure to bypass the question, whether or not you trust the remote host. This question can not be answered in a non-interactive context such as the pipeline.
# $SERVER_USER and $SERVER_IP are the GitLab variables you created in Step 5. They specify the remote host and login user for the SSH connection.
# command will be executed on the remote host.
# The deployment ultimately takes place by executing these four commands on your server:
# docker login ...: Logs Docker in to the container registry.
# docker pull ...: Pulls the latest image from the container registry.
# docker container rm ...: Deletes the existing container if it exists. || true makes sure that the exit code is always successful, even if there was no container running by the name my-app. This guarantees a delete if exists routine without breaking the pipeline when the container does not exist (for example, for the first deployment).
# docker run ...: Starts a new container using the latest image from the registry. The container will be named my-app. Port 80 on the host will be bound to port 80 of the container (the order is -p host:container). -d starts the container in detached mode, otherwise the pipeline would be stuck waiting for the command to terminate.

# Note: It may seem odd to use SSH to run these commands on your server, considering the GitLab runner that executes the commands is the exact same server. Yet it is required, because the runner executes the commands in a Docker container, thus you would deploy inside the container instead of the server if you’d execute the commands without the use of SSH. One could argue that instead of using Docker as a runner executor, you could use the shell executor to run the commands on the host itself. But, that would create a constraint to your pipeline, namely that the runner has to be the same server as the one you want to deploy to. This is not a sustainable and extensible solution because one day you may want to migrate the application to a different server or use a different runner server. In any case it makes sense to use SSH to execute the deployment commands, may it be for technical or migration-related reasons.

# Let’s move on by adding this to the deployment job in your .gitlab-ci.yml:
deploy:
  environment:
    name: production
    url: http://your_server_IP
  only:
    - master

# GitLab environments allow you to control the deployments within GitLab. You can examine the environments in your GitLab project by going to Operations > Environments. If the pipeline did not finish yet, there will be no environment available, as no deployment took place so far.
# When a pipeline job defines an environment section, GitLab will create a deployment for the given environment (here production) each time the job successfully finishes. This allows you to trace all the deployments created by GitLab CI/CD. For each deployment you can see the related commit and the branch it was created for.
# There is also a button available for re-deployment that allows you to rollback to an older version of the software. The URL that was specified in the environment section will be opened when clicking the View deployment button.
# The only section defines the names of branches and tags for which the job will run. By default, GitLab will start a pipeline for each push to the repository and run all jobs (provided that the .gitlab-ci.yml file exists). The only section is one option of restricting job execution to certain branches/tags. Here you want to execute the deployment job for the master branch only.
# Your complete .gitlab-ci.yml file will look like the following:
stages:
  - publish
  - deploy

variables:
  TAG_LATEST: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_NAME:latest
  TAG_COMMIT: $CI_REGISTRY_IMAGE/$CI_COMMIT_REF_NAME:$CI_COMMIT_SHORT_SHA

publish:
  image: docker:latest
  stage: publish
  services:
    - docker:dind
  script:
    - docker build -t $TAG_COMMIT -t $TAG_LATEST .
    - docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY
    - docker push $TAG_COMMIT
    - docker push $TAG_LATEST

deploy:
  image: alpine:latest
  stage: deploy
  tags:
    - deployment
  script:
    - chmod og= $ID_RSA
    - apk update && apk add openssh-client
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker login -u gitlab-ci-token -p $CI_BUILD_TOKEN $CI_REGISTRY"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker pull $TAG_COMMIT"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker container rm -f my-app || true"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker run -d -p 80:80 --name my-app $TAG_COMMIT"
  environment:
    name: production
    url: http://your_server_IP
  only:
    - master

# Validating the Deployment
# Now you’ll validate the deployment in various places of GitLab as well as on your server and in a browser.
# When a .gitlab-ci.yml file is pushed to the repository, GitLab will automatically detect it and start a CI/CD pipeline. At the time you created the .gitlab-ci.yml file, GitLab started the first pipeline.
# Go to CI/CD > Pipelines in your GitLab project to see the pipeline’s status. If the jobs are still running/pending, wait until they are complete. You will see a Passed pipeline with two green checkmarks, denoting that the publish and deploy job ran successfully.

# Let’s examine the pipeline. Click the passed button in the Status column to open the pipeline’s overview page. You will get an overview of general information such as:
# Execution duration of the whole pipeline.
# For which commit and branch the pipeline was executed.
# Related merge requests. If there is an open merge request for the branch in charge, it would show up here.
# All jobs executed in this pipeline as well as their status.
# Next click the deploy button to open the result page of the deploy job.

# On the job result page you can see the shell output of the job’s script. This is the place to look for when debugging a failed pipeline. In the right sidebar you’ll find the deployment tag you added to this job, and that it was executed on your Deployment Runner.
# If you scroll to the top of the page, you will find the This job is deployed to production message. GitLab recognizes that a deployment took place because of the job’s environment section. Click the production link to move over to the production environment.

# You will have an overview of all production deployments. There was only a single deployment so far. For each deployment there is a re-deploy button available to the very right. A re-deployment will repeat the deploy job of that particular pipeline.
# Whether a re-deployment works as intended depends on the pipeline configuration, because it will not do more than repeating the deploy job under the same circumstances. Since you have configured to deploy a Docker image using the commit SHA as a tag, a re-deployment will work for your pipeline.

# Note: Your GitLab container registry may have an expiration policy. The expiration policy regularly removes older images and tags from the container registry. As a consequence, a deployment that is older than the expiration policy would fail to re-deploy, because the Docker image for this commit will have been removed from the registry. You can manage the expiration policy in Settings > CI/CD > Container Registry tag expiration policy. The expiration interval is usually set to something high, like 90 days. But when you run into the case of trying to deploy an image that has been removed from the registry due to the expiration policy, you can solve the problem by re-running the publish job of that particular pipeline as well, which will re-create and push the image for the given commit to registry.

# tshoot
sudo gitlab-runner verify
sudo gitlab-runner start
sudo gitlab-runner run

# Sample Project >> GitLab CI CD Hello World Test
# .gitlab-ci.yml
build-hello:
  script:
    - echo "hello world"

# Sample Project >> GitLab CI CD Docker Hello World
# dockerfile.txt
FROM alpine
RUN echo "hello"
# .gitlab-ci.yml
variables:
  DOCKER_DRIVER: overlay2
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_TLS_CERTDIR: ""
build-docker:
  image: docker:20-dind
  services:
    - name: docker:20-dind
      alias: docker
      command: ["--tls=false"]
  script:
    - docker build -t hello -f ./dockerfile.txt .

# docker-in-docker sample file >> gitlab test lab
build:docker:
  image: docker:20-dind
  variables:
    # using "docker" as the host is only possible if you alias the service below
    DOCKER_HOST: tcp://docker:2375 
    # could be wrong here but although Docker defaults to overlay2, 
    # Docker-in-Docker (DIND) does not according to the following GitLab doc: 
    # https://docs.gitlab.com/ee/ci/docker/using_docker_build.html#use-the-overlayfs-driver
    DOCKER_DRIVER: overlay2
    DOCKER_TLS_CERTDIR: ""
  services:
    - name: docker:20-dind
      alias: docker
      # in our experience although you'd assume this would be sufficient, this did 
      # nothing to prevent connection errors without `DOCKER_TLS_CERTDIR` being set 
      # to an empty string, and I would call that beyond mildly infuriating.
      command: ["--tls=false"]
  before_script:
    - echo ${REGISTRY_PASSWORD} | docker login ${REGISTRY} -u ${REGISTRY_USER} -- 
  password-stdin
    - *version_info
  script:
    - docker build .
      --tag ${CONTAINER_IMAGE}:$BUILD_VERSION
      --tag ${CONTAINER_IMAGE}:latest
    - docker push ${CONTAINER_IMAGE}:latest
    - docker push ${CONTAINER_IMAGE}:$BUILD_VERSION

# docker commands >> checking
sudo docker container ls -aq
sudo docker container rm $(sudo docker container ls -aq)
sudo docker ps -a
sudo docker images

# sample project >> docker-in-docker and nginx >> gitlab project
# index.html
<html>
<body>
<h1>My Personal Website</h1>
</body>
</html>

# dockerfile.txt
FROM nginx:1.18
COPY index.html /usr/share/nginx/html

# .gitlab-ci.yml
stages:
  - publish
  - deploy
variables:
  DOCKER_HUB_USER: "yeganehnimad"
  DOCKER_HUB_PASS: "yeganehnimad"
  TAG_NAME: "yeganehnimad/my-app"
  TAG_LATEST: $CI_COMMIT_REF_NAME:latest
  TAG_COMMIT: $CI_COMMIT_REF_NAME:$CI_COMMIT_SHORT_SHA
  DOCKER_DRIVER: overlay2
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_TLS_CERTDIR: ""  
publish:
  image:
    name: docker:20-dind
    pull_policy: always
  stage: publish
  services:
    - name: docker:20-dind
      alias: docker
      command: ["--tls=false"]
  script:
    - docker build -t $TAG_COMMIT -t $TAG_LATEST -t $TAG_NAME -f ./dockerfile.txt .
    - docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASS
    - docker push $TAG_NAME
    - docker container rm -f my-app || true
    - docker run -d -p 8001:80 --name my-app $TAG_COMMIT
deploy:
  image:
    name: alpine:latest
    pull_policy: always
  stage: deploy
  tags:
    - deployment
  script:
    - chmod og= $ID_RSA
    - apk update && apk add openssh-client
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASS"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker pull $TAG_NAME"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker container rm -f my-app || true"
    - ssh -i $ID_RSA -o StrictHostKeyChecking=no $SERVER_USER@$SERVER_IP "docker run -d -p 8001:80 --name my-app $TAG_NAME"
  environment:
    name: production-8001
    url: http://192.168.244.138:8001

