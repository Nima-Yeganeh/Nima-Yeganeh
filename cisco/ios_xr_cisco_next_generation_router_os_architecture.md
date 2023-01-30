# IOS_XR
# Cisco Next Generation Router OS Architecture

show ipv4 interfaces brief
show running-config
show install active
show cef summary location 0/5/CPU0

conf t
router bgp 100
mpls ldp
taskgroup admins
ipv4 access-list block-junk
policy-map foo

admin
show controllers fabric plane all
show controllers fabric clock
config-register 0x0
install add

show platform

hostname Backbone-CRS
line default
exec-timeout 1440 0
!
taskgroup ops
task read boot
task write boot
task execute bgp
!
router static
address-family ipv4 unicast
 0.0.0.0/0 7.1.9.1
 7.7.7.77/32 7.1.9.1


hostname Backbone-CRS
line default
exec-timeout 1440 0
!
Interface gig 0/3/0/0
 ipv4 address 9.9.9.9/24
!
taskgroup ops
task read boot
task write boot
task execute bgp
!
router ospf 100
 area 0
 interface gig 0/3/0/0
 area 1
 interface pos 0/4/0/0
!
router static
address-family ipv4 unicast
 0.0.0.0/0 7.1.9.1
 7.7.7.77/32 7.1.9.1


show running-config
hostname CRS
line default
exec-timeout 1440 0

show config commit list

show config commit changes last 5

show config sessions

taskgroup basic-admin
task read acl
task read bfd
task read bgp
task write acl
task write bfd
task write bgp
task debug bgp

usergroup noc-staff
taskgroup operator
taskgroup basic-admin
inherit usergroup all-users
!
usergroup allusers
taskgroup basic-stuff

show install active

install add tftp://172.21.116.8/c12k-mcast.pie-3.2.85.3I

install activate disk0:c12k-mcast-3.2.85

install commit

install deactivate disk0:c12k-rp-mgbl-3.2.85

router ospfv3 32
area 0
 interface GigabitEthernet0/5/0/0
 !
 interface GigabitEthernet0/5/0/1
 cost 30
 !
!
area 1
 interface GigabitEthernet0/5/0/2
 cost 40
 passive
!
router ospf 101
area 0
 interface GigabitEthernet0/5/0/0
 !
 interface GigabitEthernet0/5/0/1
 !
 interface GigabitEthernet0/5/0/2

router isis 7
net 49.0001.0000.0000.000c.00
interface Loopback0
 address-family ipv4 unicast
 !
!
interface GigabitEthernet0/4/0/1
 address-family ipv4 unicast
 !
!
interface GigabitEthernet0/4/0/2
 address-family ipv4 unicast
 !
!
interface GigabitEthernet0/4/0/3
 address-family ipv4 unicast

router eigrp 7
address-family ipv4
 interface MgmtEth0/7/CPU0/0
 passive-interface
 !
 interface GigabitEthernet0/4/0/0
 !
 interface GigabitEthernet0/4/0/1
 !
 interface GigabitEthernet0/4/0/2
 !
 interface GigabitEthernet0/4/0/3
 !
!

router static
address-family ipv4 unicast
 0.0.0.0/0 7.1.9.1
 7.7.7.77/32 7.1.9.1
 8.8.8.1/32 GigabitEthernet0/5/0/1.101
 8.8.8.1/32 GigabitEthernet0/5/0/1.102
 8.8.8.2/32 5.1.1.2
 8.8.8.2/32 5.2.1.2
!
router static
address-family ipv6 unicast

router bgp 600
address-family ipv4 unicast

router bgp 600
neighbor 5.5.5.5
 address-family ipv4 unicast
 route-policy filter_peers in

router bgp 100
address-family ipv4 unicast
!
neighbor 1.1.1.1
 remote-as 200
 address-family ipv4 unicast
route-policy filter-in in
 route-policy filter-out out

sh run router bgp
router bgp 300
bgp router-id 2.2.2.2
address-family ipv4 unicast
!
neighbor 192.1.1.2
 remote-as 400
 address-family ipv4 unicast
 route-policy filter-in in
 route-policy filter-out out
 !
!

if as-path in as-path-set-1 then
 drop
endif

if med eq 150 then
 set local-preference 10
elseif med eq 200 then
 set local-preference 60
else
 set local-preference 0
endif

mpls ldp
router-id 6.6.6.6
!
interface GigabitEthernet0/4/0/0
interface GigabitEthernet0/4/0/1
interface GigabitEthernet0/4/0/2
interface GigabitEthernet0/4/0/3

vrf <NAME>
address-family ipv4 unicast
 import route-target
 <A:B>
 export route-target
 <C:D>
 import route-policy <name>
 export route-policy <name>
interface <INT>
vrf <NAME>
ipv4 address <ADDR/MASK> (note: must remove old address)
router bgp <AS>
address-family vpnv4 unicast
neighbor <neighbor>
 address-family vpnv4 unicast
vrf <NAME>
 rd <E:F>
 address-family ipv4 unicast
 redistribute connected

l2vpn
pw-class [class-name]
 encapsulation mpls
 protocol ldp
xconnect group [group-name]
 p2p [circuit-name]
 interface GigabitEthernet0/1/0/0
 neighbor 12.12.12.12 pw-id 100
 pw-class [class-name]
interface GigabitEthernet0/1/0/0
l2transport

