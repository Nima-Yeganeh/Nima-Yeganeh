# Juniper Commands

set system root-auth plain
commit

set system host-name R1
commit

run show interface terse
set interface ge-0/0/0 unit 0 family inet address 100.100.100.1/24
set interface ge-0/0/0 unit 0 description Link_to_R2
commit

run show interface terse
set interface ge-0/0/0.0 family inet address 100.100.100.2/24
set interface ge-0/0/0.0 description Link_to_R1
commit

run show route
ping

set interface lo0.0 family inet address 10.10.10.1/32
set interface lo0.0 family inet address 10.10.10.2/32
set interface lo0.0 family inet address 10.10.10.3/32
set interface lo0.0 family inet address 10.10.10.4/32
commit
show run route

set routing-options static route 10.0.0.0/8 next-hop 100.100.100.2
show | compare
commit
run show route
run ping 10.10.10.1

exit
configure
show routing-options
run show interface terse

edit routing-options static defaults

