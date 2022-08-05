sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo cp -f vscode.repo /etc/yum.repos.d/vscode.repo
sudo cat /etc/yum.repos.d/vscode.repo
sudo yum install -y code
sudo yum update -y
sudo yum upgrade -y

