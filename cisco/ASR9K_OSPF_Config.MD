# ASR OSPF Config
# https://www.cisco.com/c/en/us/td/docs/routers/asr9000/software/routing/configuration/guide/rcasr9kospf.html

!
router ospf test
 address-family ipv4
 area 0
  authentication-key encrypted 01100F175804
  authentication message-digest
  message-digest-key 1 md5 encrypted 121A0C041104
  network broadcast
  hello-interval 1
  interface GigabitEthernet0/0/0/1
   network broadcast
  !
 !

# Verification
RP/0/RP0/CPU0:R1#
RP/0/RP0/CPU0:R1#show ip protocols
Thu Jan 26 11:50:53.814 UTC

Routing Protocol OSPF test
  Router Id: 192.168.244.101
  Distance: 110
  Non-Stop Forwarding: Disabled
  Redistribution:
    None
  Area 0
    GigabitEthernet0/0/0/1
      authentication md5
RP/0/RP0/CPU0:R1#

# Verification
RP/0/RP0/CPU0:R1#show ip ospf int bri
Thu Jan 26 11:51:06.532 UTC

* Indicates MADJ interface, (P) Indicates fast detect hold down state

Interfaces for OSPF test

Interface          PID   Area            IP Address/Mask    Cost  State Nbrs F/C
Gi0/0/0/1          test  0               192.168.244.101/24 1     DR    0/0
RP/0/RP0/CPU0:R1#

# Verification
RP/0/RP0/CPU0:R1#show ip ospf
Thu Jan 26 11:51:23.677 UTC

 Routing Process "ospf test" with ID 192.168.244.101
 Role: Primary Active
 NSR (Non-stop routing) is Enabled
 Supports only single TOS(TOS0) routes
 Supports opaque LSA
 Router is not originating router-LSAs with maximum metric
 Initial SPF schedule delay 50 msecs
 Minimum hold time between two consecutive SPFs 200 msecs
 Maximum wait time between two consecutive SPFs 5000 msecs
 Initial LSA throttle delay 50 msecs
 Minimum hold time for LSA throttle 200 msecs
 Maximum wait time for LSA throttle 5000 msecs
 Minimum LSA interval 200 msecs. Minimum LSA arrival 100 msecs
 LSA refresh interval 1800 seconds
 Flood pacing interval 33 msecs. Retransmission pacing interval 66 msecs
 Adjacency stagger enabled; initial (per area): 2, maximum: 64
    Number of neighbors forming: 0, 0 full
 Maximum number of configured interfaces 1024
 Number of external LSA 0. Checksum Sum 00000000
 Number of opaque AS LSA 0. Checksum Sum 00000000
 Number of DCbitless external and opaque AS LSA 0
 Number of DoNotAge external and opaque AS LSA 0
 Number of areas in this router is 1. 1 normal 0 stub 0 nssa
 External flood list length 0
 SNMP trap is enabled
 LSD connected, registered, bound, revision 1
 Segment Routing Global Block default (16000-23999), not allocated
 Segment Routing Local Block, not allocated
 Strict-SPF capability is enabled
    Area BACKBONE(0) (Inactive)
        Number of interfaces in this area is 1
        SPF algorithm executed 1 times
        Number of LSA 1.  Checksum Sum 0x0077d4
        Number of opaque link LSA 0.  Checksum Sum 00000000
        Number of DCbitless LSA 0
        Number of indication LSA 0
        Number of DoNotAge LSA 0
        Flood list length 0
        Number of LFA enabled interfaces 0, LFA revision 0
        Number of Per Prefix LFA enabled interfaces 0
        Number of neighbors forming in staggered mode 0, 0 full
RP/0/RP0/CPU0:R1#

# Verification
RP/0/RP0/CPU0:R1#show ip ospf routes
Thu Jan 26 11:52:21.301 UTC

Topology Table for ospf test with ID 192.168.244.101

Codes: O - Intra area, O IA - Inter area
       O E1 - External type 1, O E2 - External type 2
       O N1 - NSSA external type 1, O N2 - NSSA external type 2

O    192.168.244.0/24, metric 1
       192.168.244.101, directly connected, via GigabitEthernet0/0/0/1, ifIndex 7
RP/0/RP0/CPU0:R1#

