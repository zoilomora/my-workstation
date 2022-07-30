#!/bin/bash

echo
echo "################################################################"
echo "  Installing Neofetch                                        "
echo "################################################################"
echo

if ! location=$(type -p "neofetch"); then
  	sudo apt install -y neofetch
fi
