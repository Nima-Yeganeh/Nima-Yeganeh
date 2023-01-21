# CSR 1000 Config
# VXLAN, NVE, VNI Config

# VTEP1:
ip multicast-routing distributed
ip pim rp-address 10.1.1.1
interface loopback 1
    ip address 10.1.1.1 255.255.255.255
    ip pim sparse-dense mode
interface NVE 1
    no shutdown
    source interface loopback 1
    member VNI 5010 multicast-group 225.1.1.1 
interface GigabitEthernet 3
    ip address 11.1.1.1 255.255.255.0
    ip pim sparse-dense-mode
interface GiagabitEthernet 1
    service instance 1 ethernet
       encapsulation dot1q 100
bridge-domain 10
    member VNI 5010
    member GiagabitEthernet 1 service-instance 1

# VTEP2:
ip multicast-routing distributed
ip pim rp-address 10.1.1.1
interface loopback 1
    ip address 12.1.1.1 255.255.255.255
    ip pim sparse-dense mode
interface NVE 1
    no shutdown
    source interface loopback 1
    member VNI 5010 multicast-group 225.1.1.1 
interface GigabitEthernet 3
    ip address 15.1.1.1 255.255.255.0
    ip pim sparse-dense-mode
interface GiagabitEthernet 1
    service instance 1 ethernet
    encapsulation dot1q 100
bridge-domain 10
    member VNI 5010
    member GiagabitEthernet 1 service-instance 1

# show nve vni
# show nve vni interface nve1
# show nve interface nve1
# show nve interface nve1 detail
