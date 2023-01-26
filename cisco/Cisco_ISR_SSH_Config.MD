# SSH Config
ip domain-name domain.local
crypto key generate rsa
2048
ip ssh version 2
username nima pri 15 sec nima
line vty 0 15
transport input ssh telnet
login local
