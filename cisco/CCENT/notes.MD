Here’s a list of some of the things that commonly cause LAN traffic congestion:
1. Too many hosts in a collision or broadcast domain
2. Broadcast storms
3. Too much multicast traffic
4. Low bandwidth
5. Adding hubs for connectivity to the network
6. A bunch of ARP broadcasts

There are two advantages to using routers in your network:
1. They don’t forward broadcasts by default.
2. They can filter the network based on layer 3 (Network layer) information such as an
3. IP address.

Here are four ways a router functions in your network:
1. Packet switching
2. Packet filtering
3. Internetwork communication
4. Path selection

Switches create separate collision domains within a single broadcast domain. Routers provide a separate broadcast domain for each interface. Don’t let this ever confuse you!

You would use a bridge in a network to reduce collisions within broadcast domains and to increase the number of collision domains in your network. Doing this provides more bandwidth for users. And never forget that using hubs in your Ethernet network can contribute to congestion. As always, plan your network design carefully!

Don’t misunderstand… bridges/switches are used to segment networks, but they will not isolate broadcast or multicast packets.

Here’s a list of some of the more important benefits of using the OSI layered model:
1. It divides the network communication process into smaller and simpler components, facilitating component development, design, and troubleshooting.
2. It allows multiple-vendor development through the standardization of network components.
3. It encourages industry standardization by clearly defining what functions occur at each layer of the model.
4. It allows various types of network hardware and software to communicate.
5. It prevents changes in one layer from affecting other layers to expedite development.

The following network devices operate at all seven layers of the OSI model:
1. Network management stations (NMSs)
2. Web and application servers
3. Gateways (not default gateways)
4. Servers
5. Network hosts

The OSI reference model has the following seven layers:
1. Application layer (layer 7)
2. Presentation layer (layer 6)
3. Session layer (layer 5)
4. Transport layer (layer 4)
5. Network layer (layer 3)
6. Data Link layer (layer 2)
7. Physical layer (layer 1)

The term reliable networking can be used at the Transport layer. Reliable networking requires that acknowledgments, sequencing, and flow control will all be used.

Here’s a summary of the steps in the connection-oriented session—that three-way handshake
1. The first “connection agreement” segment is a request for synchronization (SYN).
2. The next segments acknowledge (ACK) the request and establish connection parameters—the rules—between hosts. These segments request that the receiver’s sequencing is synchronized here as well so that a bidirectional connection can be formed.
3. The final segment is also an acknowledgment, which notifies the destination host that the connection agreement has been accepted and that the actual connection has been established. Data transfer can now begin.

Reliable data transport employs a connection-oriented communications session between systems, and the protocols involved ensure that the following will be achieved:
1. The segments delivered are acknowledged back to the sender upon their reception.
2. Any segments not acknowledged are retransmitted.
3. Segments are sequenced back into their proper order upon arrival at their destination.
4. A manageable data flow is maintained in order to avoid congestion, overloading, or worse, data loss.

The purpose of flow control is to provide a way for the receiving device to control the amount of data sent by the sender.

A service is considered connection-oriented if it has the following characteristics:
1. A virtual circuit, or “three-way handshake,” is set up.
2. It uses sequencing.
3. It uses acknowledgments.
4. It uses flow control.

The types of flow control are buffering, windowing, and congestion avoidance.

Windows are used to control the amount of outstanding, unacknowledged data segments.

If a receiving host fails to receive all the bytes that it should acknowledge, the host can improve the communication session by decreasing the window size.

A router in an internetwork. Each router LAN interface is a broadcast domain. Routers break up broadcast domains by default and provide WAN services.

Here are some router characteristics that you should never forget:
1. Routers, by default, will not forward any broadcast or multicast packets.
2. Routers use the logical address in a Network layer header to determine the next-hop router to forward the packet to.
3. Routers can use access lists, created by an administrator, to control security based on the types of packets allowed to enter or exit an interface.
4. Routers can provide layer 2 bridging functions if needed and can simultaneously route through the same interface.
5. Layer 3 devices—in this case, routers—provide connections between virtual LANs (VLANs).
6. Routers can provide quality of service (QoS) for specific types of network traffic.

Latency is the time measured from when a frame enters a port to when it exits a port.

Understand that every type of network has both a physical and a logical topology.
1. The physical topology of a network refers to the physical layout of the devices, but mostly the cabling and cabling layout.
2. The logical topology defines the logical path on which the signal will travel on the physical topology.

Identify the possible causes of LAN traffic congestion:
Too many hosts in a broadcast domain, broadcast storms, multicasting, and low bandwidth are all possible causes of LAN traffic congestion.

Describe the difference between a collision domain and a broadcast domain: 
Collision domain is an Ethernet term used to describe a network collection of devices in which one particular device sends a packet on a network segment, forcing every other device on that same segment to pay attention to it. With a broadcast domain, a set of all devices on a network hears all broadcasts sent on all segments.

Differentiate a MAC address and an IP address and describe how and when each address type is used in a network:
A MAC address is a hexadecimal number identifying the physical connection of a host. MAC addresses are said to operate on layer 2 of the OSI model. IP addresses, which can be expressed in binary or decimal format, are logical identifiers that are said to be on layer 3 of the OSI model. Hosts on the same physical segment locate one another with MAC addresses, while IP addresses are used when they reside on different LAN segments or subnets.

Understand the difference between a hub, a bridge, a switch, and a router:
A hub creates one collision domain and one broadcast domain. A bridge breaks up collision domains but creates one large broadcast domain. They use hardware addresses to filter the network. Switches are really just multiple-port bridges with more intelligence; they break up collision domains but create one large broadcast domain by default. Bridges and switches use hardware addresses to filter the network. Routers break up broadcast domains (and collision domains) and use logical addressing to filter the network.

Identify the functions and advantages of routers: 
Routers perform packet switching, filtering, and path selection, and they facilitate internetwork communication. One advantage of routers is that they reduce broadcast traffic.

Differentiate connection-oriented and connectionless network services and describe how each is handled during network communications:
Connectionoriented services use acknowledgments and flow control to create a reliable session. More overhead is used than in a connectionless network service. Connectionless services are used to send data with no acknowledgments or flow control. This is considered unreliable.

Define the OSI layers, understand the function of each, and describe how devices and networking protocols can be mapped to each layer:
You must remember the seven layers of the OSI model and what function each layer provides. The Application, Presentation, and Session layers are upper layers and are responsible for communicating from a user interface to an application. The Transport layer provides segmentation, sequencing, and virtual circuits. The Network layer provides logical network addressing and routing through an internetwork. The Data Link layer provides framing and placing of data on the network medium. The Physical layer is responsible for taking 1s and 0s and encoding them into a digital signal for transmission on the network segment.

When a collision occurs on an Ethernet LAN, the following happens:
1. A jam signal informs all devices that a collision occurred.
2. The collision invokes a random backoff algorithm.
3. Each device on the Ethernet segment stops transmitting for a short time until its backoff timer expires.
4. All hosts have equal priority to transmit after the timers have expired.

Backoff on an Ethernet network is the retransmission delay that’s enforced when a collision occurs. When that happens, a host will resume transmission only after the forced time delay has expired. Keep in mind that after the backoff has elapsed, all stations have equal priority to transmit data.

You can use full-duplex Ethernet in at least the following six situations:
1. With a connection from a switch to a host
2. With a connection from a switch to a switch
3. With a connection from a host to a host
4. With a connection from a switch to a router
5. With a connection from a router to a router
6. With a connection from a router to a host

Full-duplex Ethernet requires a point-to-point connection when only two nodes are present. You can run full-duplex with just about any device except a hub.

Remember that half-duplex Ethernet shares a collision domain and provides a lower effective throughput than full-duplex Ethernet, which typically has a private per-port collision domain plus a higher effective throughput.

Last, remember these important points:
1. There are no collisions in full-duplex mode.
2. A dedicated switch port is required for each full-duplex node.
3. The host network card and the switch port must be capable of operating in full-duplex mode.
4. The default behavior of 10Base-T and 100Base-T hosts is 10 Mbps half-duplex if the autodetect mechanism fails, so it is always good practice to set the speed and duplex of each port on a switch if you can.

Hex is short for hexadecimal, which is a numbering system that uses the first six letters of the alphabet, A through F, to extend beyond the available 10 characters in the decimal system. These values are not case sensitive.

Preamble
An alternating 1,0 pattern provides a 5 MHz clock at the start of each packet, which allows the receiving devices to lock the incoming bit stream.

Start Frame Delimiter (SFD)/Synch:
The preamble is seven octets and the SFD is one octet (synch). The SFD is 10101011, where the last pair of 1s allows the receiver to come into the alternating 1,0 pattern somewhere in the middle and still sync up to detect the beginning of the data.

Destination Address (DA):
This transmits a 48-bit value using the least significant bit (LSB) first. The DA is used by receiving stations to determine whether an incoming packet is addressed to a particular node. The destination address can be an individual address or a broadcast or multicast MAC address. Remember that a broadcast is all 1s—all Fs in hex—and is sent to all devices. A multicast is sent only to a similar subset of nodes on a network.

Source Address (SA):
The SA is a 48-bit MAC address used to identify the transmitting device, and it uses the least significant bit first. Broadcast and multicast address formats are illegal within the SA field.

Length or Type:
802.3 uses a Length field, but the Ethernet_II frame uses a Type field to identify the Network layer protocol. The old, original 802.3 cannot identify the upperlayer protocol and must be used with a proprietary LAN—IPX, for example.

Data:
This is a packet sent down to the Data Link layer from the Network layer. The size can vary from 46 to 1,500 bytes.

Frame Check Sequence (FCS):
FCS is a field at the end of the frame that’s used to store the cyclic redundancy check (CRC) answer. The CRC is a mathematical algorithm that’s run when each frame is built based on the data in the frame. When a receiving host receives the frame and runs the CRC, the answer should be the same. If not, the frame is discarded, assuming errors have occurred.

10Base-T (IEEE 802.3) 10 Mbps using category 3 unshielded twisted pair (UTP) wiring for runs up to 100 meters. Unlike with the 10Base-2 and 10Base-5 networks, each device must connect into a hub or switch, and you can have only one host per segment or wire. It uses an RJ45 connector (8-pin modular connector) with a physical star topology and a
logical bus.

100Base-TX (IEEE 802.3u) 100Base-TX, most commonly known as Fast Ethernet, uses EIA/TIA category 5, 5E, or 6 UTP two-pair wiring. One user per segment; up to 100 meters long. It uses an RJ45 connector with a physical star topology and a logical bus.

100Base-FX (IEEE 802.3u) Uses fiber cabling 62.5/125-micron multimode fiber. Point-to-point topology; up to 412 meters long. It uses ST and SC connectors, which are media-interface connectors.

1000Base-CX (IEEE 802.3z) Copper twisted-pair, called twinax, is a balanced coaxial pair that can run only up to 25 meters and uses a special 9-pin connector known as the High Speed Serial Data Connector (HSSDC). This is used in Cisco’s new Data Center technologies.

1000Base-T (IEEE 802.3ab) Category 5, four-pair UTP wiring up to 100 meters long and up to 1 Gbps.

1000Base-SX (IEEE 802.3z) The implementation of 1 Gigabit Ethernet running over multimode fiber-optic cable instead of copper twisted-pair cable, using short wavelength laser. Multimode fiber (MMF) using 62.5- and 50-micron core; uses an 850 nanometer (nm) laser and can go up to 220 meters with 62.5-micron, 550 meters with 50-micron.

1000Base-LX (IEEE 802.3z) Single-mode fiber that uses a 9-micron core and 1300 nm laser and can go from 3 kilometers up to 10 kilometers.

1000Base-ZX (Cisco standard) 1000BaseZX, or 1000Base-ZX, is a Cisco specified standard for Gigabit Ethernet communication. 1000BaseZX operates on ordinary singlemode fiber-optic links with spans up to 43.5 miles (70 km).

10GBase-T (802.3.an) 10GBase-T is a standard proposed by the IEEE 802.3an committee to provide 10 Gbps connections over conventional UTP cables, (category 5e, 6, or 7 cables). 10GBase-T allows the conventional RJ45 used for Ethernet LANs and can support signal transmission at the full 100-meter distance specified for LAN wiring.

If you want to implement a network medium that is not susceptible to electromagnetic interference (EMI), fiber-optic cable provides a more secure, longdistance cable that is not susceptible to EMI at high speeds.

The crossover cable can be used to connect the following devices:
1. Switch to switch
2. Hub to hub
3. Host to host
4. Hub to switch
5. Router direct to host
6. Router to router

Here’s a list of things that we want to achieve as we design the core:
1. Design the core for high reliability. Consider data-link technologies that facilitate both speed and redundancy, like Gigabit Ethernet with redundant links or even 10 Gigabit Ethernet.
2. Design with speed in mind. The core should have very little latency.
3. Select routing protocols with lower convergence times. Fast and redundant data-link connectivity is no help if your routing tables are shot!

The distribution layer is where we want to implement policies for the network because we are allowed a lot of flexibility in defining network operation here. There are several things that should generally be handled at the distribution layer:
1. Routing
2. Implementing tools (such as access lists), packet filtering, and queuing
3. Implementing security and network policies, including address translation and firewalls
4. Redistributing between routing protocols, including static routing
5. Routing between VLANs and other workgroup support functions
6. Defining broadcast and multicast domains

The following are some of the functions to be included at the access layer:
1. Continued (from distribution layer) use of access control and policies
2. Creation of separate collision domains (microsegmentation/switches)
3. Workgroup connectivity into the distribution layer
4. Device connectivity
5. Resiliency and security services
6. Advanced technology capabilities (voice/video, etc.)

Describe the operation of Carrier Sense Multiple Access with Collision
Detection (CSMA/CD):
CSMA/CD is a protocol that helps devices share the bandwidth evenly without having two devices transmit at the same time on the network medium. Although it does not eliminate collisions, it helps to greatly reduce them, which reduces retransmissions, resulting in a more efficient transmission of data for all devices.

Differentiate half-duplex and full-duplex communication and define the
requirements to utilize each method:
Full-duplex Ethernet uses two pairs of wires at the same time instead of one wire pair like half-duplex. Full-duplex allows for sending and receiving at the same time, using different wires to eliminate collisions, while halfduplex can send or receive but not at the same time and still can suffer collisions. To use full-duplex, the devices at both ends of the cable must be capable of and configured to perform full-duplex.

Describe the sections of a MAC address and the information contained in each
section:
The MAC, or hardware, address is a 48-bit (6-byte) address written in a hexadecimal format. The first 24 bits, or 3 bytes, are called the organizationally unique identifier (OUI), which is assigned by the IEEE to the manufacturer of the NIC. The balance of the number uniquely identifies the NIC.

Identify the binary and hexadecimal equivalent of a decimal number:
Any number expressed in one format can also be expressed in the other two. The ability to perform this conversion is critical to understanding IP addressing and subnetting. Be sure to go through the written labs covering binary to decimal to hexadecimal conversion.

Identify the fields in the Data Link portion of an Ethernet frame:
The fields in the Data Link portion of a frame include the preamble, Start Frame Delimiter, destination MAC address, source MAC address, Length or Type, Data, and Frame Check Sequence.

Identify the IEEE physical standards for Ethernet cabling:
These standards describe the capabilities and physical characteristics of various cable types and include but are not limited to 10Base-2, 10Base-5, and 10Base-T.

Differentiate types of Ethernet cabling and identify their proper application:
The three types of cables that can be created from an Ethernet cable are straight-through (to connect a PC’s or router’s Ethernet interface to a hub or switch), crossover (to connect hub to hub, hub to switch, switch to switch, or PC to PC), and rolled (for a console connection from a PC to a router or switch).

Describe the data encapsulation process and the role it plays in packet
creation:
Data encapsulation is a process whereby information is added to the frame from each layer of the OSI model. This is also called packet creation. Each layer communicates only with its peer layer on the receiving device.

Understand how to connect a console cable from a PC to a router and switch:
Take a rolled cable and connect it from the COM port of the host to the console port of a router. Start your emulations program such as putty or SecureCRT and set the bits per second to 9600 and flow control to None.

Identify the layers in the Cisco three-layer model and describe the ideal
function of each layer:
The three layers in the Cisco hierarchical model are the core (responsible for transporting large amounts of traffic both reliably and quickly), distribution (provides routing, filtering, and WAN access), and access (workgroup connectivity into the distribution layer).

