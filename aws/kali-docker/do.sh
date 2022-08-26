sudo docker image rm kali
sudo docker image rm yeganehnimadgmailcom/kali
sudo docker image build -t kali .
sudo docker images
sudo docker image ls | grep kali
sudo docker image tag kali yeganehnimadgmailcom/kali
sudo docker images | grep kali
# sudo docker image push yeganehnimadgmailcom/kali
