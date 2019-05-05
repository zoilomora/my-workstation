#!/bin/bash

echo
echo "################################################################"
echo "  Installing Htop                                               "
echo "################################################################"
echo

if ! location=$(type -p "htop"); then
  	sudo apt install -y htop
fi
