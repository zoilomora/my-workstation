#!/bin/bash

echo
echo "################################################################"
echo "  Installing Ubuntu Restricted Extras                           "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "ubuntu-restricted-extras"); then
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
    sudo apt install -y ubuntu-restricted-extras
fi
