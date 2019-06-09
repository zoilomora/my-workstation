#!/bin/bash

echo
echo "################################################################"
echo "  Installing GitKraken                                           "
echo "################################################################"
echo

if ! [ -a "/usr/share/gitkraken" ]; then
    sudo apt install -y gconf2

    wget -O /tmp/gitkraken-amd64.deb https://release.axocdn.com/linux/gitkraken-amd64.deb
    sudo dpkg -i /tmp/gitkraken-amd64.deb
    rm /tmp/gitkraken-amd64.deb
fi
