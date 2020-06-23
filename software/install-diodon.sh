#!/bin/bash

echo
echo "################################################################"
echo "  Installing Diodon                                             "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "ppa:diodon-team/stable"); then
    sudo add-apt-repository -y -u ppa:diodon-team/stable
fi

if ! location=$(type -p "diodon"); then
    sudo apt install -y diodon
fi
