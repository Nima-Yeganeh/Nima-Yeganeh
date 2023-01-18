aaa new-model
aaa session-mib disconnect

aaa group server radius acct-test
server-private 2.2.2.2 key 7 abcd1234

aaa group server radius auth-test
server-private 2.2.2.2 key 7 abcd1234

aaa authorization network test group auth-test
aaa authorization subscriber-service default local group auth-test
aaa accounting delay-start
aaa accounting update periodic 30
aaa accounting network test start-stop broadcast group auth-test
aaa session-id common

ip domain name mydomain.com
ip dhcp relay information trust-all

ip dhcp pool IPOE-pool-1
network 4.3.2.0 255.255.255.0
default-router 4.3.2.1
dns-server 8.8.8.8 8.8.4.4

subscriber templating

policy-map type control IPOE-AUTH
class type control always event session-start
10 authorize aaa list auth-test password lab2017 identifier circuit-id
20 service disconnect

interface Loopback1
ip address 4.3.2.1 255.255.255.0

interface TenGigabitEthernet0/2/0
no ip address

interface TenGigabitEthernet0/2/0.81
encapsulation dot1Q 81
ip unnumbered Loopback1
service-policy type control IPOE-AUTH
ip subscriber l2-connected
initiator dhcp class-aware

ip forward-protocol nd

p access-list extended ACL_IN_DEF_BW
permit ip any any
ip access-list extended ACL_OUT_DEF_BW
permit ip any any

radius-server dead-criteria time 5 tries 5
radius-server retry method reorder
radius-server deadtime 1

