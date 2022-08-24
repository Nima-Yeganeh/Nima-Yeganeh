sudo apt-get install snmpd

sudo gedit /etc/snmp/snmpd.conf
sudo nano /etc/snmp/snmpd.conf

# old
Line 45 : view systemonly included .1.3.6
Line 46 : view systemonly included .1.3.6
# new change to >>
Line 45 : view systemonly included
Line 46 : view systemonly included

# old
Line 51 : rocommunity public default -V systemonly
Line 53 : rocommunity6 public default -V systemonly
# new
public --> "password"
Line 51 : rocommunity password default -V systemonly
Line 53 : rocommunity6 password default -V systemonly

# old
Line 129 : trapsink localhost public
# new
public --> "password"
Line 129 : trapsink localhost password

# add new line
agentaddress "System IP":161

sudo service snmpd restart

snmpwalk -v 2c -c "password" -0 e 127.0.0.1
