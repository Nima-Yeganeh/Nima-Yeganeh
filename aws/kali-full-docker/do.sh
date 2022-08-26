sudo docker image rm kali-linux-full
sudo docker image rm yeganehnimadgmailcom/kali-linux-full
sudo docker image build -t kali-linux-full .
sudo docker images
sudo docker image ls | grep kali-linux-full
sudo docker image tag kali yeganehnimadgmailcom/kali-linux-full
sudo docker images | grep kali-linux-full
# sudo docker image push yeganehnimadgmailcom/kali-linux-full
