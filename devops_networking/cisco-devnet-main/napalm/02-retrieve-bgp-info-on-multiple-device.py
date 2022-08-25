import json
from napalm import get_network_driver

routers = [
    '10.1.1.91', 
    '10.1.1.92'
]
for ip in routers:
    driver = get_network_driver('ios')
    args = {'secret':'cisco'}
    router = driver(ip, 'cisco', 'devnet', timeout=60, optional_args=args)

    router.open()
    print('Connecting to ' + ip)

    bgp_neighbors = router.get_bgp_neighbors_detail()
    router.close()
    print('BGP Information is Ready.')

    print(json.dumps(bgp_neighbors, indent=4))
