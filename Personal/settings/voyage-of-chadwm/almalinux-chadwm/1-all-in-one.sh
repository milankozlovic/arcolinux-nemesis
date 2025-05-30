#!/bin/bash
#set -e
##################################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Youtube   : https://youtube.com/erikdubois
##################################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################################

echo
tput setaf 2
echo "########################################################################"
echo "################### All in one for Almalinux"
echo "########################################################################"
tput sgr0
echo

sudo dnf upgrade -y

./install-chadwm.sh
./install-apps-install.sh
./install-design.sh
./personal-configs.sh

sudo dnf update -y
sudo dnf upgrade -y
sudo dnf autoremove -y

# building Chadwm
cd ~/.config/arco-chadwm/chadwm
sudo make install

echo
tput setaf 6
echo "########################################################################"
echo "###### All in one done"
echo "###### Insync download from HQ - sudo apt install ..."
echo "########################################################################"
tput sgr0
echo
