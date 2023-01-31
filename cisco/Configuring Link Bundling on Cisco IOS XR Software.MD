# Configuring Link Bundling on Cisco IOS XR Software

# R1

interface Bundle-Ether2
 mtu 1500
 ipv4 address 12.1.1.1 255.255.255.0
 bundle minimum-active links 1
 bundle minimum-active bandwidth gbps 1

interface GigabitEthernet0/0/0/2
 bundle id 2 mode active
!
interface GigabitEthernet0/0/0/3
 bundle id 2 mode active
!

# https://www.cisco.com/c/en/us/td/docs/routers/xr12000/software/xr12k_r4-3/interfaces/configuration/guide/hc43xxr12kbook/hc43lbun.pdf
