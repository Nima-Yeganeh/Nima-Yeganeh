import json
from napalm import get_network_driver

device_ip = '10.1.1.91'
driver = get_network_driver('ios')
args = {'secret':'cisco'}
router = driver(device_ip, 'cisco', 'devnet', timeout=60, optional_args=args)

print('Connected to ' + device_ip)
router.open()

bgp_neighbors = router.get_bgp_neighbors()
print(json.dumps(bgp_neighbors, indent=4))

router.close()
