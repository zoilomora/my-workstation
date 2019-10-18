#!/bin/bash

echo
echo "################################################################"
echo "  Installing Spotify                                            "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "repository.spotify.com"); then
    wget -qO - https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    sudo add-apt-repository -y -u "deb http://repository.spotify.com stable non-free"
fi

if ! location=$(type -p "spotify-client"); then
    sudo apt install spotify-client
fi
