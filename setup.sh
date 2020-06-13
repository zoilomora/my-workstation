#!/bin/bash

# Fail immediately if any errors occur
set -e

echo
echo "################################################################"
echo "  Setup Workstation                                             "
echo "################################################################"
echo

echo "Caching [sudo] password..."
sudo -K
sudo true;

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt full-upgrade -y

echo
echo "################################################################"
echo "  Installing requirements for repositories                      "
echo "################################################################"
echo

# Required to add repositories
sudo apt install -y \
    ca-certificates \
    apt-transport-https \
    software-properties-common

# Software installation
./software/uninstall-applications-by-default.sh
./software/install-ubuntu-restricted-extras.sh
./software/install-gnome-applications.sh
./software/install-file-systems.sh
./software/install-net-tools.sh
./software/install-traceroute.sh
./software/install-curl.sh
./software/install-unrar.sh
./software/install-htop.sh
./software/install-ncdu.sh
./software/install-screenfetch.sh
./software/install-gparted.sh
./software/install-sensors.sh
./software/install-remmina.sh
./software/install-keepassxc.sh
./software/install-docker.sh
./software/install-google-chrome.sh
./software/install-filezilla.sh
./software/install-visual-studio-code.sh
./software/install-vlc.sh
./software/install-xfburn.sh
./software/install-youtube-dl.sh
./software/install-mediainfo-gui.sh
./software/install-git.sh
./software/install-smartgit.sh
./software/install-winbox.sh
./software/install-telegram.sh
./software/install-slack.sh
./software/install-phpstorm.sh
./software/install-datagrip.sh
./software/install-mongodb-compass.sh
./software/install-redis-desktop-manager.sh
./software/install-insomnia.sh
./software/install-virtualbox.sh
./software/install-anydesk.sh
./software/install-camunda.sh
./software/install-zsh.sh

# Personalization
./custom/gtile-gnome-shell-extension.sh
./custom/gsettings-modifications.sh

echo
echo "################################################################"
echo "  Updating the system                                           "
echo "################################################################"
echo

# Upgrade
sudo apt update
sudo apt --fix-broken install
sudo apt upgrade -y
sudo apt autoremove -y
