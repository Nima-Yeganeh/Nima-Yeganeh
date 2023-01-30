# IOS_XR and ISIS

show run router isis

# R1

router isis test
 net 49.0001.0000.0000.0001.00
 instance-id 1
 log adjacency changes
 address-family ipv4 unicast
  metric-style wide
  maximum-paths 64
  router-id Loopback0
  segment-routing mpls
 !
 address-family ipv6 unicast
  metric-style wide
  maximum-paths 64
  router-id Loopback0
  segment-routing mpls
 !
 interface Loopback0
  address-family ipv4 unicast
   prefix-sid index 1
  !
  address-family ipv6 unicast
  !
 !
 interface tunnel-ip101
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface tunnel-ip102
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface tunnel-ip103
  point-to-point
  address-family ipv6 unicast
  !
 !
!

# R2

router isis test
 net 49.0001.0000.0000.0002.00
 instance-id 1
 log adjacency changes
 address-family ipv4 unicast
  metric-style wide
  maximum-paths 64
  router-id Loopback0
  segment-routing mpls
 !
 address-family ipv6 unicast
  metric-style wide
  maximum-paths 64
  router-id Loopback0
  segment-routing mpls
 !
 interface Loopback0
  address-family ipv4 unicast
   prefix-sid index 2
  !
  address-family ipv6 unicast
  !
 !
 interface tunnel-ip101
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface tunnel-ip102
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface tunnel-ip103
  point-to-point
  address-family ipv6 unicast
  !
 !
!

# https://www.ciscolive.com/c/dam/r/ciscolive/us/docs/2018/pdf/BRKRST-3302.pdf
