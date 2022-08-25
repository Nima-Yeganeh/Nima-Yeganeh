#!/bin/bash
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

source dir.var
source IP.var
source serial.var
RED='\033[0;41;30m'
STD='\033[0;0;39m'

printf "Please select file:\n"
select f in ${dir}/*; do test -f "$f" && break; echo ">>> Invalid Selection"; done
# echo "export filename=${f##*/*/*/*/*/*/}" > filename.var
echo -e "Configuring ${filename}. ${RED}DO NOT${STD} unplug console cable."

echo -e '\r' > $serial
echo -e 'enable' > $serial
echo -e 'copy tftp://'${IP}'/'${f#/*/*/} 'flash:' > $serial
echo -e '\r' > $serial
sleep 2
echo -e 'wr erase' > $serial
echo -e '\r' > $serial
sleep 1
echo -e 'copy flash:'${f##/*/*/} 'start' > $serial
echo -e '\r' > $serial
