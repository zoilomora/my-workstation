#!/bin/bash

echo
echo "################################################################"
echo "  Installing SmartGit                                           "
echo "################################################################"
echo

if ! [ -a "/usr/share/smartgit" ]; then
    wget -O /tmp/smartgit-19_1_4.deb https://www.syntevo.com/downloads/smartgit/smartgit-19_1_4.deb
    sudo dpkg -i /tmp/smartgit-19_1_4.deb
    rm /tmp/smartgit-19_1_4.deb
fi
