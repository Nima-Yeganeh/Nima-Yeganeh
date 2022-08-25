import json
from napalm import get_network_driver
driver = get_network_driver('ios')
args = {"secret": "cisco"}
router = driver('10.1.1.92', 'cisco', 'devnet', timeout=60, optional_args=args)
router.open()

info = router.get_interfaces()
print (json.dumps(info, indent=4))

router.close()
