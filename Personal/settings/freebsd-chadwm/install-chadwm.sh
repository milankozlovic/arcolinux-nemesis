#!/bin/bash
# set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Installing Chadwm"
echo "################################################################"
tput sgr0
echo

# https://sysadminsage.com/ubuntu-remove-a-package/

echo
tput setaf 1
echo "################################################################"
echo "################### This will remove the Ubuntu desktop"
echo "################### The following packages will be removed:"
echo "################### - ubuntu-desktop-minimal"
echo "################### - ubuntu-session-xsession"
echo "################### - ubuntu-session"
echo "################### - xdg-desktop-portal-gnome"
echo "################################################################"
tput sgr0
echo

echo
tput setaf 2
echo "################################################################"
echo "###### Installing packages"
echo "################################################################"
tput sgr0
echo

# getting dependencies to be able to build Chadwm
sudo pkg install -y build-essential
sudo pkg install -y fonts-font-awesome
sudo pkg install -y libimlib2-dev
sudo pkg install -y libx11-dev
sudo pkg install -y libxft-dev
sudo pkg install -y libxinerama-dev

# applications to be used in Chadwm
sudo pkg install -y alacritty
sudo pkg install -y picom
sudo pkg install -y playerctl
sudo pkg install -y policykit-1-gnome
sudo pkg install -y pulsemixer
sudo pkg install -y rofi
sudo pkg install -y sxhkd
# next item is dmenu
sudo pkg install -y suckless-tools
sudo pkg install -y thunar
sudo pkg install -y thunar-archive-plugin
sudo pkg install -y thunar-volman

# exit strategy - super + shift + x
git clone https://github.com/arcolinux/arcolinux-powermenu  /tmp/arcolinux-powermenu
sudo cp /tmp/arcolinux-powermenu/usr/local/bin/arcolinux-powermenu /usr/local/bin
cp -r /tmp/arcolinux-powermenu/etc/skel/.bin ~
cp -r /tmp/arcolinux-powermenu/etc/skel/.config ~

# getting the official code from ArcoLinux
git clone https://github.com/arcolinux/arcolinux-chadwm  /tmp/arcolinux-chadwm
sudo cp /tmp/arcolinux-chadwm/usr/bin/exec-chadwm /usr/bin
sudo cp /tmp/arcolinux-chadwm/usr/share/xsessions/chadwm.desktop /usr/share/xsessions
cp -r /tmp/arcolinux-chadwm/etc/skel/.bin ~
cp -r /tmp/arcolinux-chadwm/etc/skel/.config ~

# overwriting the official code from ArcoLinux with my own
cp run.sh  ~/.config/arco-chadwm/scripts
cp picom.conf  ~/.config/arco-chadwm/picom
cp config.def.h ~/.config/arco-chadwm/chadwm
cp sxhkdrc  ~/.config/arco-chadwm/sxhkd
cp bar.sh ~/.config/arco-chadwm/scripts
[ -d $HOME"/.config/Thunar" ] || mkdir -p $HOME"/.config/Thunar"
cp uca.xml ~/.config/Thunar/

# building Chadwm
if [ ! -f /usr/local/bin/chadwm ] ; then
	cd ~/.config/arco-chadwm/chadwm
	sudo make install
fi

echo
tput setaf 6
echo "################################################################"
echo "###### Chadwm is installed - reboot"
echo "################################################################"
tput sgr0
echo