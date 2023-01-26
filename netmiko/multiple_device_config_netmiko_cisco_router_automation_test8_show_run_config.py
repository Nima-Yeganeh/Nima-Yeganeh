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

for device in device_list:
    print(f'connecting to {device["host"]}')
    connection = ConnectHandler(**cisco_device)
    output = connection.send_command('show run')
    prompt = connection.find_prompt()
    print(output)
    filename = f'{device["host"]}-backup.txt'
    with open(filename, 'w') as backup:
        backup.write(output)
    connection.disconnect()
