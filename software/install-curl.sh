#!/bin/bash

echo
echo "################################################################"
echo "  Installing cURL                                               "
echo "################################################################"
echo

if ! location=$(type -p "curl"); then
  	sudo apt install -y curl
fi
