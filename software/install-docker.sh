#!/bin/bash

echo
echo "################################################################"
echo "  Installing Docker                                             "
echo "################################################################"
echo

sudo apt install -y ca-certificates curl gnupg lsb-release

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "download.docker.com"); then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
fi

if ! location=$(type -p "docker"); then
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
    sudo usermod -aG docker $USER
fi

# https://zoilomora.net/2019/10/17/cambiar-el-rango-de-red-de-docker/
sudo tee /etc/docker/daemon.json << EOF
{
  "default-address-pools": [
    {
      "base": "10.10.0.0/16",
      "size": 24
    }
  ]
}
EOF
