#!/bin/bash

echo
echo "################################################################"
echo "  Installing Screenfetch                                        "
echo "################################################################"
echo

if ! location=$(type -p "screenfetch"); then
  	sudo apt install -y screenfetch
fi
