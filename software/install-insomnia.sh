#!/bin/bash

echo
echo "################################################################"
echo "  Installing Insomnia                                           "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "dl.bintray.com/getinsomnia/Insomnia"); then
    wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
    sudo add-apt-repository -y -u "deb https://dl.bintray.com/getinsomnia/Insomnia /"
fi

if ! location=$(type -p "insomnia"); then
    sudo apt install -y insomnia
fi
