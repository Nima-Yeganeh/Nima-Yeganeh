# ASR1000 IOS XE ISG L2 DHCP Subscribers
!
aaa new-model
!
aaa group server radius test-rad
 server name rad1
 server name rad2
 server-private 1.1.1.1 auth-port 1812 acct-port 1813 key 7 x
 server-private 1.1.1.1 auth-port 1812 acct-port 1813 key 7 x
 ip radius source-interface x.x
!
aaa authentication login default local enable
aaa authentication login IPOE group test-rad
aaa authentication ppp test-rad if-needed group test-rad
aaa authorization exec default local group test-rad
aaa authorization network default group test-rad
aaa authorization network test-rad group test-rad
aaa authorization network IPOE group test-rad
aaa authorization configuration default group radius
aaa authorization configuration IA_PD group radius
aaa authorization subscriber-service default group test-rad
aaa authorization subscriber-service IPOE group test-rad
aaa accounting delay-start
aaa accounting update periodic 15
aaa accounting network default start-stop group test-rad
aaa accounting network test-rad start-stop group test-rad
aaa accounting network IPOE start-stop group test-rad
!
ip dhcp relay information trust-all
!
ip dhcp pool 10.18.0.0/16
 network 10.18.0.0 255.255.0.0
 default-router 10.18.0.1
 dns-server 8.8.8.8 8.8.4.4
!
subscriber service multiple-accept
subscriber service session-accounting
subscriber templating
!
!
class-map type traffic match-any tmap1
!
class-map type traffic match-any accounting
!
class-map type control match-all IP_UNAUTH_COND
 match timer IP_UNAUTH_TIMER
 match authen-status unauthenticated
!
policy-map type service radius-accounting
 class type traffic accounting
  accounting aaa list IPOE
 !
!
policy-map type control IPOE_SANDPIT
 class type control IP_UNAUTH_COND event timed-policy-expiry
  10 service disconnect
 !
 class type control always event account-logon
  10 authenticate aaa list IPOE
 !
 class type control always event session-start
  10 authorize aaa list IPOE password cisco123 identifier circuit-id
  50 set-timer IP_UNAUTH_TIMER 10
 !
 class type control always event account-logoff
  10 service disconnect delay 5
 !
 class type control always event session-restart
  10 authorize aaa list IPOE password cisco123 identifier circuit-id
  50 set-timer IP_UNAUTH_TIMER 10
 !
 class type control always event access-reject
 !
!
interface Loopback13
 ip address 10.18.0.1 255.255.0.0
!
interface GigabitEthernet0/0/1
 no ip address
 speed 1000
 no negotiation auto
 cdp enable
!
interface GigabitEthernet0/0/1.31
 description IPOE_TEST
 encapsulation dot1Q 31 second-dot1q any
 ip unnumbered Loopback13
 service-policy type control IPOE_SANDPIT
 ip subscriber l2-connected
  initiator dhcp
!
radius-server attribute nas-port format d
radius-server attribute 31 mac format ietf
radius-server attribute 31 send nas-port-detail mac-only
radius-server attribute 31 remote-id
radius-server attribute 31 append-circuit-id
radius-server configure-nas
radius-server retransmit 2
