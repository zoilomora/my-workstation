#!/bin/bash

echo
echo "################################################################"
echo "  s   Installing ttf-mscorefont                                 "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "ttf-mscorefonts-installer"); then
    sudo apt install -y ttf-mscorefonts-installer
fi
