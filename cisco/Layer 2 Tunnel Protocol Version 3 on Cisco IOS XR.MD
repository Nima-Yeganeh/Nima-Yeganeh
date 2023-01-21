# Layer 2 Tunnel Protocol Version 3 on Cisco IOS XR
# Simplifies deployment of VPNs—L2TPv3 is an industry-standard L2 tunneling protocol that ensures interoperability among vendors, increasing customer flexibility and service availability.
# Does not require MPLS—Service providers need not deploy MPLS in the core IP backbone to set up VPNs using L2TPv3 over the IP backbone; this will result in operational savings and increased revenue.
# Supports L2 tunneling over IP for any payload—L2TPv3 provides enhancements to L2TP to support L2 tunneling of any payload over an IP core network. L2TPv3 defines the base L2TP protocol as being separate from the L2 payload that is tunneled.

# Configuring an L2TP Class for L2TPv3-based L2VPN PE Routers: Example
# The following example shows how to configure a L2TP class with L2TPv3 based L2VPN for a PE router.
configure
  l2tp-class l2tptest
    receive-window 256
    retransmit retries 8
    retransmit initial retries 10
    retransmit initial timeout max 4
    retransmit initial timeout min 2
    timeout setup 90
    hostname PE1
    hello-interval 100
    digest secret cisco hash MD5
  end

# Configuring a Pseudowire Class: Example
# The following example shows a pseudowire class configuration on a PE router:
configure
 l2vpn
  pw-class FR1
   encapsulation l2tpv3
    protocol l2tpv3 class FR-l2tp
    tos value 100 reflect
    ttl 50
    ipv4 source 127.0.0.1
    cookie size 4
    sequencing both resync 150

# Configuring L2TPv3 Control Channel Parameters: Example
# The following example shows a typical L2TPv3 control-channel configuration:
configure
 l2tp-class FR-l2tp
  authentication
  hostname R2-PE1
  password 7 121A0C041104
  hello-interval 10
  digest secret 7 02050D480809

# Configuring the Cross-Connect Group: Example
# The following example shows how to group all cross -connects for FR1:
configure
 l2vpn
  xconnect group FR1
   p2p FR1
    interface Serial0/3/3/0/3/1:0.101
    neighbor 10.1.1.1 pw-id 2001
     pw-class FR1

# Configuring an Interface for Layer 2 Transport Mode: Example
# The following example shows how to configure an interface to operate in Layer 2 transport mode:
configure
 interface Serial0/3/3/0/3/1:0
  encapsulation frame-relay
  frame-relay lmi-type ansi
  exit
 interface Serial0/3/3/0/3/1:0.101 l2transport
  pvc 101

