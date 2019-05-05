#!/bin/bash

echo
echo "################################################################"
echo "  Installing VLC media player                                   "
echo "################################################################"
echo

if ! location=$(type -p "vlc"); then
  	sudo snap install vlc
fi
