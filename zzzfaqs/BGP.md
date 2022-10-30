# BGP

Border Gateway Protocol (BGP) is the Internet's postal service. When someone places a letter in a mailbox, the Postal Service processes it and determines the most efficient way to send it to its intended destination. When someone sends data over the Internet, BGP is in charge of analysing all of the possible paths for the data to take and selecting the best one, which frequently involves hopping between autonomous systems. BGP is the protocol that allows data to be routed across the Internet. For example, the border gateway protocol is the protocol that allows a user in Singapore to communicate swiftly and efficiently with origin servers in Argentina when they visit a website.

The protocol can link any autonomous system's internetwork together utilising any topology. The sole need is that each autonomous system should have at least one BGP-capable router that is connected to the BGP router of at least one other autonomous system. The primary purpose of BGP is to communicate network reachability information with other BGP systems. Based on the information transmitted between BGP routers, the Border Gateway Protocol creates an autonomous systems graph.

Following are the characteristics of the Border Gateway Protocol:
- Configuration of Inter-Autonomous Systems: The Border Gateway Protocol's primary function is to provide communication between two autonomous systems.
- Next-Hop Paradigm is supported by the Border Gateway Protocol.
- Within the autonomous system, there is coordination among several BGP speakers.
- Path Information: In addition to the reachable destination and next destination pair, BGP advertisements offer path information.
- In the routing-decision algorithm of BGP, numerous attributes are used.
- External neighbours between various autonomous systems are communicated via eBGP.
- Internal neighbours inside the same autonomous system use iBGP.
- It uses weight to alter the outward traffic routing from a single locally configured router.
- Policy Support: The Border Gateway Protocol can implement policies that the administrator can configure. A router running BGP, for example, can be set to discriminate between routes known within the autonomous system and routes known from outside the autonomous system.
- TCP (Transmission Control Protocol) is used in conjunction with Border Gateway Protocol.
- Border Gateway Protocol helps networks save bandwidth.
- Classless Inter-Domain Routing (CIDR) is supported by BGP.
- Security is also supported by BGP.

2. What port number is used by the border gateway protocol?
The Border Gateway Protocol uses the Transmission Control Protocol (TCP) port number 179.

3. Is it possible for routers on different subnets to become BGP neighbours?
BGP is frequently set up between two routers that are directly connected and belong to distinct autonomous systems. BGP routers don't require their neighbours to be on the same subnet. Instead, they employ a TCP connection between the routers to send and receive BGP messages, allowing neighbouring routers to be on the same or distinct subnets.

4. Is it possible to run two BGP processes on the same router?
No, you can't have two BGP processes running on the same router. This is because BGP is an Exterior Gateway Protocol.

5. What do you understand by Routing Information Protocol (RIP) in the context of networking?
The Routing Information Protocol (RIP) is a dynamic routing protocol that finds the optimum path between the source and destination networks by using hop count as a routing metric. It is a distance-vector routing protocol with an AD value of 120 that operates at the OSI application layer. The RIP protocol uses port 520. The number of routers between the source and destination networks is referred to as the hop count. The path with the fewest hops is deemed the best route to a network and is thus entered into the routing table. The number of hops allowed in a path between source and destination is limited by RIP, which eliminates routing loops. The maximum number of hops allowed by RIP is 15, and a hop count of 16 is considered unreachable by the network.

Following are the features of Routing Information Protocol (RIP):
Network updates are exchanged on a regular basis.
Routing information (updates) are always broadcast.
Routing tables in their entirety are sent in updates.
Routing information received from nearby routers is always trusted by routers. This is also known as rumour routing.

6. Differentiate between internal Border Gateway Protocol (iBGP) and external Border Gateway Protocol (eBGP).
- internal Border Gateway Protocol(iBGP): Inside autonomous systems, IBGP is used. Its purpose is to feed data to your internal routers. For prefix learning, all devices in the same autonomous system must form a full mesh topology or use either Route reflectors or Confederation.
- external Border Gateway Protocol (eBGP): It is employed between autonomous systems. It's used and deployed at the edge or border router, which connects two or more autonomous systems together. It is the protocol that allows networks from various organisations or the Internet to communicate with one another.

7. What do you understand about split horizon in the context of BGP? Explain with an example.
Split Horizon: The split horizon is a  method employed by distance vector protocols to prevent network routing loops. The underlying premise is straightforward: never send routing information back in the same direction it came from. It is necessary to have a split-horizon because distance vector protocols like Routing Information Protocol (RIP) are prone to routing loops, which occur when a data packet is caught in an unending loop and routed through the same routers over and over again. Split horizon is frequently used in protocols to avoid loops. Different strategies are used to prevent packet looping in other protocols, such as Open Shortest Path First. 

When split horizon is enabled, a router is prevented from advertising a route back to the router from whence it learnt it. To put it another way, if a router receives routing information from another router, the first router will not broadcast it back to the second router, preventing routing loops.

8. What do you understand about poison reverse in the context of BGP?
Poison Reverse: The Poison Reverse algorithm is a widely used distance-vector routing algorithm. To solve the count-to-infinity problem, poison reverse is used. To put it another way, poison reverse is the inverse of the split horizon. Route advertisements that would be muted by split horizon are instead advertised at a distance of infinity with poison reverse. Poison reverse is a RIP (Routing Information Protocol) technique. When path information becomes invalid, routers do not instantly remove it from the routing database; instead, they broadcast a hop-count of 16, which is an unreachable metric value. This increases the size of the routing table but aids in the elimination of loops. It can break any loop between neighbouring routers right away. The main notion of poison reverse is to ensure that a path does not return to the same node if the network's cost has changed.

9. What do you understand by peers in the context of BGP? What is the purpose of BGP peer groups?
BGP peers are two routers that have established a link for exchanging BGP information. Such BGP peers provide routing information via TCP-based BGP sessions, which are dependable, connection-oriented, and error-free protocols. 
The above image shows a BGP peering session between two BGP routers. We may utilise peer groups to simplify BGP configuration and reduce the amount of updates BGP has to produce. We can create a peer group with the neighbours and then apply all of our setups to it.

10. Is authentication possible with BGP? If yes, explain how.
Yes. MD5 authentication is supported by BGP. BGP allows neighbours to authenticate each other using MD5 and a shared password. It is set up with the following  command neighbour {ip-address | peer-group-name} password password in BGP router setup mode. When authentication is enabled, BGP verifies the source of each routing update and authenticates every TCP segment from its peer. Authentication is required by most ISPs for their EBGP peers.

Peering works only if both routers have the same password and are configured for authentication. When a router has a password configured for a neighbour but the neighbour router does not, the console displays a message like this when the routers try to create a BGP session.

11. In BGP, what is the order of preference?
The order of preference in BGP differs depending on whether the attributes are used for inbound or outbound updates.
The following is the order of preference for inbound updates:
Route-map
Filter-list
Prefix-list
distribute-list

The following is the order of preference for outgoing updates:
Filter-list
Route-map | unsuppress-map
Advertise-map (conditional-advertisement)
Prefix-list
distribute-list.

12. What are the different types of Timers present in BGP?
Following are the different types of Timers present in BGP :

Keep Alive Timer : This is the heartbeat timer, in which a local neighbour sends a BGP heart-beat packet to a remote neighbour at regular intervals to check reachability and availability. This interval is set to '30' seconds by default.

Hold down Timer : This is the amount of time that the local neighbour must wait before declaring the remote neighbour unavailable. This interval is set at "90" seconds by default, which is '3' times the Keep-Alive Interval. In other words, if a local neighbour misses three Keep-Alive packets in a row from a remote neighbour, the local neighbour considers the remote neighbour unavailable and changes the status of the neighbourship, as well as removing all associated routes advertised by the neighbour from the routing table/BGP table. Before and after the hold-down timer expires, the BGP neighbour status changes. The hold down timer is set to 90 seconds by default, and after that, the local neighbour moves through various stages like 'idle,' 'connect,' and 'active.' The status changes to 'Idle' at first, then to 'Connect' after 5 seconds, and then to 'Active' after 10 seconds.

Advertisement Interval : The BGP Advertisement Interval is a timer that determines how much time must pass between a route being advertised and being removed from a BGP peer. For eBGP peers, the default is 30 seconds, and for iBGP peers, it's 5 seconds. This can be modified on a per-neighbor basis.

13. Is it possible to utilise BGP (Border Gateway Protocol) instead of any IGP (Interior Gateway Protocol)?
No, we can't use BGP instead of any IGP because BGP connects different autonomous systems, whereas IGP works inside autonomous systems.

14. What are the various BGP Neighbor Adjacency States?
Before any routing information is transmitted, BGP establishes a neighbour adjacency with other routers, similar to OSPF (Open Shortest Path First) or EIGRP (Enhanced Interior Gateway routing Protocol). BGP, on the other hand, does not use broadcast or multicast for BGP neighbour discovery; instead, neighbours are manually configured and communicate over TCP/179.

Two BGP systems will go through a succession of BGP Neighbor Adjacency States before becoming neighbours. They are as follows:

Idle - The router initialises BGP resources. Attempts to establish a BGP incoming connection are rejected. The BGP protocol establishes a TCP connection with the peer.
Connect - BGP waits for the three way handshake to finish. The OPEN message is transmitted to the peer if it is successful, and BGP shifts to the OpenSent state. If we are unsuccessful, we will return to the Active state. If the ConnectRetry timeout expires, however, BGP will continue in this condition, with the timer reset and a new three way handshake launched.
Active - BGP returns to the Connect state after the ConnectRetry timeout is reset.
OpenSent - BGP waits for an OPEN message from its peer before sending it. BGP enters the OpenConfirm state after receiving a message.
OpenConfirm - BGP waits for a peer to send a keepalive message. BGP goes to the Established state if a response is received before the timeout ends. Otherwise, BGP switches to Idle mode.
Established - Both peers exchange UPDATE messages once the connection is established. If any of the UPDATE messages include an error, the BGP peer will send a NOTIFICATION message and enter the Idle state.

15. What are the different types of attributes present in BGP?
Following are the different types of attributes present in bgp:

Well-known mandatory: All BGP peers recognise it, it is forwarded to all peers, and it is present in all Update messages. The following are some of the well-known mandatory attributes :
Next-hop
Origin
AS PATH

Well-known discretionary: All routers recognise it, it's sent to all peers, and it's optionally included in the Update message. The following are some of the well-known discretionary attributes :
Local Preference
Atomic Aggregate

Optional transitive: It's possible that BGP routers will recognise it and transmit it on to BGP peers. When optional transitive qualities are not recognised, they are denoted as partial. The following are examples of optional transitive attributes:
Aggregator
Community

Optional non-transitive: BGP routers may recognise it, but it is not forwarded to peers. The following are some of the optional non-transitive attributes :
Multi-exit discriminator (MED)
Originator ID
Cluster-ID

16. Mention some of the well known BGP metric’s attributes.
BGP path selection is based on the values of the following attributes:

Weight
Local Preference (highest local value will be preferred, default value is 100)
Originate
AS path length
Origin code
Multi-Exit Discriminator (MED)
eBGP path over iBGP path
Shortest IGP path to BGP next hop
Oldest path
Router ID
Neighbor IP address.

17. What exactly do you mean by a route reflector in the context of Border Gateway Protocol? Why is it necessary?
In BGP, a route reflector is a router which is capable of breaking the internal Border Gateway Protocol (iBGP) loop avoidance rule. Under certain settings, a route reflector can broadcast updates received from an iBGP peer to another iBGP peer.

