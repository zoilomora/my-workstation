#!/bin/bash

echo
echo "################################################################"
echo "  Installing Visual Studio Code                                 "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "packages.microsoft.com"); then
    sudo add-apt-repository -y -u "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
fi

if ! location=$(type -p "code"); then
    sudo apt install code
fi
