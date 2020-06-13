#!/bin/bash

echo
echo "################################################################"
echo "  Installing SmartGit                                           "
echo "################################################################"
echo

if ! [ -a "/usr/share/smartgit" ]; then
    wget -O /tmp/smartgit-20_1_2.deb https://www.syntevo.com/downloads/smartgit/smartgit-20_1_2.deb

    sudo dpkg -i /tmp/smartgit-20_1_2.deb
    rm /tmp/smartgit-20_1_2.deb
fi
