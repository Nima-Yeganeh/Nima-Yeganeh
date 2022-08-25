git pull
pwd
ls -anp
wget https://download.mikrotik.com/routeros/7.4.1/chr-7.4.1.vmdk
ls -anp
sudo make docker-image
sudo docker ps
sudo docker images
sudo docker rm -f my-vr-routeros
sudo docker run -d --privileged --name my-vr-routeros vr-routeros
sudo docker ps
sudo docker ps -a
