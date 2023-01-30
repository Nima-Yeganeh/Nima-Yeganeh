BGP stands for Border Gateway Protocol and it is the main dynamic routing protocol used on the Internet. BGP is for large networks and is normally used for connecting different ISPs. Since BGP operates with large amounts of data (the current size of the table for IPv4 is more than 450 thousand routes), the principles of its configuration and operation are different from the internal dynamic routing protocols (IGP). BGP may be used for routing within an AS and classified as IGP protocol while the other protocols may be referred to as Exterior Border Gateway Protocol. BGP is considered as a path vector protocol & it routing metric is based on paths, network-policies sets by a network administrator.

Following are the default administrative distance for BGP routes:

External BGP route=20
EGP route=140
External EIGRP route=170
Internal BGP route=200

BGP is a protocol for ISPs and it is like a distance-vector protocol. Its hop count is an AS and that way it is also known as path vector protocol. Normally we use the BGP in a large ISP environment. You can establish a connection between different autonomous systems by BGP. BGP is a good option in transit autonomous systems, which means that you can allow your data packets to move through from one autonomous system to another autonomous system.

Default route: In this mode of configuration ISP only advertises the default route with BGP, and all other routes are accessible through this default route. This is the most efficient way of configuration when you have a small amount of memory.

Full updates: In this mode of configuration you will receive the full routing table from ISP. This mode required a lot amount of memory.

Partial updates: In the partial update configuration mode of BGP you will receive the routes for prefixes that are suitable to reach from your ISP router. For other routes, you will also have a default route.

BGP path selection depends on the values of the following attributes:
Weight(Cisco proprietary attributes )
Local Preference (highest local value will be preferred, default value is 100)
Originate
AS path length
Origin code
MED
eBGP path over iBGP path
Shortest IGP path to BGP next hop
Oldest path
Router ID
Neighbor IP address

What Are Different BGP Message Types?
Open: Open message is Used to create a neighbor relationship and exchange BGP=parameters, including AS number and authentication values.
Keep-alive: These keepalive messages are sent periodically to keep the neighbor relationship. If the Keep-alive messages are not received within a Hold timer then BGP neighbor-ship will be broken down.
Update messages: These messages are used to exchanges Path Attributes and the associated prefix /length that use those attributes.
Notification:  In BGP notifications are used to report BGP problems or errors. It results in a reset of the neighbor relationships.

IBGP works within the single AS and transfer BGP routes within a single autonomous system.

EBGP: BGP running between autonomous systems. By default, eBGP neighbors must be directly connected.

Name some BGP Timers?
Keepalive Interval: The time interval in seconds, between sending keep-alive messages. The default keepalive timer is 60
seconds.
Hold Time: Interval in seconds, after which the neighbor will be considered unavailable. The default is hold-down time is 180 seconds.

In BGP you are required to manually configure each neighbor in order to establish a neighborhood relationship.
There are type of neighbors in BGP:
An internal BGP neighbor (iBGP neighbor) is a neighbor that resides on the same AS as the local router. iBGP neighbors do not have to be directly connected.
An external BGP neighbor (eBGP neighbor) is a neighbor that is in an AS other than the local router. EBGP neighbors must be directly connected by-default.

The type of neighbor has little effect on the setting of neighborhood relations. More significant differences between the different types of neighbors appear in the process of sending BGP updates and adding routes to the routing table.
BGP performs these checks when it forms neighborhood relationships:
The router should receive a request for a TCP connection with the address of the sender, which the router
will find listed in the list of neighbors (the neighbor command).
The autonomous system number of the local router must match the autonomous system number, which is
indicated on the neighboring router by the command neighbor remote-as (this requirement is not observed when setting up confederations).
Router IDs must not be the same.
The neighbors must pass the authentication information if it is configured.

What are the different Neighbor the Adjacency States Of Bgp?
Idle: The BGP process is either administratively down or waiting for new neighbor adjacency.
Connect: During the BGP process, if the TCP connection is successful, it will continue to the Open=Sent state. In case it fails, it will continue to the Active state.
Active: BGP will try another TCP three-way handshake to create a connection to the remote BGP-neighbor. If it is successful, it will move to the Open-Sent state.
Open-sent: The TCP connection exists, and a BGP Open message has been sent to the peer, but the matching Open message has not yet been received from the other router.
Open-confirm: When an Open message has been received from a neighbor router, a BGP  Neighbor Adjacency is complete. A hold-down timer will start once this is done.
Established: All BGP neighbor parameters matched, the neighbor relationship has been established and the peers can now exchange Update messages.

Can routers on different subnets become BGP neighbors?
The answer is Yes. BGP routers become neighbors on different subnets. Instead, BGP use a TCP connection between the neighbor routers to pass BGP messages on the same or different subnet.

Which TCP port does BGP use?
Border Gateway Protocol uses TCP port number 179 for creating connections. (Most common BGP interview questions.)

What is eBGP multihop?
When eBGP peers or routers are not directly connected with each other. And there are one or more non-BGP peers to reach the BGP router. You are required to configure the eBGP multihop to enable the non-BGP routes to pass through the BGP neighbor relationship & exchange update messages.

What is BGP TLL Security?
BGP TTL Security is a Security technique and Mechanism, which is used to implemented/enhance the security of of the TCP connection between BGP peers. You can secure a BGP connection by disconnecting “faked TCP reset packets” from any other sources by using the BGP TTL Security.

What is BGP path selection criteria?
If no path selection policies are configured for BGP on the Cisco router. Then the router will go to each next step only if the values match the previous one.

The maximum weight value (local to the router).
The maximum value of local preference (for the whole AS).
Prefer the local route of the router (next hop = 0.0.0.0).
The shortest path through autonomous systems. (shortest AS_PATH)
The minimum value of the origin code (IGP<EGP<incomplete).
The minimum value of MED (distributed between autonomous systems).
The BGP path is better than the iBGP path.
Choose a path through the nearest IGP neighbor.
Select the oldest route for the BGP path.
The neighbor with the lowest BGP router ID.
In last the neighbor with the smallest IP address.

What is a transit AS?
With Transit AS you can transmit traffic of other autonomous systems.

What is split-horizon?
Split horizon is a rule that routing information will not be sent back to the router from which it is received. Mean routing information will not send back in a direction from which side he received. This is a very important concept and is used for preventing the routing loop in a network.

What is Loop prevention mechanisms in BGP?
There are two mechanisms to prevent loops in BGP:
When we are advertising to an eBGP router/peer, a BGP router adds its own A SN to the AS-PATH. If a
BGP router receives an update & route advertisement lists an AS-PATH with its own ASN,  then the router
ignores that route.
When a router learns routes from an iBGP peer, that router does not advertise the same routes to another
iBGP peer.

What are the well known communities of the BGP community attribute?
The community attribute is a transitive, optional attribute designed to group destinations in a certain community and apply certain policies (such as accept, prefer, or redistribute). This table shows the well-known BGP communities.
Local-AS: Use in confederation scenarios to prevent sending packets outside the local autonomous system (AS).
no-export: Do not advertise to external BGP (eBGP) peers. Keep this route within an AS.
no-advertise: Do not advertise this route to any peer, internal or external.
none: Apply no community attribute when you want to clear the communities associated with a route.
internet: Advertise this route to the internet community, and any router that belongs to it.

# https://www.cisco.com/c/en/us/support/docs/ip/border-gateway-protocol-bgp/5816-bgpfaq-5816.html

More info >>
# https://www.mytectra.com/interview-question/bgp-interview-questions-and-answers
# https://www.javatpoint.com/bgp-interview-questions
# http://networkerinterview.net/entries/bgp/border-gateway-protocol-ccnp
# https://mindmajix.com/bgp-interview-questions
# https://www.interviewbit.com/bgp-interview-questions/
