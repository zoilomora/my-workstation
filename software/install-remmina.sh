#!/bin/bash

echo
echo "################################################################"
echo "  Installing Remmina                                            "
echo "################################################################"
echo

if ! location=$(type -p "remmina"); then
    sudo apt install -y remmina
fi
