# implementing-network-stack-ipv4-and-ipv6

# R1

interface Loopback0
 ipv4 address 1.1.1.1 255.255.255.255
 ipv6 address 2001::1/128

interface tunnel-ip103
 ipv4 address 172.17.103.1 255.255.255.252
 ipv6 address 2001:a:b:c::1/64
 tunnel mode gre ipv4
 tunnel source 1.1.1.103
 tunnel destination 2.2.2.103

# R2

interface Loopback0
 ipv4 address 2.2.2.2 255.255.255.255
 ipv6 address 2001::2/128

interface tunnel-ip103
 ipv4 address 172.17.103.2 255.255.255.252
 ipv6 address 2001:a:b:c::2/64
 tunnel mode gre ipv4
 tunnel source 2.2.2.103
 tunnel destination 1.1.1.103

# https://www.cisco.com/c/en/us/td/docs/iosxr/cisco8000/ip-addresses/75x/b-ip-addresses-cg-8k-75x/implementing-network-stack-ipv4-and-ipv6.html
