# EPE

router bgp 1
bgp router-id 1.1.1.2
address-family ipv4 unicast
!
neighbor 1.1.1.5
remote-as 5
ebgp-multihop 255
egress-engineering
description eBGP peer xrvr-5
update-source Loopback0
address-family ipv4 unicast
route-policy bgp_in in
route-policy bgp_out out
!
neighbor 99.2.4.4
remote-as 4
egress-engineering
description eBGP peer xrvr-4
address-family ipv4 unicast
route-policy bgp_in in
route-policy bgp_out out
!
!
!

route-policy I_AM_CONTROLLER
if destination in (6.1.1.6) then
set next-hop 1.1.1.3
set label 30035
set local-preference 1000
endif
end-policy
!
router bgp 1
bgp router-id 1.1.1.10
address-family ipv4 unicast
network 6.1.1.6/32
allocate-label all
!
neighbor 1.1.1.1
remote-as 1
update-source Loopback0
address-family ipv4 labeled-unicast
route-policy I_AM_CONTROLLER out
!
!
!

# https://www.cisco.com/c/dam/global/zh_cn/solutions/service-provider/segment-routing/pdf/segment_routing_egress_peer_engineering.pdf
