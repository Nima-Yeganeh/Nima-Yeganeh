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

connection = ConnectHandler(**cisco_device)
connection.enable()
# print(connection.send_command('show ip int bri | ex unass'))
# time.sleep(2)
commands = ['conf t', 'int loopback 0', 'ip address 1.1.1.1/32', 'commit']
commands = ['conf t', 'int loopback 2', 'ip address 2.2.2.2/32', 'commit']
connection.send_config_set(commands)
# print(connection.find_prompt())
# print(connection.send_command('show ip int bri'))
connection.disconnect()
connection = ConnectHandler(**cisco_device)
print(connection.send_command('show ip int bri | in Lo'))
connection.disconnect()
