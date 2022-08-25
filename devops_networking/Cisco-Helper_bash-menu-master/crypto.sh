#/bin/bash
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

source dir.var
source IP.var
source serial.var
source creds.var

echo -e '\r' > $serial
sleep 3
echo -e $user > $serial
sleep .5
echo -e $pass > $serial
echo -e 'enable' > $serial
sleep .5
echo -e $pass > $serial
echo -e 'conf t' > $serial
echo -e 'cry key gen rsa mod 2048' > $serial
sleep 10
echo -e 'end' > $serial
echo -e 'wr' > $serial
echo -e '\r' > $serial