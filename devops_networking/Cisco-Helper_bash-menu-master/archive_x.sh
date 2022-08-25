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
echo -e 'enable' > $serial
echo -e 'archive tar /xtract tftp://'${IP}'/'${f##/*/*/} 'flash:' > $serial
echo "You are free to move your console cable...${RED}DO NOT REMOVE Ethernet cable!${STD}
