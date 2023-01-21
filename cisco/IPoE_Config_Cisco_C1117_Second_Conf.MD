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
!
hostname cisco.rt2
!
boot-start-marker
boot system bootflash:c1100-universalk9.17.06.03a.SPA.bin
boot-end-marker
!
!
!
aaa new-model
!
!
aaa authentication login local_authen local
aaa authorization exec local_author local
!
!
!
!
!
!
aaa session-id common
ip options drop
!
!
!
!
!
!
!
ip name-server {{ censored }}
ip domain name home.arpa
ip dhcp excluded-address 192.168.1.0 192.168.1.4
!
ip dhcp pool dhcp-1
network 192.168.1.0 255.255.255.0
default-router 192.168.1.1
dns-server 192.168.1.1
!
ip dhcp pool {{ some fixed host }}
host 192.168.1.2 255.255.255.0
hardware-address {{ censored }}
dns-server {{ censored }}
default-router 192.168.1.1
!
!
!
login on-success log
ipv6 icmp error-interval 50 20
ipv6 unicast-routing
!
!
!
!
!
!
!
subscriber templating
multilink bundle-name authenticated
!
!
!
license udi pid C1117-4P sn {{ censored }}
memory free low-watermark processor 70173
!
diagnostic bootup level minimal
!
spanning-tree extend system-id
!
username admin privilege 15 secret 9 {{ censored }}
!
redundancy
mode none
!
controller VDSL 0/2/0
operating mode vdsl2
!
!
vlan internal allocation policy ascending
!
!
!
!
!
!
interface GigabitEthernet0/0/0
no ip address
negotiation auto
no cdp enable
service instance 100 ethernet
encapsulation untagged
bridge-domain 100
!
!
interface GigabitEthernet0/1/0
no cdp enable
!
interface GigabitEthernet0/1/1
no cdp enable
!
interface GigabitEthernet0/1/2
no cdp enable
!
interface GigabitEthernet0/1/3
no cdp enable
!
interface ATM0/2/0
no ip address
atm oversubscribe factor 2
!
interface ATM0/2/0.1 point-to-point
!
interface Ethernet0/2/0
no ip address
no negotiation auto
no cdp enable
service instance 100 ethernet
encapsulation untagged
bridge-domain 100
!
!
interface Vlan1
description Local Area Network
ip address 192.168.1.1 255.255.255.0
ip virtual-reassembly
!
interface BDI100
no ip address
!
no ip http server
no ip http secure-server
ip forward-protocol nd
ip route 192.168.1.0 255.255.255.0 192.168.1.2 2
ip route 192.168.31.0 255.255.255.0 192.168.1.2 2 // Allow another VLAN to route to SSH, substitute with whatever you use LAN side
ip ssh version 2
ip scp server enable
!
!
ip access-list standard SNMPACL
10 permit {{ Some SNMP host }}
20 deny   any
ip access-list standard WAN4_IN
!
ip access-list extended SSH_ACL
10 permit tcp 192.168.31.0 0.0.0.255 any eq 22 // Allow another VLAN to access SSH, substitute with whatever you use LAN side
20 permit tcp 192.168.1.0 0.0.0.255 any eq 22
30 deny   tcp any any eq 22
!
!
snmp-server community public RO SNMPACL // Also not needed if you're not using SNMP
!
!
!
!
control-plane
!
!
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
!
!
!
!
!
end

