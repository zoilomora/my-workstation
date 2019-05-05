#!/bin/bash

echo
echo "################################################################"
echo "  Installing Ncdu                                               "
echo "################################################################"
echo

if ! location=$(type -p "ncdu"); then
  	sudo apt install -y ncdu
fi
