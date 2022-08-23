ip -c link show
cat /etc/network/interface
ls -anp /etc/network/interfaces.d/
sudo vi /etc/network/intrefaces.d/eth0
sudo nano /etc/network/intrefaces.d/eth0

# dhcp config
auto eth0
iface eth0 inet static
# static config
iface eth0 inet static
address 172.22.230.228
netmask 255.255.255.0
gateway 172.22.230.254
dns-nameservers 8.8.8.8 4.2.2.4

sudo systemctl restart NetworkManager.service
sudo systemctl restart networking

ip -c link show
ip link
ip link show
ifconfig
ip addr
