service timestamps debug datetime msec
service timestamps log datetime msec
hostname ISG99
boot-start-marker
boot-end-marker
aaa new-model

aaa group server radius ISG_TEST
server 10.63.9.105 auth-port 1812 acct-port 1813
ip radius source-interface FastEthernet0/0
attribute nas-port format e UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU

aaa authentication login IPOE-CLIENTS group ISG_TEST
aaa authentication ppp PPPOE-CLIENTS group ISG_TEST
aaa authorization network PPPOE-CLIENTS group ISG_TEST
aaa authorization network IPOE-CLIENTS group ISG_TEST
aaa authorization subscriber-service default local group ISG_TEST
aaa authorization subscriber-service PPPOE-CLIENTS local group ISG_TEST
aaa authorization subscriber-service IPOE-CLIETNS local group ISG_TEST
aaa accounting update periodic 1
aaa accounting network default start-stop group radius
aaa accounting network PPPOE-CLIENTS start-stop group ISG_TEST
aaa accounting network IPOE-CLIENTS start-stop group ISG_TEST

aaa server radius dynamic-author
client 10.63.9.105 server-key cisco
auth-type any
ignore session-key
ignore server-key

aaa session-id common
clock timezone RTZ-3 4 0
no ip icmp rate-limit unreachable

no ip domain lookup
ip cef
no ipv6 cef

subscriber authorization enable
async-bootp dns-server 81.22.63.7
multilink bundle-name authenticated

redirect server-group PORTAL
server ip 81.22.63.53 port 80

ip tcp synwait-time 5
class-map type traffic match-any CLASS-TO-REDIRECT
match access-group input 199
match access-group output 199

class-map type traffic match-any CLASS-TRUSTED
match access-group input 198
match access-group output 198

class-map type control match-all ISG-IP-UNAUTH
match authen-status unauthenticated
match timer UNAUTH-TIMER

policy-map type service LOCAL-L4R
5 class type traffic CLASS-TO-REDIRECT
 redirect to group PORTAL

class type traffic default in-out
 drop

policy-map type service SERVICE-TRUSTED
1 class type traffic CLASS-TRUSTED
 police input 1024000 192000 384000
 police output 1024000 192000 384000

class type traffic default input
 drop

policy-map type control ISG
class type control always event session-start
 1 authenticate aaa list PPPOE-CLIENTS

policy-map type control ISG-IPOE-POLICY
class type control ISG-IP-UNAUTH event timed-policy-expiry
 1 service disconnect

class type control always event session-start
 10 authorize aaa list IPOE-CLIENTS password cisco identifier source-ip-address
 20 set-timer UNAUTH-TIMER 3
 30 service-policy type service name SERVICE-TRUSTED
 40 service-policy type service name LOCAL-L4R

class type control always event session-restart
 10 authorize aaa list IPOE-CLIENTS password cisco identifier source-ip-address
 20 set-timer UNAUTH-TIMER 3
 30 service-policy type service name SERVICE-TRUSTED
 40 service-policy type service name LOCAL-L4R

class type control always event radius-timeout
 1 service-policy type service name SERVICE-TRUSTED
 2 service-policy type service name LOCAL-L4R

class type control always event account-logoff
 1 service disconnect delay 5

bba-group pppoe global
virtual-template 1
sessions auto cleanup

interface FastEthernet0/0
ip address 10.63.2.96 255.255.255.0
ip nat outside
duplex full

interface FastEthernet0/0.2

interface FastEthernet1/0
no ip address
duplex full
pppoe enable group global

interface FastEthernet1/0.251
encapsulation dot1Q 251
ip address 60.1.1.1 255.255.255.252
ip nat inside
service-policy type control ISG-IPOE-POLICY
ip subscriber routed
 initiator unclassified ip-address

interface Virtual-Template1
mtu 1492
ip unnumbered FastEthernet0/0
no ip redirects
no ip unreachables
no ip proxy-arp
ip nat inside
no peer default ip address
ppp authentication chap pap ms-chap-v2 PPPOE-CLIENTS
ppp authorization PPPOE-CLIENTS
ppp accounting PPPOE-CLIENTS
service-policy type control ISG

ip local pool PPPOE-CLIENT-POOL 10.99.99.200 10.99.99.254
ip nat inside source list NAT interface FastEthernet0/0 overload
ip forward-protocol nd

no ip http server
no ip http secure-server
ip route 0.0.0.0 0.0.0.0 10.63.2.254

ip access-list standard NAT
permit 10.37.37.0 0.0.0.255
permit 60.1.1.0 0.0.0.3

ip access-list extended PPPOE-ACL-IN
deny   icmp any any
permit ip any any
ip access-list extended PPPOE-ACL-OUT
deny   icmp any any
permit ip any any

ip radius source-interface FastEthernet0/0
access-list 197 permit tcp any any eq www
access-list 198 permit udp any any eq domain
access-list 198 permit udp any eq domain any
access-list 198 permit tcp any host 194.54.14.159 eq www
access-list 198 permit tcp any host 194.54.14.159 eq 443
access-list 198 permit icmp any any
access-list 198 deny   ip any any
access-list 199 permit tcp any any eq www
access-list 199 permit tcp any any eq 443
access-list 199 permit tcp any any eq 8080

radius-server attribute 44 include-in-access-req default-vrf
radius-server attribute 6 on-for-login-auth
radius-server attribute 8 include-in-access-req
radius-server attribute 32 include-in-access-req
radius-server attribute 32 include-in-accounting-req
radius-server attribute 55 include-in-acct-req
radius-server attribute 55 access-request include
radius-server attribute 25 access-request include
radius-server attribute nas-port format e UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU
radius-server attribute 31 send nas-port-detail mac-only
radius-server host 10.63.9.105 auth-port 1812 acct-port 1813 key cisco
radius-server key cisco
radius-server vsa send accounting
radius-server vsa send authentication

control-plane

line con 0
exec-timeout 0 0
privilege level 15
logging synchronous
stopbits 1
line aux 0
exec-timeout 0 0
privilege level 15
logging synchronous
stopbits 1
line vty 0 4
transport input telnet

ntp update-calendar
ntp server 132.163.4.101
ntp server 132.163.4.103

end

show subscriber session detailed

aaa authentication login IPOE-CLIENTS group ISG_TEST

interface TenGigabitEthernet0/1/0.2002044
description user blah-blah-blah
encapsulation dot1Q 200 second-dot1q 2044
ip unnumbered Loopback2
ip nat outside
ip verify unicast source reachable-via rx l2-src
service-policy type control IPoE
ip subscriber routed
 initiator unclassified ip-address


policy-map type control IPoE
class type control CM_C_IPoE_RTIMEOUT_REAUTH event timed-policy-expiry
 1 service disconnect

class type control CM_C_IPoE_REJECT_REAUTH event timed-policy-expiry
 1 service disconnect

class type control always event session-start
 10 authorize aaa list IPOE password ciscoo identifier source-ip-address
 20 set-timer IPoE_REJECT_REAUTH 1
 30 service-policy type service aaa list IPOE name NoMoney10
 34 service-policy type service aaa list IPOE name NoMoney400
 40 service-policy type service aaa list IPOE name NoMoney500
 50 service-policy type service aaa list IPOE name NoMoney510

class type control always event service-stop
 1 service-policy type service unapply identifier service-name

class type control always event session-restart
 10 authorize aaa list IPOE password ciscoo identifier source-ip-address
 20 set-timer IPoE_REJECT_REAUTH 1
 30 service-policy type service aaa list IPOE name NoMoney10
 34 service-policy type service aaa list IPOE name NoMoney400
 40 service-policy type service aaa list IPOE name NoMoney500
 50 service-policy type service aaa list IPOE name NoMoney510

class type control always event radius-timeout
 1 set-timer IPoE_RTIMEOUT_REAUTH 1
 10 service-policy type service aaa list IPOE name NoMoney10
 14 service-policy type service aaa list IPOE name NoMoney400
 20 service-policy type service aaa list IPOE name NoMoney500
 30 service-policy type service aaa list IPOE name NoMoney510

policy-map type control isgPolicyControl
class type control always event session-start
 1 authenticate aaa list isgAuth
