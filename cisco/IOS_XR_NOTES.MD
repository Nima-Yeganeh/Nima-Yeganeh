# IOS XR Notes

username netadmin
 group root-system
 secret 5 $1$e1b8$ui278OB/l4zjSy.DGekD31

aaa authorization exec default local
aaa authentication login default local

ssh server v2
ssh server netconf
ssh server logging

netconf agent tty
 session timeout 5

netconf-yang agent
 ssh

hostname xrv
domain name lab.local

cdp
domain name lab.local
interface MgmtEth0/0/CPU0/0
cdp
 no shutdown

interface GigabitEthernet0/0/0/0
cdp
 no shutdown

ssh server v2
ssh server vrf default
ssh server logging
netconf agent tty
 session timeout 5


conf t
hostname XRV
cdp
domain name lab.local
netconf agent tty
 session timeout 5
netconf-yang agent
 ssh
ssh server v2
ssh server vrf default
ssh server logging
cdp
interface MgmtEth0/0/CPU0/0
 no shutdown
 cdp
interface GigabitEthernet0/0/0/0
 no shutdown
 cdp
interface GigabitEthernet0/0/0/1
 no shutdown
 cdp
interface GigabitEthernet0/0/0/2
 no shutdown
 cdp
interface GigabitEthernet0/0/0/3
 no shutdown
 cdp
interface GigabitEthernet0/0/0/4
 no shutdown
 cdp
interface GigabitEthernet0/0/0/5
 no shutdown
 cdp
interface GigabitEthernet0/0/0/6
 no shutdown
 cdp
interface GigabitEthernet0/0/0/7
 no shutdown
 cdp
interface GigabitEthernet0/0/0/8
 no shutdown
 cdp
commit

l2vpn
 bridge group test
  bridge-domain test
   interface GigabitEthernet0/0/0/0
   !
   vfi test
    neighbor 1.1.1.1 pw-id 12
    !
   !
   evi 1000
   !

l2vpn
 bridge group test
  bridge-domain test
   interface GigabitEthernet0/0/0/0
   !
   vfi test
    neighbor 2.2.2.2 pw-id 12
    !
   !
   evi 1000
   !


router isis 1
 is-type level-2-only
 net 49.0001.0000.0000.0004.00
 address-family ipv4 unicast
  metric-style wide
 !
 interface Loopback0
  address-family ipv4 unicast
  !
 !
 interface GigabitEthernet0/0/0/0
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface GigabitEthernet0/0/0/1
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface GigabitEthernet0/0/0/2
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface GigabitEthernet0/0/0/3
  point-to-point
  address-family ipv4 unicast
  !
 !
 interface GigabitEthernet0/0/0/4
  point-to-point
  address-family ipv4 unicast
  !
 !
!


conf t
router isis 1
 address-family ipv4 unicast
  metric-style wide
  segment-routing mpls sr-prefer
commit

router isis 1
 address-family ipv4 unicast
  metric-style wide
  segment-routing mpls sr-prefer
 interface GigabitEthernet0/0/0/0
  point-to-point
  address-family ipv4 unicast
   fast-reroute per-prefix
   fast-reroute per-prefix ti-lfa
  !
  address-family ipv6 unicast
   fast-reroute per-prefix
   fast-reroute per-prefix ti-lfa

vrf a
 address-family ipv4 unicast
  import route-target
   1:102
  !
  export route-target
   1:102
  !
 !

interface GigabitEthernet0/0/0/1.102
 vrf a
 ipv4 address 192.168.102.254 255.255.255.0
 encapsulation dot1q 102

route-policy PASS-ALL
  pass
end-policy
!

prefix-set K1-routes
  10.170.53.0/24
end-set

prefix-set K2-routes
  10.147.4.0/24
end-set

prefix-set K3-routes
  198.168.44.0/23,
  198.168.46.0/24
end-set

as-path-set match-ases
  ios-regex '^(.*65531)$',
  ios-regex '^(.*65532)$',
  ios-regex '^(.*65533)$',
  ios-regex '^(.*65534)$'
end-set

route-policy TEST1
  if destination in (172.16.0.0/12 le 32) then
    pass
  endif
end-policy

route-policy Inbound-ROUTES
  if destination in K1-routes then
    pass
  elseif destination in K2-routes then
    pass
  elseif destination in K3-routes then
    pass
  elseif as-path in match-ases then
    drop
  else
    pass
  endif
end-policy

route-policy MAXAS-LIMIT
if as-path length ge 3 then
drop
endif
pass
end-policy

router vrrp
 interface GigabitEthernet0/0/0/2
  delay minimum 2 reload 10
  address-family ipv6
   vrrp 50
    priority 254
    preempt delay 15
    timer 4
    track interface GigabitEthernet0/0/0/2 30
    address linklocal autoconfig
    accept-mode disable

# VRRP
# Router A:
config
interface tenGigE 0/4/0/4
ipv4 address 10.1.0.1/24
exit
router vrrp
interface tenGigE 0/4/0/4
address-family ipv4
vrrp 1 version 2
priority 120
text-authentication cisco
timer 3
address 10.0.0.100
vrrp 5 version 2
timer 30
address 10.0.0.105
vrrp 5 version 2
preempt disable
address 10.0.0.200
commit

# Router B:
config
interface tenGigE 0/4/0/4
ipv4 address 10.1.0.2/24
exit
router vrrp
interface tenGigE 0/4/0/4
address-family ipv4
vrrp 1 version 2
priority 100
text-authentication cisco
timer 3
address 10.0.0.100
vrrp 5 version 2
priority 200
timer 30
address 10.0.0.105
vrrp 5 version 2
preempt disable
address 10.0.0.200
commit

# BFD Over BGP: Example
# The following example shows how to configure BFD between autonomous system 65000 and neighbor 192.168.70.24:
RP/0/RP0/CPU0:router#configure
RP/0/RP0/CPU0:router(config)#router bgp 65000
RP/0/RP0/CPU0:router(config-bgp)#bfd multiplier 2
RP/0/RP0/CPU0:router(config-bgp)#bfd minimum-interval 20
RP/0/RP0/CPU0:router(config-bgp)#neighbor 192.168.70.24
RP/0/RP0/CPU0:router(config-bgp-nbr)#remote-as 2
RP/0/RP0/CPU0:router(config-bgp-nbr)#bfd fast-detect
RP/0/RP0/CPU0:router(config-bgp-nbr)#commit
RP/0/RP0/CPU0:router(config-bgp-nbr)#end
RP/0/RP0/CPU0:router#show run router bgp

# BFD Over OSPF: Examples
# The following example shows how to enable BFD for OSPF on a Gigabit Ethernet interface:
RP/0/RP0/CPU0:router#configure
RP/0/RP0/CPU0:router(config)#router ospf 0
RP/0/RP0/CPU0:router(config-ospf)#area 0
RP/0/RP0/CPU0:router(config-ospf-ar)#interface gigabitEthernet 0/3/0/1
RP/0/RP0/CPU0:router(config-ospf-ar-if)#bfd fast-detect
RP/0/RP0/CPU0:router(config-ospf-ar-if)#commit
RP/0/RP0/CPU0:router(config-ospf-ar-if)#end
RP/0/RP0/CPU0:router#show run router ospf

# The following example shows how to enable BFD for OSPFv3 on a Gigabit Ethernet interface:
RP/0/RP0/CPU0:router#configure
RP/0/RP0/CPU0:router(config)#router ospfv3 0
RP/0/RP0/CPU0:router(config-ospfv3)#bfd minimum-interval 6500
RP/0/RP0/CPU0:router(config-ospfv3)#bfd multiplier 7
RP/0/RP0/CPU0:router(config-ospfv3-ar)#area 0
RP/0/RP0/CPU0:router(config-ospfv3-ar)#interface gigabitethernet 0/1/5/0
RP/0/RP0/CPU0:router(config-ospfv3-ar-if)#bfd fast-detect
RP/0/RP0/CPU0:router(config-ospfv3-ar-if)#commit
RP/0/RP0/CPU0:router(config-ospfv3-ar-if)#end
RP/0/RP0/CPU0:router#show run router ospfv3

# BFD on Bundled VLANs: Example
# The following example shows how to configure BFD on bundled VLANs:
RP/0/RP0/CPU0:router#configure
RP/0/RP0/CPU0:router(config)#bfd
RP/0/RP0/CPU0:router(config-bfd)#multipath include location 0/0/CPU0
RP/0/RP0/CPU0:router(config-bfd)#exit
RP/0/RP0/CPU0:router#configure
RP/0/RP0/CPU0:router(config)#interface Bundle-ether 1
RP/0/RP0/CPU0:router(config-if)#bundle maximum-active links 1
RP/0/RP0/CPU0:router(config-if)#exit
RP/0/RP0/CPU0:router(config)#interface TenGigE 0/1/0/1
RP/0/RP0/CPU0:router(config-if)#bundle id 1 mode active
RP/0/RP0/CPU0:router(config-if)#exit
RP/0/RP0/CPU0:router(config)#interface TenGigE 0/2/0/1
RP/0/RP0/CPU0:router(config-if)#bundle id 1 mode active
RP/0/RP0/CPU0:router(config-if)#exit
RP/0/RP0/CPU0:router(config)#interface Bundle-Ether1.2
RP/0/RP0/CPU0:router(config-if)#ipv4 address 172.16.2.1 255.255.255.0
RP/0/RP0/CPU0:router(config-if)#encapsulation dot1q 2
RP/0/RP0/CPU0:router(config-if)#exit
RP/0/RP0/CPU0:router(config)#interface Bundle-Ether1.1
RP/0/RP0/CPU0:router(config-if)#ipv4 address 172.16.1.1 255.255.255.0
RP/0/RP0/CPU0:router(config-if)#encapsulation dot1q 1
RP/0/RP0/CPU0:router(config)#router static
RP/0/RP0/CPU0:router(config-static)#address-family ipv4 unicast
RP/0/RP0/CPU0:router(config-static-afi)#10.2.1.0/24 172.16.1.2 bfd fast-detect minimum-interval 250
RP/0/RP0/CPU0:router(config-static-afi)#10.2.2.0/24 172.16.2.2 bfd fast-detect minimum-interval 250
RP/0/RP0/CPU0:router(config-static-afi)#10.2.3.0/24 172.16.3.2 bfd fast-detect minimum-interval 250
RP/0/RP0/CPU0:router(config-static-afi)#exit
RP/0/RP0/CPU0:router(config-static)#exit


interface GigE0/1/0/10
 bundle id 1 mode active
 no shut
!
interface Bundle-Ether1
no shut
!
interface Bundle-Ether1.100 l2transport
 encapsulation dot1q 100
 rewrite ingress tag pop 1 symmetric

router static
 address-family ipv4 unicast
  0.0.0.0/0 7.37.0.1

router ospf 100
vrf cctv1
  router-id 192.168.1.1
  area 0
   interface BVI100

###

l2vpn
 bridge group bg
  bridge-domain bd
   interface Bundle-Ether1.100
   !
   routed interface BVI100

router vrrp
 interface BVI100
  bfd minimum-interval 15
  address-family ipv4
   vrrp 100
    address 192.168.1.254
    bfd fast-detect peer ipv4 192.168.1.1

interface BVI100
 vrf cctv1
 ipv4 address 192.168.1.2 255.255.255.0

interface GigE0/1/0/0
 bundle id 1 mode active
 no shut

interface Bundle-Ether1.100 l2transport
 encapsulation dot1q 100
 rewrite ingress tag pop 1 symmetric

