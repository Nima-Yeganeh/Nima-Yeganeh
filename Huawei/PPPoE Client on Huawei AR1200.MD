# PPPoE Client on Huawei AR1200

system-view
sysname Router
dialer-rule
dialer-rule 1 ip permit
quit 

interface dialer 1
dialer user user2
dialer-group 1
dialer bundle 1
ppp chap user user1@system
ppp chap password cipher huawei
dialer timer idle 300
dialer queue-length 8
ip address ppp-negotiate
quit 

interface gigabitethernet 2/0/0
pppoe-client dial-bundle-number 1 on-demand
quit 

ip route-static 0.0.0.0 0 dialer 1 

display pppoe-client session summary

