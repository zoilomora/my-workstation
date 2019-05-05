#!/bin/bash

echo
echo "################################################################"
echo "  Installing Docker                                             "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "download.docker.com"); then
    wget -qO - https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository -y -u "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
fi

if ! location=$(type -p "docker"); then
    sudo apt install -y docker-ce
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
fi

if ! location=$(type -p "docker-compose"); then
    sudo apt install -y docker-compose
fi
