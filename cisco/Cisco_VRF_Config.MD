# VRF Config
# Router Config

# show run | sec vrf
ip vrf test
 description test1
 maximum routes 100 warning-only
ip vrf test1
 rd 100:1
 route-target export 100:1
 route-target import 100:1
 ip vrf forwarding test1

# show run int gi4.13
Building configuration...

Current configuration : 123 bytes
!
interface GigabitEthernet4.13
 encapsulation dot1Q 13
 ip vrf forwarding test1
 ip address 172.16.4.1 255.255.255.0
end

# show ip vrf
  Name                             Default RD            Interfaces
  test                             <not set>
  test1                            100:1                 Gi4.13
R1#

# show ip vrf detail
VRF test (VRF Id = 2); default RD <not set>; default VPNID <not set>
  Description: test1
  Old CLI format, supports IPv4 only
  Flags: 0x8
  No interfaces
Address family ipv4 unicast (Table ID = 0x2):
  Flags: 0x0
  No Export VPN route-target communities
  No Import VPN route-target communities
  No import route-map
  No global export route-map
  No export route-map
  Route warning limit 100, current count 0
  VRF label distribution protocol: not configured
  VRF label allocation mode: per-prefix

VRF test1 (VRF Id = 1); default RD 100:1; default VPNID <not set>
  Old CLI format, supports IPv4 only
  Flags: 0xC
  Interfaces:
    Gi4.13
Address family ipv4 unicast (Table ID = 0x1):
  Flags: 0x0

# show arp vrf test1
Protocol  Address          Age (min)  Hardware Addr   Type   Interface
Internet  172.16.4.1              -   5000.0001.0003  ARPA   GigabitEthernet4.13
Internet  172.16.4.3              0   5000.0003.0003  ARPA   GigabitEthernet4.13
R1#

# show ip route vrf test1
Routing Table: test1
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route, H - NHRP, l - LISP
       a - application route
       + - replicated route, % - next hop override

Gateway of last resort is not set

      172.16.0.0/16 is variably subnetted, 2 subnets, 2 masks
C        172.16.4.0/24 is directly connected, GigabitEthernet4.13
L        172.16.4.1/32 is directly connected, GigabitEthernet4.13
R1#

