#!/bin/bash

echo
echo "################################################################"
echo "  Installing WinBox                                             "
echo "################################################################"
echo

if ! location=$(type -p "winbox"); then
    SETUP_DIR="$(pwd)"
    cd /tmp

    git clone https://github.com/mriza/winbox-installer.git
    cd winbox-installer
    sudo ./winbox-setup install

    cd ${SETUP_DIR}
fi
