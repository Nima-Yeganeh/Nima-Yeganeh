from netmiko import ConnectHandler
import time

with open('devices.txt') as f:
    devices = f.read().splitlines()

device_list = list()

for ip in devices:
    cisco_device = {
        'device_type': 'cisco_xr',
        'host': ip,
        'username': 'cisco',
        'password': 'password',
        'port': '22',
        'secret': 'cisco',
        'verbose': 'true'
        }
    device_list.append(cisco_device)

# print(device_list)
# exit(1)

for device in device_list:
    print(f'connecting to {device["host"]}')
    connection = ConnectHandler(**cisco_device)
    print(connection.send_command('show ip int bri | in Lo'))
    connection.enable()
    output = connection.send_config_from_file('cisco_config_file1.txt')
    print(output)
    connection.disconnect()
