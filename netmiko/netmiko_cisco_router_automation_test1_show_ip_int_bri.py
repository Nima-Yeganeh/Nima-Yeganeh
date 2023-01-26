from netmiko import Netmiko
connection = Netmiko(host='192.168.244.101',port='22',username='cisco',password='password',device_type='cisco_xr')
output = connection.send_command('show ip int bri')
print(output)
connection.disconnect()
