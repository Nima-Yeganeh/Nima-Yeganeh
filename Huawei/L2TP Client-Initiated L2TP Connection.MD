# AR500, AR510, AR531, AR550, AR1500, and AR2500 V200R009 CLI-based Configuration
# L2TP Client-Initiated L2TP Connection

# Configure the L2TP Client.
# Configure an IP address for the public-network-side interface.
system-view
sysname L2TP Client
interface gigabitethernet 1/0/0
undo portswitch
ip address 202.1.2.1 255.255.255.0
quit

# Configure an IP address for the user-side interface.
interface gigabitethernet 2/0/0
undo portswitch
ip address 192.168.10.1 255.255.255.0
quit

# Enable L2TP globally, create an L2TP group, and configure the user huawei to establish an L2TP connection to the LNS.
l2tp enable
l2tp-group 1
tunnel name L2TP_Client
start l2tp ip 202.1.1.1 fullusername huawei

# Enable tunnel authentication and set the tunnel password.
tunnel authentication
tunnel password cipher huawei
quit

# Configure the user name and password, authentication mode, and IP address for the virtual PPP user.
interface virtual-template 1
ppp chap user huawei
ppp chap password cipher Huawei@1234
ip address ppp-negotiate
quit

# On the LNS, configure a static route to the public network. For example, set the next hop address to 202.1.2.2.
ip route-static 202.1.1.1 255.255.255.255 202.1.2.2

# Enable the L2TP Client to dial up and establish an L2TP tunnel.
interface virtual-template 1
l2tp-auto-client enable
quit

# Configure private routes so that branches can communicate with the headquarters through the private network.
ip route-static 192.168.2.0 255.255.255.0 virtual-template 1

# Configure the LNS.
# Configure an IP address for the public-network-side interface.
system-view
sysname LNS
interface gigabitEthernet 1/0/0
undo portswitch
ip address 202.1.1.1 255.255.255.0
quit

# Configure an IP address for the user-side interface.
interface GigabitEthernet 2/0/0
undo portswitch
ip address 192.168.2.1 255.255.255.0
quit

# Configure AAA authentication, and set the user name and password to huawei and Huawei@1234 on the LNS.
aaa
local-user huawei password
local-user huawei service-type ppp
quit

# Configure an IP address pool for the LNS and allocate an IP address to the dial-up interface of the L2TP Client.
ip pool l
network 192.168.1.0 mask 24
gateway-list 192.168.1.1
quit

# Create a virtual interface template and configure PPP negotiation parameters.
interface virtual-template 1
ppp authentication-mode chap
remote address pool 1
ip address 192.168.1.1 255.255.255.0
quit

# Enable L2TP and configure an L2TP group.
l2tp enable
l2tp-group 1

# Configure an LNS tunnel name and L2TP Client tunnel name.
tunnel name lns
allow l2tp virtual-template 1 remote L2TP_Client

# Enable the tunnel authentication function, and configure an authentication password.
tunnel authentication
tunnel password cipher huawei
quit

# On the LNS, configure a static route to the public network. For example, set the next hop address to 202.1.1.2.
ip route-static 202.1.2.1 255.255.255.255 202.1.1.2

# Configure private routes so that the headquarters can communicate with branches through the private network.
ip route-static 192.168.10.0 255.255.255.0 virtual-template 1

# Verify the configuration.
# Run the display l2tp tunnel command on the L2TP Client or LNS to view L2TP tunnel and session information. The command output for the LNS is shown as an example.
display l2tp tunnel

 Total tunnel : 1
 LocalTID RemoteTID RemoteAddress    Port   Sessions RemoteName
 1        1         202.1.2.1        1701   1       L2TP_Client


