#!/bin/bash

echo
echo "################################################################"
echo "  Installing MediaInfo GUI                                      "
echo "################################################################"
echo

if ! location=$(type -p "mediainfo-gui"); then
    sudo apt install -y mediainfo-gui
fi
