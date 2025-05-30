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
echo "###### Installing packages with dnf install"
echo "########################################################################"
tput sgr0
echo

sudo dnf install -y arandr
sudo dnf install -y arc-kde-kvantum
sudo dnf install -y bat
sudo dnf install -y btop
sudo dnf install -y catfish
sudo dnf install -y chromium
sudo dnf install -y curl
sudo dnf install -y dconf-editor
sudo dnf install -y duf
sudo dnf install -y fastfetch
sudo dnf install -y file-roller
sudo dnf install -y flameshot
sudo dnf install -y flatpak
sudo dnf install -y google-roboto-fonts
sudo dnf install -y galculator
sudo dnf install -y gimp
sudo dnf install -y hardinfo2
sudo dnf install -y hw-probe
sudo dnf install -y i3lock
sudo dnf install -y inkscape
sudo dnf install -y kvantum-qt5
sudo dnf install -y lollypop
sudo dnf install -y lxappearance
sudo dnf install -y meld
sudo dnf install -y most
sudo dnf install -y nitrogen
sudo dnf install -y numlockx
sudo dnf install -y obs-studio
sudo dnf install -y pavucontrol
sudo dnf install -y pylint
sudo dnf install -y qbittorrent
sudo dnf install -y ripgrep
sudo dnf install -y scrot
sudo dnf install -y simplescreenrecorder
sudo dnf install -y speedtest-cli
sudo dnf install -y system-config-printer
sudo dnf install -y variety
sudo dnf install -y vlc
sudo dnf install -y xfce4-screenshooter

# getting design from ArcoLinux
folder="/tmp/arcolinux-btop"
if [ -d "$folder" ]; then
    sudo rm -r "$folder"
fi
git clone https://github.com/arcolinux/arcolinux-btop /tmp/arcolinux-btop
cp -r /tmp/arcolinux-btop/etc/skel/.config ~

# getting config for Alacritty - transparency
folder="/tmp/arcolinux-alacritty"
if [ -d "$folder" ]; then
    sudo rm -r "$folder"
fi
git clone https://github.com/arcolinux/arcolinux-alacritty /tmp/arcolinux-alacritty
cp -r /tmp/arcolinux-alacritty/etc/skel/.config ~

# script to change wallpaper on Chadwm
folder="/tmp/arcolinux-variety"
if [ -d "$folder" ]; then
    sudo rm -r "$folder"
fi
git clone https://github.com/arcolinux/arcolinux-variety /tmp/arcolinux-variety
cp -r /tmp/arcolinux-variety/etc/skel/.config ~

echo
echo "Installing sublime text"
echo
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf install sublime-text -y

echo
echo "Installing Virtualbox"
echo

sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
sudo dnf install -y VirtualBox-7.1

echo "###################################################################################"
echo "##      Removing all the messages virtualbox produces         ##"
echo "###################################################################################"
VBoxManage setextradata global GUI/SuppressMessages "all"

echo
tput setaf 6
echo "########################################################################"
echo "###### Packages via dnf done"
echo "########################################################################"
tput sgr0
echo
