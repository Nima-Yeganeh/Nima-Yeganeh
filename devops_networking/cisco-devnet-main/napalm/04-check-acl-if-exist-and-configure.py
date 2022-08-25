import json
from napalm import get_network_driver

device_ip = '10.1.1.91'
driver = get_network_driver('ios')
args = {'secret':'cisco'}
router = driver(device_ip, 'cisco', 'devnet', timeout=60, optional_args=args)
router.open()

print ('Connected to ' + device_ip)
router.load_merge_candidate(filename='secure-2222.cfg')

diffs = router.compare_config()
if len(diffs) > 0:
    print(diffs)
    router.commit_config()
    print ('Configured!')
else:
    router.discard_config()
    print('No changes required.')

router.close()