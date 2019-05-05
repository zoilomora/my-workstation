#!/bin/bash

echo
echo "################################################################"
echo "  Installing GNOME Applications                                 "
echo "################################################################"
echo

if ! location=$(type -p "gnome-calculator"); then
  	sudo apt install -y gnome-calculator
fi

if ! package=$(dpkg-query --list | grep "gnome-tweak-tool"); then
    sudo apt install -y gnome-tweak-tool
fi
