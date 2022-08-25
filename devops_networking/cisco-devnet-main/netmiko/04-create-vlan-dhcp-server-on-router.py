import yaml
from netmiko import ConnectHandler
import logging

def get_devices(role, ip=None):

    with open('devices.yaml', 'r') as yaml_file:
        devices = yaml.load(yaml_file, Loader=yaml.FullLoader)  
        
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

def generate_config(vlan_id, vlan_name, net_address, excluded_address):
    addr = net_address.split(' ') # 0=netaddr, 1=netmask
    config_commands = []

    for ex_addr in excluded_address:
        config_commands.append('ip dhcp excluded-address ' + ex_addr)

    config_commands.extend([
        'int g0/1.' + vlan_id,
        'encapsulation dot1Q ' + vlan_id,
        'ip address ' + addr[0][:-1] + '1 ' + addr[1],
        'ip nat inside',
        'ip dhcp pool ' + vlan_name,
        'network ' + net_address,
        'default-router ' + addr[0][:-1] + '1',
        'dns-server 8.8.8.8 1.1.1.1',
        'lease 0 12'        
    ])
    return config_commands

if __name__ == '__main__':
    # Optional: Enable global logging
    logging.basicConfig(filename='logs/netmiko_global.log', level=logging.DEBUG)
    logger = logging.getLogger('netmiko')

    vlans = {
        'VLAN_GURU': {
            'vlan_id': '10',
            'net_address': '192.168.10.0 255.255.255.0',
            'excluded_address': [
                '192.168.10.1 192.168.10.99',
            ]
        },
        'VLAN_SISWA': {
            'vlan_id': '20',
            'net_address': '192.168.20.0 255.255.255.0',
            'excluded_address': [
                '192.168.20.1'
            ]
        }
    }
    
    config_commands = []
    for vlan_name in vlans:
        vlan = vlans[vlan_name]
        config_commands.extend(generate_config(vlan['vlan_id'], vlan_name, vlan['net_address'], vlan['excluded_address']))
    
    router = get_devices('core', '10.1.1.148')
    ssh_connect = ConnectHandler(**router)
    ssh_connect.enable()
    ssh_connect.send_config_set(config_commands)
    ssh_connect.disconnect()
    print('VLAN and DHCP configured on Core-Router!')
