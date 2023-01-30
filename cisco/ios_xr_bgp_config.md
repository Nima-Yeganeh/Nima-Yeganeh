# IOS_XR BGP Config

# R1

show run router bgp

router bgp 12
 timers bgp 30 90 90
 bgp router-id 1.1.1.1
 update limit 2048
 graceful-maintenance activate
  all-neighbors
 !
 update out logging
 ibgp policy out enforce-modifications
 address-family ipv4 unicast
  maximum-paths ibgp 64
  network 1.1.1.105/32
 !
 address-family l2vpn evpn
 !
 neighbor 172.17.101.2
  remote-as 12
  update-source tunnel-ip101
  address-family ipv4 unicast
   route-policy pass-all in
   route-policy pass-all out
   next-hop-self
   soft-reconfiguration inbound
  !
 !
 neighbor 172.17.102.2
  remote-as 12
  update-source tunnel-ip102
  address-family ipv4 unicast
   route-policy pass-all in
   route-policy pass-all out
   next-hop-self
   soft-reconfiguration inbound
  !
 !
!

# R2

router bgp 12
 timers bgp 30 90 90
 bgp router-id 2.2.2.2
 update limit 2048
 graceful-maintenance activate
  all-neighbors
 !
 update out logging
 ibgp policy out enforce-modifications
 address-family ipv4 unicast
  network 2.2.2.105/32
 !
 address-family l2vpn evpn
 !
 neighbor 172.17.101.1
  remote-as 12
  update-source tunnel-ip101
  address-family ipv4 unicast
   route-policy pass-all in
   route-policy pass-all out
   next-hop-self
   soft-reconfiguration inbound
  !
 !
 neighbor 172.17.102.1
  remote-as 12
  update-source tunnel-ip102
  address-family ipv4 unicast
   route-policy pass-all in
   route-policy pass-all out
   next-hop-self
   soft-reconfiguration inbound
  !
 !
!

# https://www.cisco.com/c/en/us/td/docs/routers/xr12000/software/xr12k_r4-1/routing/configuration/guide/routing_cg41xr12k_chapter1.html

