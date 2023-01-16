# Cisco ASR 9000 Series Aggregation Services Routers
# Broadband Network Gateway Command Reference for Cisco ASR 9000 Series Routers

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv4 l2-connected
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv4-l2conn)# initiator dhcp

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv6 l2-connected
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv6-l2conn)# initiator dhcp

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface gigabitEthernet 0/0/0/0
RP/0/RSP0/CPU0:router(config-if)# ipv4 address 192.0.2.1 255.255.255.0
RP/0/RSP0/CPU0:router(config-if)# proxy-arp
RP/0/RSP0/CPU0:router(config-if)# service-policy type control subscriber policy-map-IPSUBV6
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv6 routed
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv6-routed)# initiator dhcp-snoop
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv6-routed)# commit

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether101.201
RP/0/RSP0/CPU0:router(config-subif)# ipsubscriber ipv4 routed
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv4-routed)# initiator unclassified-ip

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether101.201
RP/0/RSP0/CPU0:router(config-subif)# ipsubscriber ipv6 routed
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv6-routed)# initiator unclassified-ip prefix-len 56

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv4 l2-connected
RP/0/RSP0/CPU0:router(config-if-ipsub-ipv4-l2conn)# initiator unclassified-source

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface bundle-ether 1.1
RP/0/RSP0/CPU0:router(config-subif)# ipsubscriber interface

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv4 l2-connected initiator dhcp

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv6 l2-connected initiator dhcp

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber ipv4 l2-connected initiator unclassified-source address-unique

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether101.201
RP/0/RSP0/CPU0:router(config-subif)# ipsubscriber ipv4 routed initiator dhcp

RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether101.201
RP/0/RSP0/CPU0:router(config-subif)# ipsubscriber ipv6 routed
RP/0/RSP0/CPU0:router(config-subif)# initiator unclassified-ip prefix-len 56


RP/0/RSP0/CPU0:router# configure
RP/0/RSP0/CPU0:router(config)# interface Bundle-Ether 56
RP/0/RSP0/CPU0:router(config-if)# ipsubscriber session-limit
RP/0/RSP0/CPU0:router(config-ipsub-sess-limit)# total per-vlan 25
RP/0/RSP0/CPU0:router(config-ipsub-sess-limit)# unclassified-source per-vlan 452

RP/0/RSP0/CPU0:router#configure
RP/0/RSP0/CPU0:router(config)#interface bundle-ether 1.1
RP/0/RSP0/CPU0:router(config-subif)#ipsubscriber subscriber-templates 7


RP/0/RSP0/CPU0:router# show ipsubscriber access-interface

Interface: GigabitEthernet0/0/0/0 (ifhandle 0x20000040)
  State: UP
  Type: Plain
  Created Jan 18 00:01:32 (age 00:58:28)
  Initiator DHCP enabled
    Session count 0
    FSOL packets 0, bytes 0
    FSOL dropped packets 0, bytes 0
  Initiator Packet-Trigger enabled
    Session count 0
    FSOL packets 0, bytes 0
    FSOL dropped packets 0, bytes 0
  Initiator DHCPv6 disabled
    Session count 0
    FSOL packets 0, bytes 0
    FSOL dropped packets 0, bytes 0
  Initiator Packet-Trigger-IPv6 enabled
    Session count 0
    FSOL packets 0, bytes 0
    FSOL dropped packets 0, bytes 0


RP/0/RSP0/CPU0:router# show ipsubscriber access-interface brief

Codes: UP - Up, DOWN - Down, DELETED - Deleted State, UNKNOWN - Unknown State,
       PKT - Packet Trigger Initiation, DHCP - DHCP Initiation
       PKTv6 - Packet Trigger Initiation for IPv6, DHCPv6 - DHCPv6 Initiation

Interface              Proto                 DHCP        Pkt Trigger DHCPv6      PktTrigIPv6 State
---------------------- --------------------- ----------- ----------- ----------- ----------- ---------
Gi0/0/0/0              DHCP,PKT,DHCPv6,PKTv6           0           2           0           0        UP
BE1.1                  DHCP,PKT                        0           0           0           0        UP

RP/0/RSP0/CPU0:router# show ipsubscriber access-interface
Interface: Bundle-Ether1.10
  State: UP
  Type: Plain
  Interface Type: Static
  Created Apr  8 09:56:57 (age 00:08:08)
  Initiator DHCP disabled
    Session count 0
    FSOL packets 0
    FSOL dropped packets 0
    FSOL flow rate dropped packets 0
    FSOL session limit dropped packets 0
  Initiator Packet-Trigger enabled
    Session count 1



RP/0/RSP0/CPU0:router# show ipsubscriber interface

Interface: GigabitEthernet0/1/0/0.11.ip1
      Type: L2-connected
      Ifhandle: 0x201000c0
      Access Interface: GigabitEthernet0/1/0/0.11 (0x20100080)
      Subscriber MAC: 0100.0000.0000    
      Subscriber IP: 11.10.10.9         <------- this line will not be shown if empty
      Subscriber IPv6 Prefix: FE80::10  <------- this line will not be shown if empty
      Subscriber Label: 0x8000000
      IPv4: Initiator: Packet-Trigger   <-- this line will not be shown if not enabled
      IPv6: Initiator: DHCPv6           <-- this line will not be shown if not enabled
      Created: May 11 16:33:08 (age 00:03:08)
      VRF: vpn1 (0x60000002), IPv4 Table: default (0xe0000002), IPv6 Table: default (0xe0000002)
      IPv4: State: Up(9) (old: Adjacency added(8))
            Last state change: May 11 16:33:08 (00:03:08 in current state)
      IPv6: State: Up(9) (old: Adjacency added(8))
            Last state change: May 11 16:33:08 (00:03:08 in current state)

RP/0/RSP0/CPU0:router# show ipsubscriber interface brief

Codes: INV - Invalid, INIT - Initialized, STRTD - Session Creation Started,
       CPEXCTG - Control-Policy Executing, CPEXCTD - Control-Policy Executed,
       FTAPPLD - Session Features Applied, VRFCFGD - VRF Configured,
       ADJADDG - Adding Adjacency, ADJADDD - Adjacency Added, UP - Up,
       DOWN - Down, DISCG - Disconnecting, DISCD - Disconnected, ERR - Error,
       UNKWN - Unknown State, PKT - Packet Trigger Initiation,
       PKTv6 - Packet Trigger Initiation for IPv6,
       DHCP - DHCP Initiation, DHCPv6 - DHCPv6 Initiation

Interface              Proto Subscriber IP      MAC Address        Sublabel   VRF        State
---------------------- ------ ------------------ ------------------ ---------- ---------- ----------
Gi0/0/0/0.ip1          DHCP   1.10.10.9          0100.0000.0000     0x40       default    UP
                       DHCPv6                    0100.0000.0000     0x40       default    UP
Gi0/0/0/0.ip2          PKT    2.20.20.9          0200.0000.0000     0x20       default    UP
                       PKTv6                     0200.0000.0000     0x20       default    UP
Gi0/0/0/0.ip3          DHCPv6 5.40.20.9          0200.2200.0000     0x21       default    UP
Gi0/0/0/0.ip4          PKTv6  7.91.20.9          0200.2210.0000     0x31       default    UP


RP/0/RSP0/CPU0:router# show ipsubscriber interface outer-vlan-id 200 inner-vlan-id 100

Interface: Bundle-Ether1.200.ip1
  Type: L2-connected
  Access Interface: Bundle-Ether1.200
  Subscriber MAC: 0000.0000.0014
  Subscriber IPv4: 1.10.9.246
  Subscriber Label: 0x4f
  IPv4 Initiator: Packet-Trigger
  VLAN ID: outer 200 inner 100
  Created: Dec 22 00:32:28 (age 00:00:43)
  VRF: default, IPv4 Table: default
  IPv4 State: Up (old: Adjacency added)
       Last state change: Apr 9 00:32:28 (00:00:43 in current state)


RP/0/RSP0/CPU0:router# show ipsubscriber interface dynamic-routes
Interface              Dynamic-Routes
---------------------- ------------------------------------------------------------
BE1.1.ip3              45.1.32.0/24 (vrf vpn1) nhop 12.1.0.32 (vrf vpn1) distance 3 tag 34 (added)
BE1.1.ip4              45.1.33.0/24 (vrf vpn1) nhop 12.1.0.33 (vrf vpn1) distance 14 tag 340 (added)


RP/0/RSP0/CPU0:router# show ipsubscriber interface internal
Tue Nov  4 12:52:33.016 EDT
Interface: Bundle-Ether601.603.ip8
Type: L2-connected
Access Interface: Bundle-Ether601.603
Ifhandle: 0x9e0
Access Ifhandle: 0x560
Subscriber MAC: 0000.6611.0103
Subscriber IPv4: 15.15.0.4
Subscriber Label: 0xc3
IPv4 Initiator: DHCP
VLAN ID: 603
Created: Nov  2 13:42:34 (age 1d23h)
VRF: default (0x60000000), IPv4 Table: default (0xe0000000)
IPv4 State: Up (old: Adjacency added)
Last state change: Nov  2 13:42:35 (1d23h in current state)
Flags: 0x80030811 (V4_ROUTE_ADDED AFI_IPV4 ACTIVTED )
Flags2: 0x4 (V4_INIT_DONE )
AAA Transaction Id: 8589934603
Interface Number: 8
Wavl Tree Pointer: 0x10827c58
Template ID      : 0x6e0    
[IPv4 Event History]
Nov  2 13:42:34.368 FSOL Received
Nov  2 13:42:34.368 Session Created
Nov  2 13:42:34.880 IM Intf Created
Nov  2 13:42:35.008 VRF Received
Nov  2 13:42:35.008 VRF Conf Received
Nov  2 13:42:35.008 Feature-Conf Activated
Nov  2 13:42:35.520 EA-DPC Success
Nov  2 13:42:35.520 Subscriber Route Added
Nov  2 13:42:35.520 All RIB Route Added


RP/0/RSP0/CPU0:router# show ipsubscriber summary
IPSUB Summary for all nodes



RP/0/RSP0/CPU0:router# show ipsubscriber template-interface

Tue Nov  4 12:52:56.924 EDT

Template Subscriber Name                 Template Subscriber Ifhandle
------------------------------------------------------------------------------------
Bundle-Ether601.603.tmpl1                0x6e0
Bundle-Ether601.603.tmpl2                0x720
Bundle-Ether601.603.tmpl3                0x760
Bundle-Ether601.603.tmpl4                0x7a0
Bundle-Ether601.603.tmpl5                0x7e0
Bundle-Ether601.604.tmpl1                0x820
Bundle-Ether601.604.tmpl2                0x860
Bundle-Ether601.604.tmpl3                0x8a0
Bundle-Ether601.604.tmpl4                0x8e0
Bundle-Ether601.604.tmpl5                0x920



