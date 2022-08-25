# ciscoconf

Ciscoconf is a simple shell script which backups the running and the startup configuration of Cisco Routers.\
The script uses expect to establish a telnet or ssh connection to a specific Router.\
Then it will fetch the current configuration and compare it with the last known config.\
The results are saved and send to a list of emails proveded in the maillist file (empty for no mails).\
If the configuration has changed, ciscoconf will save the new config in a special folderstructure.

Requires expect and sendmail to be installed on the machine.

### Using ciscoconf

For automation a list of divices can be provided in the divices file.

Format:\
&nbsp;&nbsp;&nbsp;&nbsp;mode;host;name;passwort;user|(secret-passwort;[user])

Call:\
&nbsp;&nbsp;&nbsp;&nbsp;./ciscoconf [COMMAND] | mode host name password user|(secret-password [user])

Commands:\
&nbsp;&nbsp;&nbsp;&nbsp;-a, --all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;backup all devices provided in the devices file

Parameters:\
&nbsp;&nbsp;&nbsp;&nbsp;mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;telnet, t or ssh, s\
&nbsp;&nbsp;&nbsp;&nbsp;host&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ip address or name of host\
&nbsp;&nbsp;&nbsp;&nbsp;name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name for the folder\
&nbsp;&nbsp;&nbsp;&nbsp;password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;password\
&nbsp;&nbsp;&nbsp;&nbsp;secret-password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;secret-password for telnet\
&nbsp;&nbsp;&nbsp;&nbsp;user&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;username

Examples:\
&nbsp;&nbsp;&nbsp;&nbsp;ciscoconf t myhost1.net myhost1 save saver me&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;telnet based bakup of myhost1.net in myhost1\
&nbsp;&nbsp;&nbsp;&nbsp;ciscoconf s myhost2.net myhost2 save me&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ssh based bakup of myhost2.net in myhost2
