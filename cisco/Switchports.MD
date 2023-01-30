Switchports
    + Speed/Duplex
    + Dynamic
        o Desirable
        o Auto
    + Access
    + Trunk
        o Encapsulation
            # ISL
            # 802.1q
        o Mode
            # Static
            # DTP
    + Allowed List
    + Tunnel
        o 802.1q Tunnel

Speed mismatches usually causes a link to be UP/DOWN.

Duplex mismatches will bring the link UP/UP but will typically result in packet loss and interface errors >> Seen with the command "sh interface" as 'late collisions'.

