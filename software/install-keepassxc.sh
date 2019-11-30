#!/bin/bash

echo
echo "################################################################"
echo "  Installing KeePassXC                                          "
echo "################################################################"
echo

# https://zoilomora.net/2019/11/08/algunas-aplicaciones-en-ubuntu-19_10-tardan-mucho-en-abrir/
if ! package=$(dpkg-query --list | grep "appmenu-gtk2-module"); then
    sudo apt install -y appmenu-gtk2-module
fi

if ! location=$(type -p "keepassxc"); then
    sudo snap install keepassxc
fi
