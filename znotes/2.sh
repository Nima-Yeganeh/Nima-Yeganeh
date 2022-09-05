# Terraform Automation
# Deployment Automation
# Infrastructure as Code
# Building, changing, versioning
# ubuntu 20 or 22 vps >> terraform machine
# https://www.terraform.io/downloads
sudo apt-get update
wget LINK
ls -lrth
sudo apt install unzip
unzip terraform.zip
sudo mv terraform /usr/local/bin
cd /usr/local/bin
terraform version
cd /root/
terraform

# or official installation >> ubuntu/debian
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform

# official installation >> centos
sudo yum install -y yum-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

sudo yum -y install terraform


vi myvar.tf
variable "myfirstvar" {
    type = string
    default = "Hello! Welcome to Terraform!"
}

git pull
terraform version
