# MQC Hierarchy in Queuing ASIC

policy-map child
    class c1
        priority level 1
        police rate 640 kbps
    class c2
        bandwidth 20 mbps
    class class-default
        bandwidth 1 mbps
!
policy-map parent
    class class-default
        shape average 35 mbps
        service-policy child
!
interface GigabitEthernet0/0/0/0
    service-policy output parent
