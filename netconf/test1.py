# pip install ncclient
# pip3 install ncclient

import logging
from ncclient import manager
import sys

HOST = '192.168.244.101'
PORT = 22
USER = 'cisco'
PASS = 'password'

with manager.connect(host=HOST, port=PORT, username=USER, password=PASS, hostkey_verify=False, device_params={'name': 'iosxr'}, look_for_keys=False, allow_agent=False) as m:
    print('***Here are the Remote Devices Capabilities***')
    for capabilities in m.server_capabilities:
        print(capabilities)
