# L3VPN
# Router Config
# NCS 540

Router-PE1#configure
Router-PE1(config)#router ospf dc-core
Router-PE1(config-ospf)#address-family ipv4 unicast
Router-PE1(config-ospf)#area 1
Router-PE1(config-ospf-ar)#interface HundredGigE0/0/1/0
Router-PE1(config-ospf-vrf-ar-if)#commit

# Running Configuration
router ospf dc-core
router-id 13.13.13.1
address-family ipv4 unicast
area 1
interface HundredGigE0/0/1/0

# show ospf neighbor

# Configuration Example

Router-PE1#configure
Router-PE1(config)#mpls ldp
Router-PE1(config-ldp)#router-id 13.13.13.1
Router-PE1(config-ldp)#address-family ipv4
Router-PE1(config-ldp-af)#exit
Router-PE1(config-ldp)#interface HundredGigE0/0/1/0
Router-PE1(config-ldp)#commit

# Running Configuration

mpls ldp
router-id 13.13.13.1
address-family ipv4
interface HundredGigE0/0/1/0

# show mpls ldp neighbor

# Configure Multiprotocol BGP on the PE Routers and Route Reflectors

Router-PE1#configure
Router-PE1(config)#router bgp 2001
Router-PE1(config-bgp)#bgp router-id 13.13.13.1
Router-PE1(config-bgp)#address-family ipv4 unicast
Router-PE1(config-bgp-af)#exit
Router-PE1(config-bgp)#address-family vpnv4 unicast
Router-PE1(config-bgp-af)#exit
Router-PE1(config-bgp)#neighbor 20.20.20.1
Router-PE1(config-bgp-nbr)#remote-as 2001
Router-PE1(config-bgp-nbr)#update-source loopback 0
Router-PE1(config-bgp-nbr)#address-family ipv4 unicast
Router-PE1(config-bgp-nbr-af)#exit
Router-PE1(config-bgp-nbr)#address-family vpnv4 unicast
Router-PE1(config-bgp-nbr-af)#exit
Router-PE1(config-bgp-nbr)#exit
Router(config-bgp)#vrf vrf1601
Router-PE1(config-bgp-vrf)#rd 2001:1601
Router-PE1(config-bgp-vrf)#address-family ipv4 unicast
Router-PE1(config-bgp-vrf-af)#label mode per-vrf
Router-PE1(config-bgp-vrf-af)#redistribute connected
Router-PE1(config-bgp-vrf-af)#commit

# Running Configuration
router bgp 2001
bgp router-id 13.13.13.1
address-family ipv4 unicast
address-family vpnv4 unicast
neighbor 20.20.20.1
remote-as 2001
update-source Loopback0
address-family vpnv4 unicast
address-family ipv4 unicast
vrf vrf1601
rd 2001:1601
address-family ipv4 unicast
label mode per-vrf
redistribute connected

# show bgp neighbor

# show bgp vpnv4 unicast

# Define VRFs on PE Routers to Enable Customer Connectivity

Router-PE1#configure
Router-PE1(config)#vrf vrf1601
Router-PE1(config-vrf)#address-family ipv4 unicast
Router-PE1(config-vrf-af)#import route-target
Router-PE1(config-vrf-af-import-rt)#2001:1601
Router-PE1(config-vrf-af-import-rt)#exit
Router-PE1(config-vrf-af)#export route-target
Router-PE1(config-vrf-af-export-rt)#2001:1601
Router-PE1(config-vrf-af-export-rt)#commit

# Running Configuration

vrf vrf1601
address-family ipv4 unicast
import route-target
2001:1601
export route-target
2001:1601

# show vrf vrf1601

# Configure VRF Interfaces on PE Routers for Each VPN Customer

Router-PE1#configure
Router-PE1(config)#interface HundredGigE0/0/1/0.1601
Router-PE1(config-if)#vrf vrf1601
Router-PE1(config-if)#ipv4 address 192.13.26.6 255.255.255.252
Router-PE1(config-if)#encapsulation dot1q 1601
Router-PE1(config)#commit

# Running Configuration

interface HundredGigE0/0/1/0.1601
vrf vrf1601
ipv4 address 192.13.26.6 255.255.255.252
encapsulation dot1q 1601

# show ipv4 vrf vrf1601 interface

# Configure Routing Protocol Between the PE and CE Routers

Router-PE1#configure
Router-PE1(config)#router bgp 2001
Router-PE1(config-bgp)#bgp router-id 13.13.13.1
Router-PE1(config-bgp)#address-family ipv4 unicast
Router-PE1(config-bgp-af)#exit
Router-PE1(config-bgp)#address-family vpnv4 unicast
Router-PE1(config-bgp-af)#exit
Router-PE1(config-bgp)#vrf vrf1601
Router-PE1(config-bgp-vrf)#rd 2001:1601
Router-PE1(config-bgp-vrf)#address-family ipv4 unicast
Router-PE1(config-bgp-vrf-af)#label mode per-vrf
Router-PE1(config-bgp-vrf-af)#redistribute connected
Router-PE1(config-bgp-vrf-af)#exit
Router-PE1(config-bgp-vrf)#neighbor 192.13.26.5
Router-PE1(config-bgp-vrf-nbr)#remote-as 7501
Router-PE1(config-bgp-vrf-nbr)#address-family ipv4 unicast
Router-PE1(config-bgp-vrf-nbr-af)#route-policy pass-all in
Router-PE1(config-bgp-vrf-nbr-af)#route-policy pass-all out
Router-PE1(config-bgp-vrf-nbr-af)#commit

Router-CE1#configure
Router-CE1(config)#router bgp 2001
Router-CE1(config-bgp)#bgp router-id 8.8.8.1
Router-CE1(config-bgp)#address-family ipv4 unicast
Router-CE1(config-bgp-af)#exit
Router-CE1(config-bgp)#address-family vpnv4 unicast
Router-CE1(config-bgp-af)#exit
Router-CE1(config-bgp)#neighbor 192.13.26.6
Router-CE1(config-bgp-nbr)#remote-as 2001
Router-CE1(config-bgp-nbr)#address-family ipv4 unicast
Router-CE1(config-bgp-nbr-af)#route-policy pass-all in
Router-CE1(config-bgp-nbr-af)#route-policy pass-all out
Router-CE1(config-bgp-nbr-af)#commit

Router-PE1#configure
Router-PE1(config)#router rip
Router-PE1(config-rip)#vrf vrf1601
Router-PE1(config-rip-vrf)#interface TenGigE0/0/0/0.1601
Router-PE1(config-bgp-vrf-if)#exit
Router-PE1(config-bgp-vrf)#redistribute bgp 2001
Router-PE1(config-bgp-vrf)#redistribute connected
Router-PE1(config-bgp-vrf)#commit

Router-CE1#configure
Router-CE1(config)#router rip
Router-CE1(config-rip)#vrf vrf1601
Router-CE1(config-rip-vrf)#interface TenGigE0/0/0/0.1601
Router-CE1(config-bgp-vrf-if)#exit
Router-CE1(config-bgp-vrf)#redistribute connected
Router-CE1(config-bgp-vrf)#commit

Router-PE1#show running-config router rip
router rip
vrf vrf1601
interface TenGigE0/0/0/0.1601
redistribute bgp 2001
redistribute connected

Router-CE1#show running-config router rip
router rip
vrf vrf1601
interface TenGigE0/0/0/0.1601
redistribute connected

# Configure Static Routes Between the PE and CE Routers

Router-PE1#configure
Router-PE1(config)#router static
Router-PE1(config-static)#vrf vrf1601
Router-PE1(config-static-vrf)#address-family ipv4 unicast
Router-PE1(config-static-vrf-afi)#23.13.1.1/32 TenGigE0/0/0/0.1601 192.13.3.93
Router-PE1(config-static-vrf-afi)#commit

# Running Configuration
# PE1:

router static
vrf vrf1601
address-family ipv4 unicast
23.13.1.1/32 TenGigE0/0/0/0.1601 192.13.3.93

# CE1:

router static
vrf vrf1601
address-family ipv4 unicast
23.8.1.2/32 TenGigE0/0/0/0.1601 192.8.3.94

# PE1:

Router-PE1#configure
Router-PE1(config)#router ospf pe-ce-ospf-vrf
Router-PE1(config-ospf)#router-id 13.13.13.1
Router-PE1(config-ospf)#vrf vrf1601
Router-PE1(config-ospf-vrf)#redistribute connected
Router-PE1(config-ospf-vrf)#redistribute bgp 2001
Router-PE1(config-ospf-vrf)#area 1
Router-PE1(config-ospf-vrf-ar)#interface TenGigE0/0/0/0.1601
Router-PE1(config-ospf-vrf-ar)#commit

# CE1:

Router-CE1#configure
Router-CE1(config)#router ospf ospf pe-ce-1
Router-CE1(config-ospf)#router-id 8.8.8.1
Router-CE1(config-ospf)#vrf vrf1601
Router-CE1(config-ospf-vrf)#area 1
Router-CE1(config-ospf-vrf-ar)#interface TenGigE0/0/0/0.1601
Router-CE1(config-ospf-vrf-ar)#commit

# show mpls forwarding

# show mpls forwarding labels 24001 hardware egress

# show bgp label table

# show cef vrf vrf1601 20.23.1.1

# show mpls lsd forwarding

# Configuring ASBRs to Exchange IPv4 Routes and MPLS Labels

Router# configure
Router(config)#router bgp 500
Router(config-bgp)#address-family ipv4 unicast
Router(config-bgp-af)#allocate-label all
Router(config-bgp-af)#neighbor 16.1.1.1
Router(config-bgp-nbr)#remote-as 100
Router(config-bgp-nbr)#address-family ipv4 labeled-unicast
Router(config-bgp-nbr-af)#route-policy pass-all in
Router(config-bgp-nbr-af)#route-policy pass-all out
Router(config-bgp-nbr-af)#commit

# show bgp ipv4 labeled-unicast

# show bgp ipv4 labeled-unicast 10.200.1.1

# show cef vrf default ipv4 10.200.1.1

# Configuring the Route Reflectors to Exchange VPN-IPv4 Routes

Router# configure
Router(config)#router bgp 500
Router(config-bgp)#neighbor 10.200.2.1
Router(config-bgp-nbr)#remote-as 100
Router(config-bgp-nbr)#ebgp-multihop
Router(config-bgp-nbr)#update-source loopback0
Router(config-bgp-nbr)#address-family vpnv4 unicast
Router(config-bgp-nbr-af)#route-policy pass-all in
Router(config-bgp-nbr-af)#route-policy pass-all out
Router(config-bgp-nbr-af)#next-hop-unchanged
Router(config-bgp-nbr)#address-family vpnv6 unicast
Router(config-bgp-nbr-af)#route-policy pass-all in
Router(config-bgp-nbr-af)#route-policy pass-all out
Router(config-bgp-nbr-af)#next-hop-unchanged

# show cef vrf vrf2001 ipv4 111.1.1.2/32 hardware egress location 0/0/CPU0

# Configure the Route Reflectors to Reflect Remote Routes in its AS

Router#configure
Router(config)#router bgp 500
Router(config-bgp)#address-family ipv4 unicast
Router(config-bgp-af)#allocate-label all
Router(config-bgp-af)#neighbor 60.200.11.1
Router(config-bgp-nbr)#remote-as 500
Router(config-bgp-nbr)#update-source loopback0
Router(config-bgp-nbr)#address-family ipv4 labeled-unicast
Router(config-bgp-nbr-af)#route-reflector-client
Router(config-bgp-nbr-af)#neighbor 60.200.12.1Router(config-bgp-nbr)#remote-as 500Router(config-bgp-nbr)#update-source loopback0Router(config-bgp-nbr)#address-family ipv4 labeled-unicastRouter(config-bgp-nbr-af)#route-reflector-client
