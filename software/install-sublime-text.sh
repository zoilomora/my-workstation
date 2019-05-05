#!/bin/bash

echo
echo "################################################################"
echo "  Installing Sublime Text                                       "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "download.sublimetext.com"); then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo add-apt-repository -y -u "deb https://download.sublimetext.com/ apt/stable/"
fi

if ! [ -a "/opt/sublime_text" ]; then
    sudo apt install -y sublime-text
fi
