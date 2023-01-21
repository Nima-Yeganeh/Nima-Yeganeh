# C1117 
# IOS-XE
# BDI
# IPv4 access-lists
# IPv6 only has named extended access-lists

# IPv6 access-lists have three invisible statements at the bottom:
permit icmp any any nd-na
permit icmp any any nd-ns
deny ipv6 any any

service timestamps debug datetime msec
service timestamps log datetime msec
service call-home
platform qfp utilization monitor load 80
platform punt-keepalive disable-kernel-core
platform hardware throughput crypto 50000

hostname cisco.rt2

boot-start-marker
boot system bootflash:c1100-universalk9.17.06.03a.SPA.bin
boot-end-marker

aaa new-model

aaa authentication login local_authen local
aaa authorization exec local_author local

aaa session-id common
ip options drop

ip name-server {{ censored }}
ip domain name home.arpa
ip dhcp excluded-address 192.168.1.0 192.168.1.4

ip dhcp pool dhcp-1
network 192.168.1.0 255.255.255.0
default-router 192.168.1.1
dns-server 192.168.1.1

login on-success log
ipv6 icmp error-interval 50 20
ipv6 unicast-routing

subscriber templating
multilink bundle-name authenticated

license udi pid C1117-4P sn {{ censored }}
memory free low-watermark processor 70173

diagnostic bootup level minimal

spanning-tree extend system-id

username admin privilege 15 secret 9 $ {{ censored }}

redundancy
mode none

controller VDSL 0/2/0
operating mode vdsl2

vlan internal allocation policy ascending

interface GigabitEthernet0/0/0
ip address 192.168.2.1 255.255.255.0
ip nat inside
negotiation auto
no cdp enable
ipv6 address pd-ipv6 ::1:0:0:0:1/64
ipv6 enable
vlan-id dot1q 1

ip virtual-reassembly

interface GigabitEthernet0/1/0
no cdp enable

interface GigabitEthernet0/1/1
no cdp enable

interface GigabitEthernet0/1/2
no cdp enable

interface GigabitEthernet0/1/3
no cdp enable

interface ATM0/2/0
no ip address
atm oversubscribe factor 2

interface ATM0/2/0.1 point-to-point

interface Ethernet0/2/0
description Internet Interface
ip dhcp client request classless-static-route
ip address dhcp
no ip redirects
no ip proxy-arp
ip nat outside
ip access-group WAN4_IN in
no negotiation auto
no cdp enable
ipv6 address dhcp
ipv6 address pd-ipv6 ::1/64
ipv6 address autoconfig default
ipv6 enable
ipv6 dhcp client pd pd-ipv6
ipv6 traffic-filter WAN6_IN in

interface Vlan1
description Local Area Network
ip address 192.168.1.1 255.255.255.0

no ip http server
no ip http secure-server
ip forward-protocol nd
ip nat inside source list NATACL interface Ethernet0/2/0 overload
ip route 192.168.1.0 255.255.255.0 192.168.1.2 2 // Adjust for each range you want to be able to SSH in from, you can specify specific addresses, instead of entire subnets.
ip route 192.168.2.0 255.255.255.0 192.168.1.2 2
ip ssh version 2
ip scp server enable

ip access-list standard NATACL
10 permit 192.168.2.0 0.0.0.255
ip access-list standard SNMPACL
10 permit {{ some host if you want to get sync stats with SNMP }}
20 deny   any
ip access-list standard WAN4_IN

ip access-list extended SSH_ACL
10 permit tcp 192.168.30.0 0.0.0.255 any eq 22 // Adjust for each VLAN you want to be able to SSH in from
20 permit tcp 192.168.1.0 0.0.0.255 any eq 22
30 deny   tcp any any eq 22

snmp-server community public RO SNMPACL // Also not needed if you're not using SNMP

control-plane

line con 0
transport input none
stopbits 1
line vty 0 4
access-class SSH_ACL in
privilege level 15
transport input ssh
line vty 5 14
access-class SSH_ACL in
privilege level 15
transport input ssh

call-home
contact-email-addr no-call-home@no-call-home.home.arpa
data-privacy level high
profile "CiscoTAC-1"
active
destination transport-method http
destination address http http://no-call-home.home.arpa
no destination address http https://tools.cisco.com/its/service/oddce/services/DDCEService

end

