# L2VPN_MPLS_XConnect_ASR_NCS_Cisco_Config

# PE1

interface GigabitEthernet0/0/0/4
 l2transport
 !
!

mpls ldp
 log
  neighbor
 !
 router-id 1.1.1.1
 address-family ipv4
 !
 interface tunnel-ip101
  address-family ipv4
  !
 !
 interface tunnel-ip102
  address-family ipv4
  !
 !
 interface GigabitEthernet0/0/0/1
 !
!

l2vpn
 pw-class dynamic_mpls
  encapsulation mpls
   protocol ldp
  !
 !
 xconnect group test2
  p2p test2
   interface GigabitEthernet0/0/0/4
   neighbor ipv4 2.2.2.2 pw-id 2
    pw-class dynamic_mpls
   !
  !
 !

# PE2

interface GigabitEthernet0/0/0/4
 l2transport
 !
!

mpls ldp
 log
  neighbor
 !
 router-id 2.2.2.2
 address-family ipv4
 !
 interface tunnel-ip101
  address-family ipv4
  !
 !
 interface tunnel-ip102
  address-family ipv4
  !
 !
 interface GigabitEthernet0/0/0/1
 !
!

l2vpn
 pw-class dynamic_mpls
  encapsulation mpls
   protocol ldp
  !
 !
 xconnect group test2
  p2p test2
   interface GigabitEthernet0/0/0/4
   neighbor ipv4 1.1.1.1 pw-id 2
    pw-class dynamic_mpls
   !
  !
 !
!

# https://www.cisco.com/c/en/us/td/docs/iosxr/ncs5500/vpn/71x/b-l2vpn-cg-ncs5500-71x/b-l2vpn-cg-ncs5500-71x_chapter_01000.html
