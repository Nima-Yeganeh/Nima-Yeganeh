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
cmd = '''
int loopback3
ip address 3.3.3.3/32
int loopback4
ip address 4.4.4.4/32
commit
'''
output = connection.send_config_set(cmd.split('\n'))
print(output)
print(connection.find_prompt())
connection.disconnect()
connection = ConnectHandler(**cisco_device)
print(connection.send_command('show ip int bri | in Lo'))
connection.disconnect()
