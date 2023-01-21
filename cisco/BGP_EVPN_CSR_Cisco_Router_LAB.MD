# BGP EVPN
# CSR Cisco Router
# R1----R2
# R1----R3(CE)
# R2----R4(CE)

# R1 and R2 have a BGP EVPN session between them.
# lo0 of R1=11.11.11.11
# lo0 of R2=22.22.22.22

# R1 Config
enable
conf t
hostname R1
int range gi 1 - 2
no shut
int lo0
ip address 22.22.22.22 255.255.255.255
router bgp 1
bgp log-neighbor-changes
neighbor 22.22.22.22 remote-as 2
neighbor 22.22.22.22 ebgp-multihop 255
neighbor 22.22.22.22 update-source Loopback0
address-family ipv4
neighbor 22.22.22.22 activate
exit-address-family
address-family l2vpn evpn
neighbor 22.22.22.22 activate
neighbor 22.22.22.22 send-community extended
exit-address-family
bridge-domain 10
mac aging-time 30
member GigabitEthernet2 service-instance 10
member evpn-instance 10

l2vpn evpn
replication-type ingress
mpls label mode per-ce
router-id Loopback0

l2vpn evpn instance 10 vlan-based

rd 1:1
route-target export 1:1
route-target import 1:1
route-target import 2:2
no auto-route-target

interface GigabitEthernet3
no ip address
negotiation auto
no mop enabled
no mop sysid
service instance 10 ethernet
encapsulation dot1q 10

# R2 Config
hostname R2
int range gi 1 - 2
no shut
router bgp 2
bgp log-neighbor-changes
neighbor 11.11.11.11 remote-as 1
neighbor 11.11.11.11 ebgp-multihop 255
neighbor 11.11.11.11 update-source Loopback0
address-family ipv4
neighbor 11.11.11.11 activate
exit-address-family
address-family l2vpn evpn
neighbor 11.11.11.11 activate
neighbor 11.11.11.11 send-community extended
exit-address-family

l2vpn evpn
replication-type ingress
mpls label mode per-ce
router-id Loopback0

l2vpn evpn instance 10 vlan-based
rd 2:2
route-target export 2:2
route-target import 2:2
route-target import 1:1
no auto-route-target

bridge-domain 10
mac aging-time 30
member GigabitEthernet3 service-instance 10
member evpn-instance 10

interface GigabitEthernet3
no ip address
negotiation auto
no mop enabled
no mop sysid
service instance 10 ethernet
encapsulation dot1q 10

# R3 Config
enable
conf t
hostname R3
int gi2
no shut
do show int des
interface GigabitEthernet2
ip address 100.10.10.10 255.255.255.0
end
show ip int bri
write

# R4 Config
enable
conf t
hostname R4
int gi2
no shut
do show int des
interface GigabitEthernet2
ip address 100.10.10.20 255.255.255.0
end
show ip int bri
write

