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
