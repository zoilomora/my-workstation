#!/bin/bash

echo
echo "################################################################"
echo "  Installing Google Chrome                                      "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "dl.google.com"); then
    wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo add-apt-repository -y -r "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
    sudo add-apt-repository -y -u "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"
fi

if ! location=$(type -p "google-chrome-stable"); then
    sudo apt install -y google-chrome-stable
fi
