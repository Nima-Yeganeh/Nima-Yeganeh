# IPoE
# MPLS
# BNG
# Config
# ASR9K

# ASR1K Config
pseudowire-class MPLS
 encapsulation mpls
interface GigabitEthernet1/0/0
 no ip address
 media-type rj45
 negotiation auto
 cdp enable
 xconnect 10.1.1.1 2020 encapsulation mpls pw-class MPLS
end

ASR1K#show etherchannel summary
Flags:  D - down        P/bndl - bundled in port-channel
        I - stand-alone s/susp - suspended
        H - Hot-standby (LACP only)
        R - Layer3      S - Layer2
        U - in use      f - failed to allocate aggregator

        M - not in use, minimum links not met
        u - unsuitable for bundling
        w - waiting to be aggregated
        d - default port


Number of channel-groups in use: 1
Number of aggregators:           1

Group  Port-channel  Protocol    Ports
------+-------------+-----------+-----------------------------------------------
20	Po20(RU)		LACP	 Gi1/0/1(bndl) Gi1/1/1(bndl)

RU - L3 port-channel UP State
SU - L2 port-channel UP state
P/bndl -  Bundled
S/susp  - Suspended

interface Port-channel20
 ip address 192.168.20.2 255.255.255.0
 no negotiation auto
 mpls ip
end

# ASR9K Config

RP/0/RSP0/CPU0:ACDC-ASR9000-1#show bundle bundle-ether 20
Thu May 21 06:35:39.294 UTC

Bundle-Ether20
  Status:                                    Up
  Local links <active/standby/configured>:   2 / 0 / 2
  Local bandwidth <effective/available>:     2000000 (2000000) kbps
  MAC address (source):                      10f3.1172.02c8 (Chassis pool)
  Inter-chassis link:                        No
  Minimum active links / bandwidth:          1 / 1 kbps
  Maximum active links:                      64
  Wait while timer:                          2000 ms
  Load balancing:                            Default
  LACP:                                      Operational
    Flap suppression timer:                  Off
    Cisco extensions:                        Disabled
  mLACP:                                     Not configured
  IPv4 BFD:                                  Not configured

  Port                  Device           State        Port ID         B/W, kbps
  --------------------  ---------------  -----------  --------------  ----------
  Gi0/0/1/18            Local            Active       0x8000, 0x0007     1000000
      Link is Active
  Gi0/0/1/19            Local            Active       0x8000, 0x0008     1000000
      Link is Active

interface Bundle-Ether20
 ipv4 address 192.168.20.1 255.255.255.0
 load-interval 30
!

l2vpn
 router-id 10.1.1.1
 pw-class ASR1K
  encapsulation mpls
   transport-mode ethernet
  !
 !
 xconnect group PWHE
  p2p ASR1K
   interface PW-Ether20
   neighbor ipv4 10.2.2.2 pw-id 2020
    pw-class ASR1K
   !
  !
 !
!

generic-interface-list BE20_ONLY
 interface Bundle-Ether20
 interface GigabitEthernet0/0/1/18
 interface GigabitEthernet0/0/1/19
!

interface PW-Ether20
 ipv4 address 192.168.1.1 255.255.255.0
 attach generic-interface-list BE20_ONLY
!

# Now, configure the subscriber control policy and apply on PW-Ethernet interface where subscriber is terminated.
dynamic-template
 type ipsubscriber WDAAR_PWHE_DT
  ipv4 verify unicast source reachable-via rx
  ipv4 unnumbered Loopback44
  ipv4 unreachables disable
 !
!

policy-map type control subscriber IPoE_WDAAR_PWHE
 event session-start match-first
  class type control subscriber DHCPv4 do-until-failure
   5 authorize aaa list WDAAR identifier source-address-mac password cisco
   10 activate dynamic-template WDAAR_PWHE_DT
  !
 !
 end-policy-map

interface PW-Ether20.250
 ipv4 address 192.168.10.1 255.255.255.252
 service-policy type control subscriber IPoE_WDAAR_PWHE
 encapsulation dot1q 250
 ipsubscriber ipv4 l2-connected
  initiator dhcp
 !
!

RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn xconnect
Legend: ST = State, UP = Up, DN = Down, AD = Admin Down, UR = Unresolved,
        SB = Standby, SR = Standby Ready, (PP) = Partially Programmed

XConnect                   Segment 1                       Segment 2
Group      Name       ST   Description            ST       Description            ST
------------------------   -----------------------------   -----------------------------
PWHE       ASR1K      UP   PE20                   UP       10.2.2.2         2020   UP
----------------------------------------------------------------------------------------


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn xconnect brief
AToM
  Like-to-Like                        UP       DOWN        UNR
    PW-Ether                           1          0          0
    Total                              1          0          0

  Total                                1          0          0

Total: 1 UP, 0 DOWN, 0 UNRESOLVED

RP/0/RSP0/CPU0:ACDC-ASR9000-1#show subscriber session filter ipv4-address 192.168.44.254
Codes: IN - Initialize, CN - Connecting, CD - Connected, AC - Activated,
       ID - Idle, DN - Disconnecting, ED - End

Type         Interface                State     IP Address (Vrf)

--------------------------------------------------------------------------------
IP:DHCP      PE20.250.ip1             AC        192.168.44.254 (default)


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show subscriber session filter ipv4-address 192.168.44.254 detail
Interface:                PW-Ether20.250.ip1
Circuit ID:               Unknown
Remote ID:                Unknown
Type:                     IP: DHCP-trigger
IPv4 State:               Up, Mon Apr 20 19:32:51 2015
IPv4 Address:             192.168.44.254, VRF: default
Mac Address:              001f.ca3f.7924
Account-Session Id:       00000068
Nas-Port:                 Unknown
User name:                001f.ca3f.7924
Formatted User name:      unknown
Client User name:         unknown
Outer VLAN ID:            250
Subscriber Label:         0x000001db
Created:                  Mon Apr 20 19:32:49 2015
State:                    Activated
Authentication:           unauthenticated
Authorization:            authorized
Access-interface:         PW-Ether20.250
Policy Executed:
policy-map type control subscriber IPoE_WDAAR_PWHE
  event Session-Start match-first [at Mon Apr 20 19:32:49 2015]
    class type control subscriber DHCPv4 do-until-failure [Succeeded]
      5 authorize aaa list WDAAR [Succeeded]
      10 activate dynamic-template WDAAR_PWHE_DT [Succeeded]
Session Accounting: disabled
Last COA request received: unavailable


RP/0/RSP0/CPU0:ACDC-ASR9000-1#ping 192.168.44.254
Mon Feb 23 19:37:58.188 UTC
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 192.168.44.254, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 1/1/2 ms
RP/0/RSP0/CPU0:ACDC-ASR9000-1#



show running-configuration l2vpn
show running-configuration int PW-Ether<Interface-Number>
show running-configuration mpls ldp
show running-configuration generic-interface-list


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn xconnect summary
Thu May 21 05:40:05.068 UTC
Number of groups: 1
Number of xconnects: 1
  Up: 1  Down: 0  Unresolved: 0 Partially-programmed: 0
  AC-PW: 1  AC-AC: 0  PW-PW: 0 Monitor-Session-PW: 0
Number of Admin Down segments: 0
Number of MP2MP xconnects: 0
  Up 0 Down 0
  Advertised: 0 Non-Advertised: 0
Number of CE Connections: 0
  Advertised: 0 Non-Advertised: 0
Backup PW:
  Configured   : 0
  UP           : 0
  Down         : 0
  Admin Down   : 0
  Unresolved   : 0
  Standby      : 0
  Standby Ready: 0
Backup Interface:
  Configured   : 0
  UP           : 0
  Down         : 0
  Admin Down   : 0
  Unresolved   : 0
  Standby      : 0


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn xconnect interface pw-eth20 detail
Thu May 21 05:40:55.789 UTC

Group PWHE, XC ASR1K, state is up; Interworking none
  AC: PW-Ether20, state is up
    Type PW-Ether
    Interface-list: BE20_ONLY
    Replicate status:
    BE20: success
    Gi0/0/1/18: success
    Gi0/0/1/19: success
    MTU 1500; interworking none
    Internal label: 16001
    Statistics:
      packets: received 52970, sent 0
      bytes: received 3485714, sent 0
  PW: neighbor 10.2.2.2, PW ID 2020, state is up ( established )
    PW class asr1k, XC ID 0xc0000001
    Encapsulation MPLS, protocol LDP
    Source address 10.1.1.1
    PW type Ethernet, control word disabled, interworking none
    PW backup disable delay 0 sec
    Sequencing not set

    PW Status TLV in use
      MPLS         Local                          Remote
      ------------ ------------------------------ -----------------------------
      Label        16002                          17
      Group ID     0x920                          unknown
      Interface    PW-Ether20                     unknown
      MTU          1500                           1500
      Control word disabled                       disabled
      PW type      Ethernet                       Ethernet
      VCCV CV type 0x2                            0x2
                   (LSP ping verification)        (LSP ping verification)
      VCCV CC type 0x6                            0x6
                   (router alert label)           (router alert label)
                   (TTL expiry)                   (TTL expiry)
      ------------ ------------------------------ -----------------------------
    Incoming Status (PW Status TLV):
      Status code: 0x0 (Up) in Notification message
    Outgoing Status (PW Status TLV):
      Status code: 0x0 (Up) in Notification message
    MIB cpwVcIndex: 3221225473
    Create time: 21/05/2015 02:52:43 (02:48:12 ago)
    Last time status changed: 21/05/2015 05:21:17 (00:19:38 ago)
    Last time PW went down: 21/05/2015 03:10:45 (02:30:10 ago)
    Statistics:
      packets: received 52970, sent 0
      bytes: received 3485714, sent 0


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show generic-interface-list name BE20_ONLY
Thu May 21 05:43:26.649 UTC
generic-interface-list: BE20_ONLY (ID: 1, interfaces: 3)
   Bundle-Ether20 - items pending 0, downloaded to FIB
   GigabitEthernet0/0/1/18 - items pending 0, downloaded to FIB
   GigabitEthernet0/0/1/19 - items pending 0, downloaded to FIB
 Number of items: 1
 List is downloaded to FIB

RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn generic-interface-list name BE20_ONLY detail
Thu May 21 05:39:04.983 UTC
Generic-interface-list: BE20_ONLY (ID: 1, interfaces: 3)
   Bundle-Ether20 - items pending 0
   GigabitEthernet0/0/1/18 - items pending 0
   GigabitEthernet0/0/1/19 - items pending 0
 Number of items: 1
    PW-Ether: 20


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn ma pwhe interface PW-Ether 20 private
Thu May 21 05:36:28.170 UTC
Interface: PW-Ether20   Interface State: Up, Admin state: Up
  Interface handle 0x920
  MTU:  1514
  BW:   10000 Kbit
  Interface MAC addresses (1 address):
      10f3.1172.02c5
  IDB is not in Replicate Linked List
  IDB is not in Create Linked List
  IDB is not in Attr Linked List
  Opaque flags: 0xe
  Flags: 0x3c
    Valid  : IFH, MTU, MAC, BW
  MA trace history [Num events: 32]
  ---------------------------------------------------
  Time                Event                     Value      Sticky Many
  ====                =====                     ========== ====== ====
  05/21/2015 02:56:05 Remove retry list         0x3        No     No
  05/21/2015 02:56:05 IDB Set flag              0x3c       No     No
  05/21/2015 03:08:26 IDB Set State             0x1        No     No
  05/21/2015 03:08:26 IM publish attr           0x45       No     No
  05/21/2015 03:08:26 IM update init-data       0x1e       No     No
  05/21/2015 03:08:26 IDB Set flag              0x3c       No     No
  05/21/2015 03:08:26 Remove retry list         0x3        No     No
  05/21/2015 03:08:26 IDB Set flag              0x3c       No     No
  05/21/2015 03:09:54 IDB Set State             0          No     No
  05/21/2015 03:09:54 IM publish attr           0x45       No     No
  05/21/2015 03:09:54 IM publish attr           0x52       No     No
  05/21/2015 03:09:54 IM update init-data       0x1e       No     No
  05/21/2015 03:09:54 IDB Set flag              0x3c       No     No
  05/21/2015 03:09:54 Remove retry list         0x3        No     No
  05/21/2015 03:09:54 IDB Set flag              0x3c       No     No
  05/21/2015 03:09:54 Remove retry list         0x3        No     No
  05/21/2015 03:09:54 IDB Set flag              0x3c       No     No
  05/21/2015 03:10:45 IDB Set State             0x1        No     No
  05/21/2015 03:10:45 IM publish attr           0x45       No     No
  05/21/2015 03:10:45 IM update init-data       0x1e       No     No
  05/21/2015 03:10:45 IDB Set flag              0x3c       No     No
  05/21/2015 03:10:45 Remove retry list         0x3        No     No
  05/21/2015 03:10:45 IDB Set flag              0x3c       No     No
  05/21/2015 05:21:17 IDB Set State             0          No     No
  05/21/2015 05:21:17 IM publish attr           0x45       No     No
  05/21/2015 05:21:17 IM publish attr           0x52       No     No
  05/21/2015 05:21:17 IM update init-data       0x1e       No     No
  05/21/2015 05:21:17 IDB Set flag              0x3c       No     No
  05/21/2015 05:21:17 Remove retry list         0x3        No     No
  05/21/2015 05:21:17 IDB Set flag              0x3c       No     No
  05/21/2015 05:21:17 Remove retry list         0x3        No     No
  05/21/2015 05:21:17 IDB Set flag              0x3c       No     No

  CLIENT MA trace history [Num events: 27]
  ---------------------------------------------------
  Time                Event                     Value      Sticky Many
  ====                =====                     ========== ====== ====
  05/21/2015 02:54:01 IM Notify Up              0x50049e10 No     No
  05/21/2015 02:54:01 FSM state change          0x200      No     No
  05/21/2015 02:54:01 FSM state change          0x2030d    No     No
  05/21/2015 02:54:02 Double restart detected   0x5        No     No
  05/21/2015 02:55:00 I/f created/added         0x4000540  No     No
  05/21/2015 02:55:00 I/f created/added         0x4000580  No     No
  05/21/2015 02:55:00 I/f created/added         0x4000540  No     No
  05/21/2015 02:55:00 I/f created/added         0x4000580  No     No
  05/21/2015 02:55:00 Intf list change          0x3000300  No     No
  05/21/2015 02:55:00 Intf add error            0x4000540  No     No
  05/21/2015 02:55:00 Intf add error            0x4000580  No     No
  05/21/2015 02:55:00 FSM state change          0x30505    No     No
  05/21/2015 02:55:01 Replicate result          0x13fe     No     No
  05/21/2015 02:55:01 FSM state change          0x5060b    No     No
  05/21/2015 02:55:01 I/f up                    0x4000580  No     No
  05/21/2015 02:55:01 I/f up                    0x4000580  No     No
  05/21/2015 02:55:02 I/f up                    0x4000540  No     No
  05/21/2015 02:55:02 I/f up                    0x4000540  No     No
  05/21/2015 02:56:05 Added to peer             0x6060606  No     No
  05/21/2015 02:56:05 FSM state change          0x60704    No     No
  05/21/2015 02:56:05 Fill VIMI attr            0x20002    No     No
  05/21/2015 03:08:26 FSM state change          0x70605    No     No
  05/21/2015 03:09:54 FSM state change          0x60704    No     No
  05/21/2015 03:09:54 Fill VIMI attr            0x20002    No     No
  05/21/2015 03:10:45 FSM state change          0x70605    No     No
  05/21/2015 05:21:17 FSM state change          0x60704    No     No
  05/21/2015 05:21:17 Fill VIMI attr            0x20002    No     No

  PW-HE IDB client data
  ---------------------
  IDB handle 0x5016db2c
  Dot1q vlan: 0x81000000
  Label: 16001
  Remote VC label: 17
  Remote PE: 10.2.2.2
  Use flow-label on tx: N
  L2-overhead: 0
  VC-type: 5
  CW: N
  FSM state: 'Up'(7)
  Fwding is up: Y, got route update: Y
  Use OWNED_RESOURCE fwding: N
  OWNED_RESOURCE fwding is up: N
  OWNED_RESOURCE data&colon; 0
  Replication error msg has been printed: N
  VIF MA reg_handle: 50049e10
  PIC array:
    (nil)
  Replicate retry count: 0
  Configured i/f list name: 'BE20_ONLY'
  From L2VPN i/f list name: 'BE20_ONLY', i/f list id: 1
    L3 i/f:'Bundle-Ether20', idx=0, repl_status 1, fwding up:N, active:Y
    L3 i/f:'GigabitEthernet0/0/1/18', idx=1, repl_status 1, fwding up:Y, active:Y
    L3 i/f:'GigabitEthernet0/0/1/19', idx=2, repl_status 1, fwding up:Y, active:Y
  List intf: 0x5016e154, PLs size:4, num in use:2
    I/f:'Gi0/0/1/18', ifh:0x4000540, bundle: 0xb20, ifl idx:1, in-use:Y, misconfig:Y, in peer route:Y, VIMI active:Y
      Repl:Y pending:N failed:N not supp:N, unrepl pending:N failed:N, up:Y us:3
    I/f:'Gi0/0/1/19', ifh:0x4000580, bundle: 0xb20, ifl idx:2, in-use:Y, misconfig:Y, in peer route:Y, VIMI active:Y
      Repl:Y pending:N failed:N not supp:N, unrepl pending:N failed:N, up:Y us:3
    I/f:'', ifh:0x0, bundle: 0x0, ifl idx:0, in-use:N, misconfig:N, in peer route:N, VIMI active:N
      Repl:N pending:N failed:N not supp:N, unrepl pending:N failed:N, up:N us:0
    I/f:'', ifh:0x0, bundle: 0x0, ifl idx:0, in-use:N, misconfig:N, in peer route:N, VIMI active:N
      Repl:N pending:N failed:N not supp:N, unrepl pending:N failed:N, up:N us:0


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn pwhe summary
Thu May 21 05:35:59.381 UTC
Number of PW-HE interfaces: 1
  Up: 1  Down: 0  Admindown: 0
 PW-Ether: 1
  Up: 1  Down: 0  Admindown: 0
 PW-IW: 0
  Up: 0  Down: 0  Admindown: 0


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show l2vpn xconnect detail
Thu May 21 05:27:11.762 UTC

Group PWHE, XC ASR1K, state is up; Interworking none
  AC: PW-Ether20, state is up
    Type PW-Ether
    Interface-list: BE20_ONLY
    Replicate status:
    BE20: success
    Gi0/0/1/18: success
    Gi0/0/1/19: success
    MTU 1500; interworking none
    Internal label: 16001
    Statistics:
      packets: received 27293, sent 0
      bytes: received 1996176, sent 0
  PW: neighbor 10.2.2.2, PW ID 2020, state is up ( established )
    PW class asr1k, XC ID 0xc0000001
    Encapsulation MPLS, protocol LDP
    Source address 10.1.1.1
    PW type Ethernet, control word disabled, interworking none
    PW backup disable delay 0 sec
    Sequencing not set


RP/0/RSP0/CPU0:ACDC-ASR9000-1#show mpls label table label 16001 detail
Thu May 21 05:27:55.760 UTC
Table Label   Owner                        State  Rewrite
----- ------- ---------------------------- ------ -------
0     16001   L2VPN:Active                 InUse  Yes
  (PW-HE, vers:0, intf=PE20)



clear counters
show l2vpn xconnect detail | include packet
clear controllers np counters all
show controller np counters all


show subscriber session all summary
show subscriber manager disconnect-history unique summary
show subscriber manager statistics debug total
show subscriber manager statistics summary total
show subscriber manager trace event/error

debug l2vpn ea pwhe platform verbose
debug l2vpn forwarding platform common all
debug pm api location <location>
debug pm error location <location>
debug uidb api errors location <location>


show tech-support subscriber
show tech-support l2vpn

