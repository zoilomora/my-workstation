#!/bin/bash

echo
echo "################################################################"
echo "  Installing GNOME Applications                                 "
echo "################################################################"
echo

if ! location=$(type -p "gnome-calculator"); then
  	sudo apt install -y gnome-calculator
fi

if ! package=$(dpkg-query --list | grep "gnome-tweaks"); then
    sudo apt install -y gnome-tweaks
fi
