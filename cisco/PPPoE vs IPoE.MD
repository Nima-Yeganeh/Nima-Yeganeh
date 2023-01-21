# PPPoE vs IPoE

# PPPoE
PPPoE(PPP over Ethernet) is a technology that establishes a PPP connection over the ethernet. As known, ethernet doesn’t support authenticating access users, while PPP does, but PPP is a point-to-point protocol, it requires a point-to-point link, it will cost a lot of money to establish a point-to-point link between ISP and users. Think about the physical links between users and ISP in your city.

To eliminate the disadvantages for both PPPoE and IPoE, the PPPoE is introduced.

PPPoE allows multi-logical PPP links established over the ethernet, and it’s widely used when dialer users access the Internet.

PPPoE authentication mechanism brings not only security but also complexity.

With the spreading of the IPTV, PPPoE is not suitable in these situations. Since PPPoE requires the dialer terminal, while these devices are not able to install such software. Also, since the PPPoE is a virtual PPP link between ISP and dialer user, so the BRAS, which dialer users access, would become the bottleneck when spreading multicast traffic.

# IPoE
In IP over Ethernet (IPoE) scenario, a PC is connected to the Ethernet interface of a BRAS through a Layer 2 device (such as LAN Switch). When the PC accesses the IPv4 network, a user IP packet is encapsulated into an IPoE packet on the Ethernet interface. The IPoE packet is forwarded to the BRAS through the Layer 2 device. The BRAS then authenticates the user and authorizes user services based on physical or logical information carried in the IPoE packet, such as the MAC address, VLAN ID, and Option 82 (line information).

Unlike the PPPoe, IPoE is easy to use and does not need any client dial-in software. IPoE authenticates and charges users based on their physical location (identified by a unique VLAN ID / PVC ID). Users do not need to enter a user name and password when they access the Internet.

