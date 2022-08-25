import json
import logging
from netmiko import ConnectHandler

def get_devices(role, ip=None):

    with open('devices.json', 'r') as json_file:
        devices = json.load(json_file)
        
    if role == 'all':
        hosts = []
        for tier in devices:
            for host in devices[tier]:
                hosts.append(host)
        return hosts

    else:
        try:
            if ip == None:
                return devices[role]
            else:
                for hosts in devices[role]:
                    if hosts['host'] == ip:
                        return hosts
                return None

        except:
            return None


def access_port_config(data):
    commands = []
    for vlan in data:
        commands.extend([
            'interface ' + vlan['interface'],
            'switchport mode access',
            'switchport access vlan ' + vlan['vlan_id']
        ])
    return commands

def send_config(device,commands):
    # Optional: Enable global logging
    logging.basicConfig(filename='logs/netmiko_global.log', level=logging.DEBUG)
    logging.getLogger('netmiko')

    try:
        ssh_connect = ConnectHandler(**device)
        ssh_connect.enable()
        ssh_connect.send_config_set(commands)
        ssh_connect.disconnect()
        return True
    except:
        return False