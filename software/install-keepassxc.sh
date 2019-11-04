#!/bin/bash

echo
echo "################################################################"
echo "  Installing KeePassXC                                          "
echo "################################################################"
echo

if ! location=$(type -p "keepassxc"); then
    sudo snap install keepassxc
fi
