# BGP EVPN VXLAN Catalyst 9500 Switches

# Leaf-01
# show running-config
hostname Leaf-01
!
ip routing
!
ip multicast-routing
!
l2vpn evpn
replication-type static
router-id Loopback1
!
l2vpn evpn instance 101 vlan-based
encapsulation vxlan
!
system mtu 9198
!
vlan configuration 101
member evpn-instance 101 vni 10101
!
interface Loopback0
ip address 172.16.255.1 255.255.255.255
ip pim sparse-mode
ip ospf 1 area 0
!
interface Loopback1
ip address 172.16.254.1 255.255.255.255
ip pim sparse-mode
ip ospf 1 area 0
!
interface GigabitEthernet1/0/10
switchport access vlan 101
switchport mode access
spanning-tree portfast
!
interface TenGigabitEthernet1/1/1
no switchport
ip address 172.16.12.1 255.255.255.0
ip pim sparse-mode
ip ospf network point-to-point
ip ospf 1 area 0
!
interface nve1
no ip address
source-interface Loopback1
host-reachability protocol bgp
member vni 10101 mcast-group 225.0.0.101
!
router ospf 1
router-id 172.16.255.1
!
router bgp 65001
bgp log-neighbor-changes
no bgp default ipv4-unicast
neighbor 172.16.255.2 remote-as 65001
neighbor 172.16.255.2 update-source Loopback0
!
address-family ipv4
exit-address-family
!
address-family l2vpn evpn
neighbor 172.16.255.2 activate
neighbor 172.16.255.2 send-community both
exit-address-family
!
ip pim rp-address 172.16.255.1
!
end

# Leaf-02
# show running-config
hostname Leaf-02
!
ip routing
!
ip multicast-routing
!
l2vpn evpn
replication-type static
router-id Loopback1
!
l2vpn evpn instance 101 vlan-based
encapsulation vxlan
!
system mtu 9198
!
vlan configuration 101
member evpn-instance 101 vni 10101
!
interface Loopback0
ip address 172.16.255.2 255.255.255.255
ip pim sparse-mode
ip ospf 1 area 0
!
interface Loopback1
ip address 172.16.254.2 255.255.255.255
ip pim sparse-mode
ip ospf 1 area 0
!
interface GigabitEthernet1/0/10
switchport access vlan 101
switchport mode access
spanning-tree portfast
!
interface TenGigabitEthernet1/1/1
no switchport
ip address 172.16.12.2 255.255.255.0
ip pim sparse-mode
ip ospf network point-to-point
ip ospf 1 area 0
!
interface nve1
no ip address
source-interface Loopback1
host-reachability protocol bgp
member vni 10101 mcast-group 225.0.0.101
!
router ospf 1
router-id 172.16.255.2
!
router bgp 65001
bgp log-neighbor-changes
no bgp default ipv4-unicast
neighbor 172.16.255.1 remote-as 65001
neighbor 172.16.255.1 update-source Loopback0
!
address-family ipv4
exit-address-family
!
address-family l2vpn evpn
neighbor 172.16.255.1 activate
neighbor 172.16.255.1 send-community both
exit-address-family
!
ip pim rp-address 172.16.255.1
!
end

# Leaf-01
# show nve peers
Interface  VNI      Type Peer-IP          RMAC/Num_RTs   eVNI     state flags UP time
nve1       10101    L2CP 172.16.254.2     2              10101      UP   N/A  00:37:39

# Leaf-01
# show bgp l2vpn evpn summary
BGP router identifier 172.16.255.1, local AS number 65001
BGP table version is 7, main routing table version 7
6 network entries using 2304 bytes of memory
6 path entries using 1272 bytes of memory
2/2 BGP path/bestpath attribute entries using 576 bytes of memory
1 BGP extended community entries using 40 bytes of memory
0 BGP route-map cache entries using 0 bytes of memory
0 BGP filter-list cache entries using 0 bytes of memory
BGP using 4192 total bytes of memory
BGP activity 6/0 prefixes, 6/0 paths, scan interval 60 secs
6 networks peaked at 10:04:33 Oct 26 2020 UTC (00:37:39.064 ago)

Neighbor        V           AS MsgRcvd MsgSent   TblVer  InQ OutQ Up/Down  State/PfxRcd
172.16.255.2    4        65001      45      47        7    0    0 00:38:49        2

# Leaf-01
# show bgp l2vpn evpn
BGP table version is 7, local router ID is 172.16.255.1
Status codes: s suppressed, d damped, h history, * valid, > best, i - internal, 
              r RIB-failure, S Stale, m multipath, b backup-path, f RT-Filter, 
              x best-external, a additional-path, c RIB-compressed, 
              t secondary path, L long-lived-stale,
Origin codes: i - IGP, e - EGP, ? - incomplete
RPKI validation codes: V valid, I invalid, N Not found

     Network          Next Hop            Metric LocPrf Weight Path
Route Distinguisher: 172.16.254.1:101
 *>   [2][172.16.254.1:101][0][48][44D3CA286CC1][0][*]/20
                      ::                                 32768 ?
 *>   [2][172.16.254.1:101][0][48][44D3CA286CC1][32][10.1.101.10]/24
                      ::                                 32768 ?
 *>i  [2][172.16.254.1:101][0][48][44D3CA286CC2][0][*]/20
                      172.16.254.2             0    100      0 ?
 *>i  [2][172.16.254.1:101][0][48][44D3CA286CC2][32][10.1.101.20]/24
                      172.16.254.2             0    100      0 ?
Route Distinguisher: 172.16.254.2:101
 *>i  [2][172.16.254.2:101][0][48][44D3CA286CC2][0][*]/20
                      172.16.254.2             0    100      0 ?
 *>i  [2][172.16.254.2:101][0][48][44D3CA286CC2][32][10.1.101.20]/24
                      172.16.254.2             0    100      0 ?

# Leaf-01
# show l2vpn evpn mac evi 101
MAC Address    EVI   VLAN  ESI                      Ether Tag  Next Hop(s)
-------------- ----- ----- ------------------------ ---------- ---------------
44d3.ca28.6cc1 101   101   0000.0000.0000.0000.0000 0          Gi1/0/10:101
44d3.ca28.6cc2 101   101   0000.0000.0000.0000.0000 0          172.16.254.2


# Leaf-01
# show ip mroute
IP Multicast Routing Table
Flags: D - Dense, S - Sparse, B - Bidir Group, s - SSM Group, C - Connected,
       L - Local, P - Pruned, R - RP-bit set, F - Register flag,
       T - SPT-bit set, J - Join SPT, M - MSDP created entry, E - Extranet,
       X - Proxy Join Timer Running, A - Candidate for MSDP Advertisement,
       U - URD, I - Received Source Specific Host Report, 
       Z - Multicast Tunnel, z - MDT-data group sender, 
       Y - Joined MDT-data group, y - Sending to MDT-data group, 
       G - Received BGP C-Mroute, g - Sent BGP C-Mroute, 
       N - Received BGP Shared-Tree Prune, n - BGP C-Mroute suppressed, 
       Q - Received BGP S-A Route, q - Sent BGP S-A Route, 
       V - RD & Vector, v - Vector, p - PIM Joins on route, 
       x - VxLAN group, c - PFP-SA cache created entry, 
       * - determined by Assert, # - iif-starg configured on rpf intf, 
       e - encap-helper tunnel flag
Outgoing interface flags: H - Hardware switched, A - Assert winner, p - PIM Join
 Timers: Uptime/Expires
 Interface state: Interface, Next-Hop or VCD, State/Mode

(*, 224.0.1.40), 00:46:14/00:03:14, RP 172.16.255.1, flags: SJCL
  Incoming interface: Null, RPF nbr 0.0.0.0
  Outgoing interface list:
    TenGigabitEthernet1/1/1, Forward/Sparse, 00:43:31/00:03:14
    Loopback0, Forward/Sparse, 00:46:14/00:02:42

(*, 225.0.0.101), 00:46:14/stopped, RP 172.16.255.1, flags: SJCFx
  Incoming interface: Null, RPF nbr 0.0.0.0
  Outgoing interface list:
    TenGigabitEthernet1/1/1, Forward/Sparse, 00:43:31/00:03:17
    Tunnel0, Forward/Sparse-Dense, 00:46:14/00:01:47

(172.16.254.1, 225.0.0.101), 00:00:00/00:02:59, flags: FTx
  Incoming interface: Loopback1, RPF nbr 0.0.0.0
  Outgoing interface list:
    TenGigabitEthernet1/1/1, Forward/Sparse, 00:00:00/00:03:29

(172.16.254.2, 225.0.0.101), 00:00:03/00:02:56, flags: x
  Incoming interface: TenGigabitEthernet1/1/1, RPF nbr 172.16.12.2
  Outgoing interface list:
    Tunnel0, Forward/Sparse-Dense, 00:00:03/00:02:56

# Leaf-01# show ip mfib
Entry Flags:    C - Directly Connected, S - Signal, IA - Inherit A flag,
                ET - Data Rate Exceeds Threshold, K - Keepalive
                DDE - Data Driven Event, HW - Hardware Installed
                ME - MoFRR ECMP entry, MNE - MoFRR Non-ECMP entry, MP - MFIB 
                MoFRR Primary, RP - MRIB MoFRR Primary, P - MoFRR Primary
                MS  - MoFRR  Entry in Sync, MC - MoFRR entry in MoFRR Client,
                e   - Encap helper tunnel flag.
I/O Item Flags: IC - Internal Copy, NP - Not platform switched,
                NS - Negate Signalling, SP - Signal Present,
                A - Accept, F - Forward, RA - MRIB Accept, RF - MRIB Forward,
                MA - MFIB Accept, A2 - Accept backup,
                RA2 - MRIB Accept backup, MA2 - MFIB Accept backup

Forwarding Counts: Pkt Count/Pkts per second/Avg Pkt Size/Kbits per second
Other counts:      Total/RPF failed/Other drops
I/O Item Counts:   HW Pkt Count/FS Pkt Count/PS Pkt Count   Egress Rate in pps
Default
 (*,224.0.0.0/4) Flags: C HW
   SW Forwarding: 0/0/0/0, Other: 0/0/0
   HW Forwarding:   0/0/0/0, Other: 0/0/0
 (*,224.0.1.40) Flags: C HW
   SW Forwarding: 0/0/0/0, Other: 0/0/0
   HW Forwarding:   0/0/0/0, Other: 0/0/0
   Tunnel2 Flags: A
   TenGigabitEthernet1/1/1 Flags: F NS
     Pkts: 0/0/0    Rate: 0 pps
   Loopback0 Flags: F IC NS
     Pkts: 0/0/0    Rate: 0 pps
 (*,225.0.0.101) Flags: C HW
   SW Forwarding: 2/0/96/0, Other: 0/0/0
   HW Forwarding:   0/0/0/0, Other: 0/0/0
   Tunnel2 Flags: A
   Tunnel0, VXLAN Decap Flags: F NS
     Pkts: 0/0/2    Rate: 0 pps
   TenGigabitEthernet1/1/1 Flags: F NS
     Pkts: 0/0/2    Rate: 0 pps
 (172.16.254.1,225.0.0.101) Flags: HW
   SW Forwarding: 1/0/96/0, Other: 0/0/0
   HW Forwarding:   0/0/0/0, Other: 0/0/0
   Null0 Flags: A
   TenGigabitEthernet1/1/1 Flags: F NS
     Pkts: 0/0/1    Rate: 0 pps
 (172.16.254.2,225.0.0.101) Flags: HW
   SW Forwarding: 0/0/0/0, Other: 0/0/0
   HW Forwarding:   0/0/0/0, Other: 0/0/0
   Tunnel2 Flags: A
   Tunnel0, VXLAN Decap Flags: F NS
     Pkts: 0/0/0    Rate: 0 pps
   TenGigabitEthernet1/1/1 Flags: NS

# Configuring VTEP 1 and VTEP 2 to Configure a Layer 2 VNI with Back-to-Back Ingress Replication
# Leaf-01
# show running-config
hostname Leaf-01
!
ip routing
!
l2vpn evpn
replication-type static
router-id Loopback1
!
l2vpn evpn instance 101 vlan-based
encapsulation vxlan
replication-type ingress
!
system mtu 9198
!
vlan configuration 101
member evpn-instance 101 vni 10101
!
interface Loopback0
ip address 172.16.255.1 255.255.255.255
ip ospf 1 area 0
!
interface Loopback1
ip address 172.16.254.1 255.255.255.255
ip ospf 1 area 0
!
interface GigabitEthernet1/0/10
switchport access vlan 101
switchport mode access
spanning-tree portfast
!
interface TenGigabitEthernet1/1/1
no switchport
ip address 172.16.12.1 255.255.255.0
ip ospf network point-to-point
ip ospf 1 area 0
!
interface nve1
no ip address
source-interface Loopback1
host-reachability protocol bgp
member vni 10101 ingress-replication
!
router ospf 1
router-id 172.16.255.1
!
router bgp 65001
bgp log-neighbor-changes
no bgp default ipv4-unicast
neighbor 172.16.255.2 remote-as 65001
neighbor 172.16.255.2 update-source Loopback0
!
address-family ipv4
exit-address-family
!
address-family l2vpn evpn
neighbor 172.16.255.2 activate
neighbor 172.16.255.2 send-community both
exit-address-family
!
end

# Leaf-02
# show running-config
hostname Leaf-02
!
ip routing
!
l2vpn evpn
replication-type static
router-id Loopback1
!
l2vpn evpn instance 101 vlan-based
encapsulation vxlan
replication-type ingress
!
system mtu 9198
!
vlan configuration 101
member evpn-instance 101 vni 10101
!
interface Loopback0
ip address 172.16.255.2 255.255.255.255
ip ospf 1 area 0
!
interface Loopback1
ip address 172.16.254.2 255.255.255.255
ip ospf 1 area 0
!
interface GigabitEthernet1/0/10
switchport access vlan 101
switchport mode access
spanning-tree portfast
!
interface TenGigabitEthernet1/1/1
no switchport
ip address 172.16.12.2 255.255.255.0
ip ospf network point-to-point
ip ospf 1 area 0
!
interface nve1
no ip address
source-interface Loopback1
host-reachability protocol bgp
member vni 10101 ingress-replication
!
router ospf 1
router-id 172.16.255.2
!
router bgp 65001
bgp log-neighbor-changes
no bgp default ipv4-unicast
neighbor 172.16.255.1 remote-as 65001
neighbor 172.16.255.1 update-source Loopback0
!
address-family ipv4
exit-address-family
!
address-family l2vpn evpn
neighbor 172.16.255.1 activate
neighbor 172.16.255.1 send-community both
exit-address-family
!
end

