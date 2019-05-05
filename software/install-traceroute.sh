#!/bin/bash

echo
echo "################################################################"
echo "  Installing Traceroute                                         "
echo "################################################################"
echo

if ! location=$(type -p "traceroute"); then
  	sudo apt install -y traceroute
fi
