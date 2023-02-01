# NSR and NSF Example

mpls ldp
 nsr
 graceful-restart
 graceful-restart reconnect-timeout 60
 graceful-restart forwarding-state-holdtime 60
 interface Bundle-Ether1
 !
!

router ospf 100
 nsr
 router-id 5.5.5.5
 nsf cisco
 area 0
  mpls traffic-eng
  interface Bundle-Ether1
  !
  interface Loopback0
  !
mpls traffic-eng router-id 192.168.70.1
!

# https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/iproute_ospf/configuration/xe-16-10/iro-xe-16-10-book/iro-nsr-ospf.pdf

