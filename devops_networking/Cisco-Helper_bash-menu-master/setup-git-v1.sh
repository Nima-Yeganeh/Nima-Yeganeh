#!/bin/bash
#Created by Eric Dubois

set -e
##################################################################################################################
# Author 	: 	Bluscrn
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
# change into your name and email.

git init
git config --global user.name "Bluscrn"
git config --global user.email "server.brandon.glenn3@gmail.com"
sudo git config --system core.editor subl
# git config --global credential.helper cache
# git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple


echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"