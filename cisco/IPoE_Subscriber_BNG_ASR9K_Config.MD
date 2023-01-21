# IPoE
# ASR9K

# This is where we define subscriber address pools for IPv4, IPv6 (NA) and IPv6 (PD). These are the pools from which CPE will get the IPs. IPAM assigns addresses dynamically by splitting address pools into smaller chunks. And then associating each chunk with a user-plane. The pools get freed up dynamically and re-allocated to different user-planes on need basis.
ipam
 instance 1
  source local
  address-pool pool-ISP1
   vrf-name default
   ipv4
    split-size
     per-cache 65536
     per-dp    65536
    exit
    address-range 110.0.0.1 110.10.255.255
   exit
   ipv6
    address-ranges
     split-size
      per-cache 65536
      per-dp    65536
     exit
     address-range f:2::1 f:2::10:ffff
    exit
    prefix-ranges
     split-size
      per-cache 65536
      per-dp    65536
     exit
     prefix-range 2001:db1:: length 48
    exit
   exit
  exit
 exit
exit

# Profile DHCP
# At present cnBNG only supports DHCP server option. That means cnBNG CP acts as a DHCP server to assign IPs to CPE/subscribers. In profile DHCP we define the DHCP server and which IPAM pool to use by default for subscriber. We can use different pools for IPv4, IPv6 (IANA) and IPv6 (IAPD).
profile dhcp dhcp-server1
 ipv4
  mode server
  server
   pool-name   pool-ISP1
   dns-servers [ 8.8.8.8 ]
   lease days 1
  exit
 exit
 ipv6
  mode server
  server
   iana-pool-name pool-ISP1
   iapd-pool-name pool-ISP1
   lease days 1
  exit
 exit
exit

# Profile AAA
# This profile defines the AAA parameters, like which Radius group to be used authorization and accounting. Also what username value to be used. Here we also define other attrbutes and formats. In this example we will be using MAC based authorization
profile aaa aaa_mac
 authorization
  type subscriber method-order [ local ]
!! In this example we are using client-mac-address for auth
  username identifier client-mac-address
  password cisco
 exit
 accounting
  method-order [ local ]
 exit
exit

# Profile Radius
# Under this profile, Radius groups are created.
profile server-group local
 radius-group local
exit

profile radius
 algorithm round-robin
 deadtime  3
 detect-dead-server response-timeout 60
 max-retry 2
 timeout   5
!! Use your radius IP and port for auth here. Here we use 10.0.100.4 as Radius IP with 1812 auth port and 1813 acct port
 server 10.0.100.4 1812
  type   auth
  secret cisco
 exit
 server 10.0.100.4  1813
  type   acct
  secret cisco
 exit
 attribute
  nas-identifier CISCO-cnBNG
!! This should be CP UDP Proxy IP
  nas-ip         10.0.100.1
 exit
 server-group local
  server auth 10.0.100.4 1812
  exit
  server acct 10.0.100.4 1813
  exit
 exit
exit
!! We can also set COA client, use client IP as per the setup
profile coa
 client 10.0.100.4
  server-key cisco
 exit
exit

# Profile Feature-template
# This profile defines subscriber feature template. This is the template which will be applied to dynamic subscriber interface. We also enable service/ session accounting here.
profile feature-template ipoe-1
 vrf-name default
 ipv4
  mtu 1500
 exit
 session-accounting
  enable
  aaa-profile       aaa_mac
  periodic-interval 1800
 exit
exit

# We can also define service profiles using feature-template, which gets applied on per subscriber session. The service profile in case of radius can be applied during authorization using service activate attribute or it can also be applied using CoA.
profile feature-template FT_Plan_100mbps
 qos
  in-policy  PM_Plan_100mbps_input
  out-policy PM_Plan_100mbps_output
 exit
exit

# Profile Subscriber
# This profile can be attached on per access port level or per user-plane level. This profile for IPoE defines which dhcp server profile to applu, along with feature-template and profile for aaa auth.
profile subscriber subscriber-profile_ipoe-1
 dhcp-profile               dhcp-server1
 session-type               ipv4v6
 activate-feature-templates [ ipoe-1 ]
 aaa authorize aaa_mac
exit

# User-plane
# This construct define the association configs. Peering IP as well as subscriber profile to be attached to user-plane or at port level.
user-plane ASR9k-1
!! This should be UP IP to which to peer
 peer-address ipv4 10.0.100.2
 subscriber-profile subscriber-profile_ipoe-1
exit

# Loopback Creation
# We need to create a Loopback for cnBNG use.
interface Loopback1
 ipv6 enable

# Association Configuration
# This is where we define association settings between cnBNG CP and UP. The auto-loopback with “secondary-address-upadte enable” will allow dynamic IP address allocations using IPAM.
cnbng-nal location 0/RP0/CPU0
 hostidentifier ASR9k-1
 !! up-server ip should be the ip of UP interface which will be used as source for SCi communication
 up-server ipv4 10.0.100.2 vrf default
 !! cp-server ip is the IP of UDP Proxy configuration, in AIO this is the IP of the VM
 cp-server primary ipv4 10.0.100.1
 auto-loopback vrf default
  interface Loopback1
   !! Any dummy IP
   primary-address 1.1.1.1
  !
 !
 !! retry-count specifies how many times UP should retry the connection with CP before declaring CP as dead
 cp-association retry-count 10
 secondary-address-update enable
!
# DHCP Configuration
# This is where we associate access interfaces with cnBNG DHCP profile. cnBNG specific DHCP profile makes sure DHCP packets are punted to cnBNG CP through CPRi/GTP-u tunnel.
dhcp ipv4
 profile cnbng_v4 cnbng
 !
 interface Bundle-Ether1.101 cnbng profile cnbng_v4

dhcp ipv6
 profile cnbng_v6 cnbng
 !
 interface Bundle-Ether1.101 cnbng profile cnbng_v6

# Access Interface Configuration
# We define and associate access interface to cnBNG. This way control packets (based on configurations) get routed to the cnBNG CP. The contruct follows ASR9k Integarted BNG model, if you are familiar with.
interface Bundle-Ether1.101
 ipv4 point-to-point
 ipv4 unnumbered Loopback1
 ipv6 address 2001::1/64
 ipv6 enable
 load-interval 30
 encapsulation dot1q 101
 ipsubscriber
  ipv4 l2-connected
   initiator dhcp
  !
  ipv6 l2-connected
   initiator dhcp
  !
 !
!

# CPE Configs
# Following is CSR1000v config which is used as CPE in this example.

interface Bundle-Ether1.101
 encapsulation dot1Q 101
 ip address dhcp
 ipv6 address dhcp rapid-commit
 ipv6 address autoconfig
 ipv6 dhcp client pd prefix-from-isp

# Radius Profile
# Following is Freeradius profile used
0050.5688.61ae Cleartext-Password := "cisco"
   Cisco-AVpair += "subscriber:sa=FT_Plan_100mbps",
   Cisco-AVpair += "subscriber:inacl=iACL_BNG_IPv4",
   Cisco-AVpair += "subscriber:ipv6_inacl=iACL_BNG_IPv6"

# Verifications
# Verfiy that the cnBNG CP-UP association is up and Active on cnBNG CP ops-center

[pod100/bng] bng# show peers
GR                                                                                        CONNECTED                                                         INTERFACE  
INSTANCE  ENDPOINT      LOCAL ADDRESS    PEER ADDRESS     DIRECTION  POD INSTANCE   TYPE  TIME       RPC     ADDITIONAL DETAILS                             NAME       
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
0         RadiusServer  -                10.0.100.4:1812  Outbound   radius-ep-0    Udp   3 days     Radius  Status: Active,Type: Auth                           
0         RadiusServer  -                10.0.100.4:1813  Outbound   radius-ep-0    Udp   3 days     Radius  Status: Active,Type: Acct                           
1         n4            10.0.100.1:8805  10.0.100.2:8805  Inbound    bng-nodemgr-0  Udp   3 days     UPF     Name: pod100-cnbng-up1,Nm: 0/0,Status: ACTIVE  


# Verify that the CP-UP Association is Up and Active on cnBNG UP

RP/0/RP0/CPU0:pod100-cnbng-up1#show cnbng-nal cp connection status location 0/0/CPU0 
Wed Dec  1 13:59:35.533 UTC

Location: 0/0/CPU0

User-Plane configurations:
-------------------------
 IP             : 10.0.100.2        
 GTP Port       : 2152
 PFCP Port      : 8805
 VRF            : default

Control-Plane configurations:
----------------------------
 PRIMARY IP     : 10.0.100.1        
 GTP Port       : 2152
 PFCP Port      : 8805 
 
 Association retry count: 10

 Connection Status: Up
 Connection Status time stamp:  Wed Dec  1 13:59:29 2021

 Connection Prev Status: Down
 Connection Prev Status time stamp:  Wed Dec  1 13:59:28 2021

 Association status: Active
 Association status time stamp: Wed Dec  1 13:59:28 2021

# Verify subscriber session is up on cnBNG CP ops-center
[pod100/bng] bng# show subscriber session 
subscriber-details 
{
  "subResponses": [
    {
      "records": [
        {
          "cdl-keys": [
            "16777220@sm",
            "acct-sess-id:pod3_DC_16777220@sm",
            "upf:pod100-cnbng-up1",
            "port-id:pod100-cnbng-up1/Bundle-Ether1.101",
            "feat-template:ipoe-1",
            "type:sessmgr",
            "mac:0050.5688.61ae",
            "sesstype:ipoe",
            "up-subs-id:pod100-cnbng-up1/1073741888",
            "smupstate:smUpSessionCreated",
            "smstate:established",
            "afi:dual"
          ]
        }
      ]
    }
  ]
}

# Verify that the subscriber session is up and working on cnBNG UP
RP/0/RP0/CPU0:pod100-cnbng-up1#show cnbng-nal subscriber all  location 0/0/CPU0                         
Mon Dec  6 05:02:13.744 UTC

Location: 0/0/CPU0
Codes: CN - Connecting, CD - Connected, AC - Activated,
       ID - Idle, DN - Disconnecting, IN - Initializing


CPID(hex)  Interface               State  Mac Address     Subscriber IP Addr / Prefix (Vrf) Ifhandle
---------------------------------------------------------------------------------------------------
1000014    BE1.101.ip1073741856 AC     0050.5688.61ae  110.1.0.21 (default) 0x1000030 
                                                          f:2::1:6 (IANA)
                                                          2001:db1:0:7::/64 (IAPD)
Session-count: 1

RP/0/RP0/CPU0:pod100-cnbng-up1#ping 110.1.0.21 source 110.1.0.1
Mon Dec  6 05:02:48.908 UTC
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 110.1.0.21, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 1/4/12 ms
RP/0/RP0/CPU0:pod100-cnbng-up1#ping f:2::1:6 source BE1.101.ip1073741856
Mon Dec  6 05:03:00.757 UTC
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to f:2::1:6, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 2/4/13 ms
RP/0/RP0/CPU0:pod100-cnbng-up1#

# Notice that the subscriber subnet route is programmed in RIB along with subscriber route

RP/0/RP0/CPU0:pod100-cnbng-up1#show route subscriber 
Mon Dec  6 05:01:51.410 UTC

A    110.1.0.0/16 [1/0] via 0.0.0.0, 3d12h  << Subnet programming is done from cnBNG CP based on IPAM pool allocation
A    110.1.0.21/32 is directly connected, 3d12h, Bundle-Ether1.101.ip107374185

RP/0/RP0/CPU0:pod100-cnbng-up1#show route ipv6 subscriber 
Mon Dec  6 05:01:31.667 UTC

A    f:2::1:0/112      << Subnet programming is done from cnBNG CP based on IPAM pool allocation
      [1/0] via ::, 3d12h
A    f:2::1:6/128 is directly connected,
      3d12h, Bundle-Ether1.101.ip1073741856
A    2001:db1::/48		<< Subnet programming is done from cnBNG CP based on IPAM pool allocation
      [1/0] via ::, 3d12h
A    2001:db1:0:7::/64
      [2/0] 3d12h, Bundle-Ether1.101.ip1073741856

# Notice that the QoS poilicy and ACLs are applied to subscriber interface

RP/0/RP0/CPU0:pod100-cnbng-up1#show subscriber running-config interface name BE1.101.ip1073741856
Mon Dec  6 04:59:58.094 UTC
Building configuration...
!! IOS XR Configuration 7.5.1.01I
subscriber-label 0x40000020
dynamic-template
 type user-profile U00000020
  ipv4 access-group iACL_BNG_IPv4 ingress
  ipv6 enable
  ipv4 mtu 1500
  ipv4 unnumbered Loopback1
 !
 type service-profile FT_Plan_100mbps
  service-policy input PM_Plan_100mbps_input
  service-policy output PM_Plan_100mbps_output
 !
!
end

# The policy and ACL definitions exist on cnBNG UP

RP/0/RP0/CPU0:pod100-cnbng-up1#show running-config policy-map 
Mon Dec  6 05:03:49.479 UTC
policy-map PM_Plan_100mbps_input
 class class-default
  police rate 100 mbps 
   exceed-action drop
  ! 
 ! 
 end-policy-map
! 
policy-map PM_Plan_100mbps_output
 class class-default
  police rate 100 mbps 
   exceed-action drop
  ! 
 ! 
 end-policy-map
! 
RP/0/RP0/CPU0:pod100-cnbng-up1#show running-config ipv4 access-list 
Mon Dec  6 05:04:22.184 UTC
ipv4 access-list iACL_BNG_IPv4
 10 deny tcp any any eq bgp
 20 deny tcp any any eq ldp
 30 deny udp any any eq ldp
 40 permit ipv4 any any
!

RP/0/RP0/CPU0:pod100-cnbng-up1#show running-config ipv6 access-list 
Mon Dec  6 05:04:26.554 UTC
ipv6 access-list iACL_BNG_IPv6
 10 deny tcp any any eq bgp
 20 deny tcp any any eq 646
 30 deny udp any any eq 646
 40 permit ipv6 any any
!

