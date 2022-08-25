#/bin/bash
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#~~~~~~~~~~~~~~~~~~~~
#Source our variables
#~~~~~~~~~~~~~~~~~~~~
source dir.var
source IP.var
source serial.var
RED='\033[0;41;30m'
STD='\033[0;0;39m'
#~~~~~~~~~~~~~~~~~~~~
#Configure the device
#~~~~~~~~~~~~~~~~~~~~
printf "Please select IOS:\n"
select f in ${dir}/*; do test -f "$f" && break; echo ">>> Invalid Selection"; done

echo -e '\r' > $serial
echo -e 'no' > $serial
echo -e 'enable' > $serial
echo -e 'config t' > $serial
echo -e 'interface vlan 1' > $serial
echo -e 'no shutdown' > $serial
echo -e 'ip address '${IP%.*}'.2 255.255.255.0' > $serial
echo -e 'interface GigabitEthernet1/1' > $serial
echo -e 'no shutdown' > $serial
echo -e 'interface GigabitEthernet1/2' > $serial
echo -e 'no shutdown' > $serial
echo -e 'interface F1/8' > $serial
echo -e 'no shutdown' > $serial
echo -e 'switchport access vlan 1'
echo -e 'end' > $serial
echo -e 'write' > $serial
echo -e 'ping '${IP}' repeat 100' > $serial
sleep 10
echo -e 'copy tftp://'${IP}'/'${f##/*/*/} 'flash:' > $serial
echo -e '\r' > $serial
echo "You are free to move your console cable...${RED}DO NOT REMOVE Ethernet cable!${STD}
