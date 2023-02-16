# interview notes
Traceroute
    How traceroute works in five steps
        Traceroute is actually a bit of a hack, in that it leverages a field in Internet Protocol (IP) packet headers that was never really intended for path or route tracing. The IP standard mandates a Time-to-Live (TTL) value for each IP packet, which acts as a kind of self-destruct mechanism to keep undeliverable packets from endlessly circulating around the Internet. Each router in a path is expected to decrement the TTL value by one before sending it further down the line. Once the TTL hits zero, the routing process comes to a screeching halt, and the last router to have processed the packet will send back a “Time to live exceeded” message. 
        Exceeding a TTL value isn’t desirable for normal data packets, which is why a typical packet will have a value ranging from 64 all the way to 255. But what would otherwise be a frustrating error message is actually a key part of how traceroute works. By manipulating the TTL field, traceroute and similar programs can trigger TTL exceeded messages from each hop along a given path. Here’s how it works:
        The user invokes the traceroute (or tracert) command and specifies a target host. If the host is specified in the form of a domain name, traceroute will attempt to resolve it. 
            Traceroute sends a data packet towards the target with the TTL value set to “1”. The first router in the path will decrement the value by 1, which should trigger a TTL exceeded message that gets sent back to the host on which the traceroute program is running.
            With details of the first hop in hand, traceroute will increase the TTL value to “2”. That first router in the path will still decrement the value by 1, but because the TTL will no longer drop to zero right out of the gate the packet can live on for one more hop. Once the TTL value does hit zero (in this case, at the second router in the path), another TTL exceeded message should be generated and passed back to traceroute.
            The process repeats itself, with traceroute increasing the TTL by 1 each time, until the destination is reached or an upper limit of hops is hit. By default, the upper limit is 30 hops, but a different value can be specified when the command is run.
            When finished, traceroute prints all the hops in the path, along with the amount of time it took to each hop and back (this is known as the Round Trip Time). 
        By default, traceroute will send three packets to each hop in the path. The exact type of packet varies between implementations, and can also be changed with different flags, but this same basic methodology is used in all cases. 
BGP TTL
    What is TTL value for Ibgp and Ebgp?
        iBGP uses TTL=255. eBGP uses TTL=1 and sometimes ebgp-multihop is needed.
OSPF LSA Types
    6 Types of OSPF LSA
        Type1 is a Router LSA.
        Type2 is a Network LSA.
        Type3 is a Network summary LSA.
        Type4 is the ASBR summary.
        Type5 is an external summary.
        Type7 is therefore written to the OSPF standard.
ASBR vs ABR
IBGP vs EBGP
HSRB vs VRRP vs GLBP
LACP vs MLAG vs VPC
    What is MLAG and LACP?
        The main purpose of MLAG is to deliver system-level redundancy in the event one of the chassis fails. LACP (Link Aggregation Control Protocol), a subcomponent of IEEE 802.3ad standard, provides a method to control the bundling of several physical ports together to form a single logical channel.
    What is the difference between vPC and MLAG?
        MLAG is a public protocol that is supported by almost every vendor using their own custom rolled implementation, while vPC is a Cisco Nexus specific protocol, not all the vendors have this technology. Thus, MLAG setup is a bit easier than vPC.
EBGP Multihop
MPLS and LDP
MPLS TE
Segment Routing
EVPN and VXLAN
SSO and NSF
ISSU
Commit and Rollback
IOS-XR Upgrade and Admin
ISIS vs OSPF
OSPF and ISIS >> Administrative Distance
EBGP and IBGP >> AD Change
BGP Advertise >> Attributes
BFD
SRv6
IOS XR Upgrade Procedure
    install boot-options
    clear boot-options
    show boot-options
IOS XR Upgrade Procedure (NEW)
    install activate
    install add
    install deactivate
    install rollback
MPLS Explicit Null
    With explicit NULL, the penultimate router swaps an MPLS label with a NULL label, and sends a labeled packet to the egress router. The egress router performs an MPLS label lookup and finds a NULL label which triggers another lookup in IP routing table.
NSR and NSF
    Non Stop Forwarding (NSF) and Non Stop Routing (NSR) are two different mechanisms to prevent routing protocol re-convergence during a processor switchover.
HSRP or VRRP Election
    HSRP active/standby router election process uses priority value (0-255) that is manually configured on the router (255 is the highest). By default , the priority is 100 . If all the routers are set to default value then the router with highest IP address on the HSRP interface becomes the active router.
BFD vs UDLD
IOS XR vs IOS vs IOS XE (Structure or Kernel Diff)
