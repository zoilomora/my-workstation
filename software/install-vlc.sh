#!/bin/bash

echo
echo "################################################################"
echo "  Installing VLC media player                                   "
echo "################################################################"
echo

if ! location=$(type -p "vlc"); then
  	sudo apt install -y vlc
fi
