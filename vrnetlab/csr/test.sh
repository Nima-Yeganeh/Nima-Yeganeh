git pull
pwd
ls -anp
wget http://37.156.146.163/PUB/Cisco/IOS/CSR1000v/csr1000v-universalk9.16.06.08.qcow2
ls -anp
sudo make docker-image
sudo docker ps
sudo docker images
sudo docker rm -f my-vr-csr
sudo docker run -d --privileged --name my-vr-csr vr-csr
sudo docker ps
sudo docker ps -a
