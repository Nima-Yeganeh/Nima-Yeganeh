enable
conf t

int vlan 1
ip address 172.28.117.x 255.255.255
exit

ip default-gateway 172.28.117.254

enable sec password
user cisco pri 15 sec password

line console 0
login
password password
line vty 0 15
login
password password

username admin pri 15 sec password

ip domain-name switch.local
crypto key generate rsa
1024 or 2048
ip http server
ip http secure-server

snmp-server enable informs
snmp-server enable traps
snmp-server ifindex persist
snmp-server community password ro
