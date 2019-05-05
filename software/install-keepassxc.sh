#!/bin/bash

echo
echo "################################################################"
echo "  Installing KeePassXC                                          "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "phoerious/keepassxc"); then
    sudo add-apt-repository -y -u ppa:phoerious/keepassxc
fi

if ! location=$(type -p "keepassxc"); then
  	sudo apt install -y keepassxc
fi
