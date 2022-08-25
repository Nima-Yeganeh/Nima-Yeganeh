#/bin/bash
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

source dir.var
source IP.var
source serial.var

echo -e '\r' > $serial
echo -e 'enable' > $serial
echo -e 'del /r /f flash:vlan.dat' > $serial
echo -e 'del /r /f flash:c5915-adventerprisek9-mz.SPA.156-2.T2.bin' > $serial
echo -e 'del /r /f flash:c2020-universalk9-mz.152-4.EA5' > $serial
