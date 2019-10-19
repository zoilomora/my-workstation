#!/bin/bash

echo
echo "################################################################"
echo "  Installing Oracle VM VirtualBox                               "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "download.virtualbox.org"); then
    wget -qO - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
    #sudo add-apt-repository -y -u "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
    sudo add-apt-repository -y -u "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian disco contrib"
fi

if ! location=$(type -p "virtualbox"); then
    sudo apt install -y virtualbox-6.0
fi
