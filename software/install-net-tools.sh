#!/bin/bash

echo
echo "################################################################"
echo "  Installing net-tools                                          "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "net-tools"); then
    sudo apt install -y net-tools
fi
