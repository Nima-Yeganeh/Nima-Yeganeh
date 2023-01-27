# H_QoS Example

policy-map child
    class Pr1
        police rate 64 kbps
        priority level 1
    class Pr2
        police rate 10 mbps
        priority level 2
    class Cl3
        bandwidth 3 mbps
    class Cl4
        set precedence routine
        bandwidth 1 mbps
!
policy-map parent
    class parent1
        shape average 100 mbps
        service-policy child
    class parent2
        shape average 25 mbps
        service-policy child
    class class-default
!
policy-map grand-parent
    class class-default
        shape average 500 mbps
        service-policy parent
