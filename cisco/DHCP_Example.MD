# DHCP

ip dhcp excluded-address 172.16.1.1 172.16.1.50
ip dhcp excluded-address 172.16.2.1 172.16.2.100
!
ip dhcp pool subnet-left
network 172.16.1.0 255.255.255.0
dns-server 172.16.1.12
default-router 172.16.1.1
lease 0 23 59
domain-name example.com
!
ip dhcp pool subnet-right
network 172.16.2.0 /24
dns-server 172.16.1.12
default-router 172.16.2.1
lease 1 2 3

# show ip dhcp binding
# show ip dhcp pool subnet-right
# show ip dhcp conflict
# ipconfig /all
