#!/bin/bash

echo
echo "################################################################"
echo "  Installing Oracle VM VirtualBox                               "
echo "################################################################"
echo

if [[ ! $(dpkg-query --list | grep -o "libvpx5") ]]; then
    wget -O /tmp/libvpx5_1.7.0-3_amd64.deb http://es.archive.ubuntu.com/ubuntu/pool/main/libv/libvpx/libvpx5_1.7.0-3_amd64.deb
    sudo dpkg -i /tmp/libvpx5_1.7.0-3_amd64.deb
    rm /tmp/libvpx5_1.7.0-3_amd64.deb
fi

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "download.virtualbox.org"); then
    wget -qO - https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
    sudo add-apt-repository -y -u "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
fi

if ! location=$(type -p "virtualbox"); then
    sudo apt install -y virtualbox-6.0
fi
