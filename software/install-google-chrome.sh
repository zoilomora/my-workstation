#!/bin/bash

echo
echo "################################################################"
echo "  Installing Google Chrome                                      "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "dl.google.com"); then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /etc/apt/keyrings/google-chrome.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null
    sudo apt update
fi

if ! location=$(type -p "google-chrome-stable"); then
    sudo apt install -y google-chrome-stable
fi
