from netmiko import ConnectHandler
import json
import logging

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


def generate_banner(hostname):
    return [
    '****************************************',
    ('* Welcome to ' + hostname + '                               ')[0:39] + '*',
    '* This device managed by XDNRoot       *',
    '* Hack me please!                      *',
    '****************************************',
    ]

def banner_configuration(banner):
    config_commands = [
        'banner exec ^',
    ]
    config_commands.extend(banner)
    config_commands.extend(
        [
        '^',
        'banner login ^',
        ]
    )
    config_commands.extend(banner)
    config_commands.extend(
        [
        '^',
        'banner incoming ^',
        ]
    )
    config_commands.extend(banner)
    config_commands.append('^')
    return config_commands


if __name__ == '__main__':
    # Optional: Enable global logging
    logging.basicConfig(filename='logs/netmiko_global.log', level=logging.DEBUG)
    logger = logging.getLogger("netmiko")

    devices = get_devices('access')
    
    if devices == None:
        print("Please select the correct device(s)")
        exit()
    
    for device in devices:
        ssh_connect = ConnectHandler(**device)
        ssh_connect.enable()
        
        hostname = ssh_connect.send_command('show run | include hostname')
        hostname = hostname.strip('hostname ')


        banner = generate_banner(hostname)

        ssh_connect.send_config_set(banner_configuration(banner), cmd_verify=False)
        
        ssh_connect.disconnect()
        print(hostname + ' configured!')