#!/bin/bash

echo
echo "################################################################"
echo "  Installing AnyDesk                                            "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "deb.anydesk.com"); then
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
    sudo add-apt-repository -y -u "deb http://deb.anydesk.com/ all main"
fi

if ! location=$(type -p "anydesk"); then
    sudo apt install -y anydesk
fi
