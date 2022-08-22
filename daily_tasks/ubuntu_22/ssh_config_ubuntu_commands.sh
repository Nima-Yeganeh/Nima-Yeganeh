sudo apt install openssh-server
sudo systemctl start sshd
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl -l --type service --all| grep ssh
sudo apt-get -y update

# If that doesn't solve your problem, you can reinstall ssh
sudo apt-get remove --purge openssh-server

sudo apt-get -y update
sudo apt-get -y install openssh-server
sudo systemctl status sshd

ssh 127.0.0.1
ssh root@127.0.0.1
ssh nima@127.0.0.1
