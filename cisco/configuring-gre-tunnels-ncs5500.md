# configuring-gre-tunnels-ncs5500

# R1
interface tunnel-ip101
 mtu 9216
 ipv4 address 172.17.101.1 255.255.255.252
 tunnel mode gre ipv4
 tunnel source 172.16.101.1
 tunnel destination 172.16.101.2

# R2
interface tunnel-ip101
 mtu 9216
 ipv4 address 172.17.101.2 255.255.255.252
 tunnel mode gre ipv4
 tunnel source 172.16.101.2
 tunnel destination 172.16.101.1

# https://www.cisco.com/c/en/us/td/docs/iosxr/ncs5500/interfaces/71x/configuration/guide/b-interfaces-hardware-component-cg-ncs5500-71x/m-configuring-gre-tunnels-ncs5500.pdf

