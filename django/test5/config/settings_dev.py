# start this from runserver command in mode-debug script
import os
try:
    from website1.settings import *
except ImportError:
    pass

DEBUG = True
TEMPLATE_DEBUG = True

print "---------- settings_dev.py has been applied ----------"