#!/bin/bash

echo
echo "################################################################"
echo "  Installing AnyDesk                                            "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "deb.anydesk.com"); then
    curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo gpg --dearmor -o /usr/share/keyrings/anydesk-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/anydesk-archive-keyring.gpg] http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk.list > /dev/null
    sudo apt update
fi

if ! location=$(type -p "anydesk"); then
    sudo apt install -y anydesk
fi
