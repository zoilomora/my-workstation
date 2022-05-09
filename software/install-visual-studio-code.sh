#!/bin/bash

echo
echo "################################################################"
echo "  Installing Visual Studio Code                                 "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "packages.microsoft.com"); then
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/vscode-archive-keyring.gpg
    echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
fi

if ! location=$(type -p "code"); then
    sudo apt install -y code
fi
