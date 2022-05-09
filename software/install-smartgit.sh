#!/bin/bash

echo
echo "################################################################"
echo "  Installing SmartGit                                           "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "libcurl4"); then
    sudo apt install -y libcurl4
fi

if ! [ -a "/opt/SmartGit-21.2.2" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo wget https://www.syntevo.com/downloads/smartgit/smartgit-linux-21_2_2.tar.gz
    sudo tar -xzf smartgit-linux-21_2_2.tar.gz
    sudo rm smartgit-linux-21_2_2.tar.gz
    sudo mv smartgit SmartGit-21.2.2

    cd SmartGit-21.2.2
    sudo ./bin/add-menuitem.sh

    cd ${SETUP_DIR}
fi
