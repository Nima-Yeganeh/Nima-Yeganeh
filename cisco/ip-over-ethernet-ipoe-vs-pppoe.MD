# ip-over-ethernet
# ipoe-vs-pppoe

As you know PPPoE (PPP Over Ethernet) is the dominant session control protocol used in broadband wired networks. PPPoE encapsulates PPP frames inside Ethernet frames. In other words, it combines authentication/ encryption part of PPP with Ethernet that support multiple users. PPPoE has been used in many networks that works as dial-up connection and DSL. This Connection Oriented protocol, PPPoE, was also the only allowed transport protocol by DSL forum. PPPoE has some limitations and to overcome these limitations, a new protocol has developed. This new protocol is IPoE (Internet Protocol over Ethernet). With IPoE, IP packets are encapsulated in Ethernet Frames. IPoE is a Connectionless protocol and uses DHCP (Dynamic Host Configuration Protocol) to provide this enhancement. Here, beside DHCP, some additional authentication methods are also used. DHCP is also used as another name of IP Over Ethernet in different resoruces.

As a summary there are two protocols used for Broadband connection. The first one is PPPoE and the second one is Internet Protocol Over Ethernet. IPoE is being used as an alternative to PPPoE especially in Cable networks. In DSL and Dialup access, PPPoE is more common.  In this lesson, we will focus IP Over Ethernet.

PPP is a protocol used as point to point, as its name implies. And PPPoE allows multi logical PPP links. For multicast delivery, PPP is not suitable. Here, IPoE rises and helps us to deliver multicast traffic better. IPoE does this, with the help of DHCP and EAP.

IP Over Ethernet relies on DHCP to be used instead of PPPoE. As we have discussed above, for broadband connections there are some requirements like link establishment, authentication, monitoring etc. Here, some of the DHCP Extensions are used with some other protocols like EAP (Extensible Authenticaiton Protocol) and provide a similar capability to IPoE like PPPoE.

There are some common steps that all Broadband connections require. In other words, there are some requirements for Internet access of a user in broadband networks. So, what are these requirements? Let ‘s check these steps:
- Authentication
- IP Address Assignment
- Authorization
- Monitoring

After connection establishment, the first step is User Authentication. User must validate himself with username and password.

Second step is the IP Address Assignment step. In this step a unique ip address is given to the user.

After ip address assignment, User Authorization must be done. Each user needs different services and capabilities on the system. This step checks the assigned authorization from the users.

The last step is Monitoring the user to know that the user is still on the system.

# IP Over Ethernet Session Establishment
IPoE is a Connectionless method. So, there is no session establishment between end points in Internet Protocol Over Ethernet. And there is no subscriber indentifier. Instead, subscriber ip addresses are used to identify them.

# IPoE Subscriber Authentication
There is no subscriber login mechanism in IP Over Ethernet. Instead, the subscriber’s physical connection shows the available services. This can show subscriber VLAN, connected Ports etc.

IPoE support always on mechanism. This means that, for today’s world users are always on, so there is no need to identify the user always. It is true for today’s network but this type of approach has some drawbacks.

The first one is about switching between services. Switching between different services is difficult in this type of approach.

The other disadvantage is, internet usage in everywhere. Today, users use internet everywhere. So, there is no single location for users.

# IPoE Address Assignment
Address assignment of IP Over Ethernet requires classical DHCP operations, DORA (Discovery, Offer, Request, Acknowledgement). Here, the procedure is like below:
- A user sends a DHCP discovery message as broadcast.
- DHCP Servers replies with Offer message that includes an offered IP address as broadcast.
- The user sends a broadcast DHCP Request message and accept one of them.
- And the accepted DHCP confirms the address assignment.

This basic procedure can change if the DHCP Server is in another network. In this type of topology, a DHCP Proxy Agent must be used. Here, the DHCP Proxy Agent communicates with the real DHCP server and transmits these messages to the user. It is like a gateway between real DHCP Server and the user.

As  you can see above, if DHCP Relay Agent is used, then DHCP messaging will be changed. Here, Resident Gateway sends a DHCP Discover Message as broadcast. This broadcast Discover Message is received by Relay Agent BSR and it is sent to DHCP Server directly. DHCP Server replies with DHCP Offer including an IP offer to BSR and BSR sent this offer as broadcast. Resident Gateway sends DHCP Request to BSR this time. This shows the acceptance of the IP.  This time and BSR will send it to DHCP Server. Lastly, DHCP Server sends DHCP Offer to Relay Agent BSR and it send it as broadcast again. Resident Gateway receives this IP and uses.

# IP Over Ethernet Monitoring
With IP Over Ethernet, DHCP renewal process is used as keepalive mechanism. This is achieved by giving a very Short IP Lease Time to the users. The resident gateway sees the Short IP Lease Time and requests DHCP Request messages from the edge router. If there is no packet in a period time, the client is down.

# PPPoE and IPoE Deployments
PPPoE and IPoE has different advantages and disadvantages. So, in a network these two broadband access methods are used for different purposes. In a network there are different traffic types like voice, data, iptv etc. Some of these services are unicast and some of them are multicast. For example, if we have data, VoIP and IPTV services in a network, we can use PPPoE for Unicast data and VoIP traffic. And we can use IP Over Ethernet for Multicast IPTV traffic.

Using such a Dual Approach is a better solution. Because many networks have a ready PPPoE solution. They need only some additional IPoE enhancement.

# IPoE versus PPPoE
There are different advantages and disadvantages of IPoE and PPPoE if we compare them as IPoE versus PPPoE. Let’s see what are these differences between these two broadband connection methods.

In the comparison of IPoE and PPPoE, first of all, PPPoE is a Connection Oriented protocol. Session establishment is done before using this protocol. On the other hand, IPoE is a Connectionless protocol.

When we compare IPoE versus PPPoE, the second difference between IP Over Ethernet and PPPoE is using Authentication. PPPoE required user authentication. In other words, to get an IP address from the DHCP Server, you should validate yourself with your username and password. IPoE do not need authentication. The only thing you should do is to wait for your IP address without entering any credentials.

User Credentials are needed with PPPoE. So, a configuration must be done before using PPPoE. But there is no need for a configuration for IPoE/DHCP. IPoE is plug and play.

In many networks PPPoE is already being used. IPoE is not supported in all networks now. So, PPPoE is ready but IPoE is not as ready as PPPoE.

When we compare, IPoE versus PPPoE, another difference is about Header. PPPoE adds 8 bytes PPPoE Header to every packet. This provide more processing. IPoE do not add these bytes so the processes in to create, terminate etc.

Another difference about IPoE versus PPPoE is on Multicast traffic.  PPPoE do not support Multicast traffic efficiently. Each multicast subscriber’s content is sent separately, times and times through the same link between the edge router and DSLAM/OLT. In other words, edge router need to terminate each subscriber.  This is not an efficiant solution.

On the other hand, IP Over Ethernet is a good solution for multicast traffic. Same traffic is sent to DSLAM once and then it is multiplexed and sent to the subscribers.  So, in a network it is better to use IPoE method for multicast traffic like IPTV.

PPPoE uses LCP messages as keepalives. IPoE uses Short IP Lease Times as keepalive mechanism. By doing this IPoE monitoring is done.

