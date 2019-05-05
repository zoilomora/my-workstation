#!/bin/bash

echo
echo "################################################################"
echo "  Installing UnRAR                                              "
echo "################################################################"
echo

if ! location=$(type -p "unrar"); then
  	sudo apt install -y unrar
fi
