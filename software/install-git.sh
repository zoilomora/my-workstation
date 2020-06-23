#!/bin/bash

echo
echo "################################################################"
echo "  Installing Git                                                "
echo "################################################################"
echo

if ! location=$(type -p "git"); then
  	sudo apt install -y git
fi
