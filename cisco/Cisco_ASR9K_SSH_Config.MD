# Cisco ASR SSH Config
# Example

username cisco
 group root-lr
 group cisco-support
 secret 10 $6$9a93l0tGFgI29l0.$yYSA2JvN7M5AXQMPS80MwSNnZv71fMyPPw7RpNQ.GD56BifpHJV8RqVeOVZOgqlU62chv7uyWhNT5iUUAsSZx1
!

username nima
 password 7 0608062C4D
!

aaa authorization exec default local
aaa authentication login default local

!
interface GigabitEthernet0/0/0/1
 ipv4 address 192.168.244.101 255.255.255.0
!

ssh server logging
ssh timeout 120
ssh server v2

# https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/sec_usr_ssh/configuration/xe-3s/sec-usr-ssh-xe-3s-book.pdf

# Verification
RP/0/RP0/CPU0:R1#show ssh
Thu Jan 26 10:59:59.714 UTC
SSH version : Cisco-2.0

id       chan pty     location        state           userid    host                  ver authentication connection type
-------------------------------------------------------------------------------------------------------------------------------
Incoming sessions
1        1    vty0    0/RP0/CPU0      SESSION_OPEN    cisco     192.168.244.1         v2  key-intr       Command-Line-Interface

Outgoing sessions

RP/0/RP0/CPU0:R1#


# Verification
RP/0/RP0/CPU0:R1#show ssh server
Thu Jan 26 11:00:26.477 UTC
---------------------
SSH Server Parameters
---------------------

Current supported versions := v2
                  SSH port := 22
                  SSH vrfs := vrfname:=default(v4-acl:=, v6-acl:=)
              Netconf Port := 830
              Netconf Vrfs :=

 Algorithms
---------------
        Hostkey Algorithms := x509v3-ssh-rsa,ecdsa-sha2-nistp521,ecdsa-sha2-nistp384,ecdsa-sha2-nistp256,rsa-sha2-512,rsa-sha2-256,ssh-rsa,ssh-dsa,ssh-ed25519
   Key-Exchange Algorithms := ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group14-sha1
     Encryption Algorithms := aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,chacha20-poly1305@openssh.com
            Mac Algorithms := hmac-sha2-512,hmac-sha2-256,hmac-sha1

 Authentication Method Supported
------------------------------------
                 PublicKey := Yes
                  Password := Yes
      Keyboard-Interactive := Yes
         Certificate Based := Yes

 Others
------------
                     DSCP  := 16
                Ratelimit  := 60
             Sessionlimit  := 64
                Rekeytime  := 60
       Server rekeyvolume  := 1024
  TCP window scale factor  := 1
            Backup Server  := Disabled
          Host Trustpoint  :=
          User Trustpoint  :=
          Port Forwarding  := Disabled
 Max Authentication Limit  := 20
     Certificate username  := Common name(CN)

RP/0/RP0/CPU0:R1#

# Verification
RP/0/RP0/CPU0:R1#show ip ssh session  details
Thu Jan 26 11:01:11.178 UTC
SSH version : Cisco-2.0

id      key-exchange                  pubkey               incipher    outcipher   inmac              outmac
--------------------------------------------------------------------------------------------------------------
Incoming Sessions
1       ecdh-sha2-nistp256            ssh-ed25519          aes256-ctr  aes256-ctr  hmac-sha2-256      hmac-sha2-256

Outgoing sessions

RP/0/RP0/CPU0:R1#

