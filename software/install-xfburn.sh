#!/bin/bash

echo
echo "################################################################"
echo "  Installing XFBurn                                             "
echo "################################################################"
echo

if ! location=$(type -p "xfburn"); then
  	sudo apt install -y xfburn
fi
