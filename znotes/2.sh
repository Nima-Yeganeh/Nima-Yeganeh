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

# check it
terraform version

vi myvar.tf
variable "myfirstvar" {
    type = string
    default = "Hello! Welcome to Terraform!"
}

git pull
terraform version
terraform console
var.myfirstvar

"${var.myfirstvar}"

vi create_aws_instance.tf
provider "aws" {
    access_key  = ""
    secret_key  = ""
    region      = "us-east-1"
}
resource "aws_instance" "MyFirstInstance" {
    ami             = ""
    instance_type   = "t2.micro"
}

git pull
ls
terraform init
terraform plan
terraform apply
terraform destroy
terraform plan -out myfirstplan.out
ls
terraform apply "myfirstplan.out"
terraform destroy

vi aws_provider.tf
provider "aws" {
    access_key  = ""
    secret_key  = ""
    region      = "us-east-1"
}

vi create_aws_instance2.tf
resource "aws_instance" "MySecondInstance" {
    ami             = ""
    instance_type   = "t2.micro"
}

terraform plan
terraform apply

# or provide creds in env var
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""

env | grep -i aws
printenv

git pull
terraform plan
terraform plan -var AWS_ACCESS_KEY="" -var AWS_SECRET_KEY=""
terraform create

