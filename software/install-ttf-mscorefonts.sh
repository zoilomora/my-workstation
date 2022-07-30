#!/bin/bash

echo
echo "################################################################"
echo "  Installing ttf-mscorefonts                                    "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "ttf-mscorefonts-installer"); then
    sudo apt install -y ttf-mscorefonts-installer
fi
