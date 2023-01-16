# Huawei AR Series Access Routers
# PPPoE Configuration

PPPoE Packet Type
● The value 0x09 indicates PPPoE Active Discovery Initiation (PADI)
● The value 0x07 indicates PPPoE Active Discovery Offer (PADO) packets.
● The value 0x19 indicates PPPoE Active Discovery Request (PADR) packets.
● The value 0x65 indicates PPPoE Active Discovery Session-confirmation (PADS) packets.
● The value 0x00 indicates session data.
● The value 0xa7 indicates PPPoE Active Discovery Terminate (PADT) packets.

<Huawei> system-view
[Huawei] sysname Router
[Router] ip pool pool1
[Router-ip-pool-pool1] network 192.168.10.0 mask 255.255.255.0
[Router-ip-pool-pool1] gateway-list 192.168.10.1
[Router-ip-pool-pool1] quit

[Router] aaa
[Router-aaa] authentication-scheme system_a
[Router-aaa-authen-system_a] authentication-mode local
[Router-aaa-authen-system_a] quit
[Router-aaa] authorization-scheme system_a
[Router-aaa-author-system_a] quit
[Router-aaa] domain system
[Router-aaa-domain-system] authentication-scheme system_a
[Router-aaa-domain-system] authorization-scheme system_a
[Router-aaa-domain-system] quit
[Router-aaa] local-user user1@system password
[Router-aaa] local-user user1@system service-type ppp
[Router-aaa] quit

[Router] interface virtual-template 1
[Router-Virtual-Template1] ppp authentication-mode chap domain system
[Router-Virtual-Template1] ip address 192.168.10.1 255.255.255.0
[Router-Virtual-Template1] remote address pool pool1
[Router-Virtual-Template1] ppp ipcp dns 10.10.10.10 10.10.10.11
[Router-Virtual-Template1] quit

[Router] interface gigabitethernet 1/0/0
[Router-GigabitEthernet1/0/0] pppoe-server bind virtual-template 1
[Router-GigabitEthernet1/0/0] quit
[Router] quit

<Router> display pppoe-server session ala

#
 sysname Router
#
ip pool pool1
 gateway-list 192.168.10.1
 network 192.168.10.0 mask 255.255.255.0
#
aaa
 authentication-scheme system_a
 authorization-scheme system_a
 domain system
 authentication-scheme system_a
 authorization-scheme system_a
 local-user user1@system password cipher %^%#9T`|L}K(4#J3k=+I8SiJrsM:RO[iy@Uuc:LTQJ,1%^%#
 local-user user1@system privilege level 0
 local-user user1@system service-type ppp
#
interface Virtual-Template1
 ppp authentication-mode chap domain system
 remote address pool pool1
 ppp keepalive retry-times 2
 ppp ipcp dns 10.10.10.10 10.10.10.11
 timer hold 30
 ip address 192.168.10.1 255.255.255.0
#
interface GigabitEthernet1/0/0
 pppoe-server bind Virtual-Template 1
#
return 

<Huawei> system-view
[Huawei] sysname Router
[Router] interface dialer 1
[Router-Dialer1] dialer user user2
[Router-Dialer1] dialer bundle 1
[Router-Dialer1] ppp chap user user1@system
[Router-Dialer1] ppp chap password cipher huawei123
[Router-Dialer1] ip address ppp-negotiate
[Router-Dialer1] quit

[Router] interface gigabitethernet 2/0/0
[Router-GigabitEthernet2/0/0] pppoe-client dial-bundle-number 1
[Router-GigabitEthernet2/0/0] quit

[Router] acl number 3002
[Router-acl-adv-3002] rule 5 permit ip source 192.168.10.0 0.0.0.255
[Router-acl-adv-3002] quit
[Router] interface dialer 1
[Router-Dialer1] nat outbound 3002
[Router-Dialer1] quit

[Router] ip route-static 0.0.0.0 0 dialer 1
[Router] quit

<Router> display pppoe-client session summary

#
 sysname Router
#
acl number 3002
 rule 5 permit ip source 192.168.10.0 0.0.0.255
#
interface Dialer1
 link-protocol ppp
 ppp chap user user1@system
 ppp chap password cipher %^%#LHG2'Q8n%8NSLn'4-i'Z18)-%eT"v*||t1Mh;NbH%^%#
 ip address ppp-negotiate
 dialer user user2
 dialer bundle 1
 nat outbound 3002
#
interface GigabitEthernet2/0/0
 pppoe-client dial-bundle-number 1
#
ip route-static 0.0.0.0 0.0.0.0 Dialer1
#
return

#
 sysname Router
#
acl number 3002
 rule 5 permit ip source 192.168.10.0 0.0.0.255
#
interface Dialer1
 link-protocol ppp
 ppp chap user user1@system
 ppp chap password cipher %^%#R=>NT8A-8KmWU38WOZq(s%MsRSg>3,}l9b%K.%!S%^%#
 ip address ppp-negotiate
 dialer user user2
 dialer bundle 1
 dialer number 1 autodial
 nat outbound 3002
#
interface Dialer2
 link-protocol ppp
 ppp chap user user1@system
 ppp chap password cipher %^%#$`GP<&RG`A@+F/'fP)xY84g7V/%g-Oahd"*"r/'Z%^%#
 ip address ppp-negotiate
 dialer user user2
 dialer bundle 2
 nat outbound 3002
#
interface GigabitEthernet2/0/0
 pppoe-client dial-bundle-number 1
#
interface GigabitEthernet3/0/0
 pppoe-client dial-bundle-number 2
#
ip route-static 0.0.0.0 0.0.0.0 Dialer1
ip route-static 0.0.0.0 0.0.0.0 Dialer2 preference 100
#
return

