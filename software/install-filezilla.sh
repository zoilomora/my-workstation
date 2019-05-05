#!/bin/bash

echo
echo "################################################################"
echo "  Installing FileZilla                                          "
echo "################################################################"
echo

if ! location=$(type -p "filezilla"); then
  	sudo apt install -y filezilla
fi
