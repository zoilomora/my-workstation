#!/bin/bash

echo
echo "################################################################"
echo "  Installing WinBox                                             "
echo "################################################################"
echo

if ! location=$(type -p "winbox"); then
    SETUP_DIR="$(pwd)"
    cd /tmp

    wget https://github.com/mriza/winbox-installer/archive/master.zip
    unzip master.zip
    cd winbox-installer-master
    sudo ./winbox-setup install

    cd ${SETUP_DIR}
    rm -rf /tmp/winbox-installer-master
fi
