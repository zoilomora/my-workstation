#!/bin/bash

echo
echo "################################################################"
echo "  Installing GParted                                            "
echo "################################################################"
echo

if ! location=$(type -p "gparted"); then
  	sudo apt install -y gparted
fi
