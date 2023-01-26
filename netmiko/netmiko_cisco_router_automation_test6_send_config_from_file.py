from netmiko import ConnectHandler
import time

cisco_device = {
    'device_type': 'cisco_xr',
    'host': '192.168.244.101',
    'username': 'cisco',
    'password': 'password',
    'port': '22',
    'secret': 'cisco',
    'verbose': 'true'
}

print('before change:')
connection = ConnectHandler(**cisco_device)
print(connection.send_command('show ip int bri | in Lo'))
connection.disconnect()
connection = ConnectHandler(**cisco_device)
connection.enable()
output = connection.send_config_from_file('cisco_config_file1.txt')
print(output)
connection.disconnect()
print('after change:')
connection = ConnectHandler(**cisco_device)
print(connection.send_command('show ip int bri | in Lo'))
connection.disconnect()
