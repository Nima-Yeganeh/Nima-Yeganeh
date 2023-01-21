# IPv6_DHCP_Server_Client_Config

# Cisco Router Server Config
ipv6 dhcp pool dhcp-pool
 dns-server 2001:DB8:A:B::1
 dns-server 2001:DB8:3000:3000::42
 domain-name example.com
!
ipv6 unicast-routing
interface GigabitEthernet4
 description Access link down to customers
 no ip address
 negotiation auto
 ipv6 address 2001:DB8:1234:42::1/64
 ipv6 enable
 ipv6 nd other-config-flag
 ipv6 dhcp server dhcp-pool

# Cisco Router Client Config
# R3
# show run int gi4
interface GigabitEthernet4
 no ip address
 negotiation auto
 ipv6 address autoconfig
 ipv6 enable

# Verification
# R1
# show ipv6 dhcp pool
DHCPv6 pool: dhcp-pool
  DNS server: 2001:DB8:A:B::1
  DNS server: 2001:DB8:3000:3000::42
  Domain name: example.com
  Active clients: 0
# R1
# show ipv6 dhcp interface
GigabitEthernet4 is in server mode
  Using pool: dhcp-pool
  Preference value: 0
  Hint from client: ignored
  Rapid-Commit: disabled
# R1
# show ipv6 neighbors
IPv6 Address                              Age Link-layer Addr State Interface
2001:DB8:1234:42:5200:FF:FE03:3             6 5000.0003.0003  STALE Gi4
FE80::5200:FF:FE03:3                        6 5000.0003.0003  STALE Gi4

