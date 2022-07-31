#!/bin/bash

echo
echo "################################################################"
echo "  Installing ICE - SSB Manager                                  "
echo "################################################################"
echo

ICE_VERSION="6.0.7"
# ICE_VERSION="5.3.0"

if ! location=$(type -p "ice"); then
    wget -O /tmp/ice_"$ICE_VERSION"_all.deb \
      https://launchpad.net/~peppermintos/+archive/ubuntu/ice-dev/+files/ice_"$ICE_VERSION"_all.deb
    sudo dpkg -i /tmp/ice_"$ICE_VERSION"_all.deb
    rm /tmp/ice_"$ICE_VERSION"_all.deb
fi

if ! location=$(type -p "chromium"); then
  	sudo apt install -y chromium-browser
fi
