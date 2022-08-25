#!/usr/bin/env python

import os

with open(os.popen(os.getcwd()+'/temps/'+ip), 'r') as infile:
    infile.readlines('cat 'os.getcwd()+'/temps/10.47.32.3| grep -A 1 "bvim.lan"')
    print(infile.readlines())
