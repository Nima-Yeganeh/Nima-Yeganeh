# MPLS Traffic Engineering_Config_IOS_XR_ASR_9000

# R1

mpls ldp
 log
  neighbor
 !
 nsr
 graceful-restart
 graceful-restart reconnect-timeout 60
 graceful-restart forwarding-state-holdtime 60
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

router ospf test
 nsr
 nsf cisco
 address-family ipv4
 area 0
  authentication-key encrypted 01100F175804
  authentication message-digest
  message-digest-key 1 md5 encrypted 121A0C041104
  network broadcast
  hello-interval 1
  mpls traffic-eng
  interface Loopback103
  !
  interface GigabitEthernet0/0/0/1
   network broadcast
  !
 !
 mpls traffic-eng router-id 1.1.1.1
!

router isis test
 net 49.0001.0000.0000.0001.00
 instance-id 1
 log adjacency changes
 address-family ipv4 unicast
  metric-style wide
  mpls traffic-eng level-1-2
  mpls traffic-eng router-id 1.1.1.1
  maximum-paths 64
  router-id Loopback0
  segment-routing mpls
 !

# R2

mpls ldp
 log
  neighbor
 !
 nsr
 graceful-restart
 graceful-restart reconnect-timeout 60
 graceful-restart forwarding-state-holdtime 60
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

router ospf test
 nsr
 nsf cisco
 address-family ipv4
 area 0
  authentication-key encrypted 01100F175804
  authentication message-digest
  message-digest-key 1 md5 encrypted 121A0C041104
  network broadcast
  hello-interval 1
  mpls traffic-eng
  interface Loopback103
  !
  interface GigabitEthernet0/0/0/1
   network broadcast
  !
 !
 mpls traffic-eng router-id 2.2.2.2
!

router isis test
 net 49.0001.0000.0000.0002.00
 instance-id 1
 log adjacency changes
 address-family ipv4 unicast
  metric-style wide
  mpls traffic-eng level-1-2
  mpls traffic-eng router-id 2.2.2.2
  maximum-paths 64
  router-id Loopback0
  segment-routing mpls
 !

# https://www.cisco.com/c/en/us/td/docs/routers/asr9000/software/asr9k-r6-5/mpls/configuration/guide/b-mpls-cg-asr9000-65x/b-mpls-cg-asr9000-65x_chapter_0110.html
