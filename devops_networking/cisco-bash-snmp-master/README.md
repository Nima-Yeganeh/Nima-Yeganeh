# cisco-bash-snmp
 Bash script that shows outputs, which similar with commands "show ip int brief" and "show ip bgp sum", by using SNMP

#The script is based on idea of script "bash-for-snmp" by @nxfxn (https://github.com/nxfxn/bash-for-snmp)

Usage:
```
[syu@testhost ~]$  sh ip-int-brief 10.13.184.122
Interface table:
____________________________________________________________________________________________________________
| Interface                      | IP-Address      | Status       | Protocol     | Last Status Change        |
| ______________________________ | _______________ | __________   | ____________ | _________________________ |
| GigabitEthernet0/0/0           | -               | up           | up           | 46 days 8 hours 22 min    |
| GigabitEthernet0/0/1           | 156.13.9.88     | up           | up           | 46 days 9 hours 9 min     |
| GigabitEthernet0/0/2           | -               | admin_down   | down         | 46 days 9 hours 9 min     |
| GigabitEthernet0               | -               | admin_down   | down         | 46 days 9 hours 9 min     |
| Loopback0                      | 10.13.184.122   | up           | up           | 46 days 9 hours 10 min    |
| GigabitEthernet0/0/0.11        | 10.12.12.65     | up           | up           | 46 days 8 hours 22 min    |
| GigabitEthernet0/0/0.21        | 10.11.140.1     | up           | up           | 46 days 8 hours 22 min    |
| GigabitEthernet0/0/0.31        | 10.11.251.209   | up           | up           | 46 days 8 hours 22 min    |
| GigabitEthernet0/0/0.340       | 10.11.134.97    | up           | up           | 46 days 8 hours 22 min    |
| Tunnel1                        | 10.11.184.122   | up           | up           | 46 days 9 hours 9 min     |
|____________________________________________________________________________________________________________|
[syu@testhost ~]$

[syu@testhost ~]$ sh ip-bgp-sum 10.13.184.122
BGP summary (Default):
________________________________________________________________________
| Neighbor IP     | Status      | Uptime                        | PfxRcd |
| _______________ | ___________ | _____________________________ | ______ |
| 10.11.184.1     | Established | 0 days 8 hours 16 minutes     | 2142   |
| 10.11.184.2     | Established | 0 days 2 hours 18 minutes     | 2138   |
|________________________________________________________________________|
[syu@testhost ~]$
```
