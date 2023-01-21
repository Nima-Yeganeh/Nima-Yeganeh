# ISIS Config
# Cisco Router

# R1
# show run int lo3
Building configuration...

Current configuration : 87 bytes
!
interface Loopback3
 ip address 172.16.1.1 255.255.255.255
 ip router isis test
end

# show run int gi4.12
Building configuration...

Current configuration : 119 bytes
!
interface GigabitEthernet4.12
 encapsulation dot1Q 12
 ip address 172.16.3.1 255.255.255.0
 ip router isis test
end

# show run | sec router isis
router isis test
 net 49.0001.0172.1600.1001.00
 passive-interface Loopback3

# R3
# show run int lo 3
Building configuration...

Current configuration : 87 bytes
!
interface Loopback3
 ip address 172.16.1.3 255.255.255.255
 ip router isis test
end

# show run int gi4.12
Building configuration...

Current configuration : 119 bytes
!
interface GigabitEthernet4.12
 encapsulation dot1Q 12
 ip address 172.16.3.3 255.255.255.0
 ip router isis test
end

# show run | sec router isis
 ip router isis test
router isis test
 net 49.0001.1720.1600.1003.00
 passive-interface Loopback3

# Verification Commands >> ISIS
# show isis neighbors

Tag test:
System Id      Type Interface   IP Address      State Holdtime Circuit Id
R3             L1   Gi4.12      172.16.3.3      UP    8        R3.01
R3             L2   Gi4.12      172.16.3.3      UP    7        R3.01
R1#

# show isis rib
IPv4 local RIB for IS-IS process test

IPV4 unicast topology base (TID 0, TOPOID 0x0) =================

172.16.1.1/32
  [115/L2/20] via 172.16.3.3(GigabitEthernet4.12), from 172.16.1.3, tag 0, LSP[5/4]

172.16.1.3/32
  [115/L1/10] via 172.16.3.3(GigabitEthernet4.12), from 172.16.1.3, tag 0, LSP[6/2]
              (installed)
  [115/L2/10] via 172.16.3.3(GigabitEthernet4.12), from 172.16.1.3, tag 0, LSP[5/4]

172.16.3.0/24
  [115/L1/20] via 172.16.3.3(GigabitEthernet4.12), from 172.16.1.3, tag 0, LSP[6/2]
  [115/L2/20] via 172.16.3.3(GigabitEthernet4.12), from 172.16.1.3, tag 0, LSP[5/4]
R1#

# show clns
Global CLNS Information:
  1 Interfaces Enabled for CLNS
  Configuration Timer: 60, Default Holding Timer: 300, Packet Lifetime 64
  ERPDU's requested on locally generated packets
  Running IS-IS in IP-only mode (CLNS forwarding not allowed)
  NET: 49.0001.0172.1600.1001.00
R1#

# show clns neighbors

Tag test:
System Id      Interface   SNPA                State  Holdtime  Type Protocol
R3             Gi4.12      5000.0003.0003      Up     8         L1L2 IS-IS
R1#

# show clns interface gi4.12
GigabitEthernet4.12 is up, line protocol is up
  Checksums enabled, MTU 1497, Encapsulation SAP
  ERPDUs enabled, min. interval 10 msec.
  CLNS fast switching enabled
  CLNS SSE switching disabled
  DEC compatibility mode OFF for this interface
  Next ESH/ISH in 17 seconds
  Routing Protocol: IS-IS (test)
    Circuit Type: level-1-2
    Interface number 0x1, local circuit ID 0x1
    Level-1 Metric: 10, Priority: 64, Circuit ID: R3.01
    DR ID: R3.01
    Level-1 IPv6 Metric: 10
    Number of active level-1 adjacencies: 1
    Level-2 Metric: 10, Priority: 64, Circuit ID: R3.01
    DR ID: R3.01
    Level-2 IPv6 Metric: 10
    Number of active level-2 adjacencies: 1
    Next IS-IS LAN Level-1 Hello in 4 seconds
    Next IS-IS LAN Level-2 Hello in 3 seconds
R1#

