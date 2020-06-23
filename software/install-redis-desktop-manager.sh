#!/bin/bash

echo
echo "################################################################"
echo "  Installing Redis Desktop Manager                              "
echo "################################################################"
echo

if ! location=$(type -p "redis-desktop-manager.rdm"); then
    sudo snap install redis-desktop-manager
fi
