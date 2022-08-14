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
external_url 'http://gitlab.example.local'
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
systemctl status gitlab-runner
# To register the runner, you need to get the project token and the GitLab URL:
# In your GitLab project, navigate to Settings > CI/CD > Runners.
# In the Set up a specific Runner manually section, you’ll find the registration token and the GitLab URL. Copy both to a text editor; you’ll need them for the next command. They will be referred to as https://your_gitlab.com and project_token.
# Back to your terminal, register the runner for your project:
sudo gitlab-runner register -n --url https://your_gitlab.com --registration-token project_token --executor docker --description "Deployment Runner" --docker-image "docker:stable" --tag-list deployment --docker-privileged
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
# Next, generate a 4096-bit SSH key. It is important to answer the questions of the ssh-keygen command correctly:
# First question: answer it with ENTER, which stores the key in the default location (the rest of this tutorial assumes the key is stored in the default location).
# Second question: configures a password to protect the SSH private key (the key used for authentication). If you specify a passphrase, you’ll have to enter it each time the private key is used. In general, a passphrase adds another security layer to SSH keys, which is good practice. Somebody in possession of the private key would also require the passphrase to use the key. For the purposes of this tutorial, it is important that you have an empty passphrase, because the CI/CD pipeline will execute non-interactively and therefore does not allow to enter a passphrase.
# To summarize, run the following command and confirm both questions with ENTER to create a 4096-bit SSH key and store it in the default location with an empty passphrase:
ssh-keygen -b 4096
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

