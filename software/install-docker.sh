#!/bin/bash

echo
echo "################################################################"
echo "  Installing Docker                                             "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "download.docker.com"); then
    wget -qO - https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository -y -u "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable"
fi

if ! location=$(type -p "docker"); then
    sudo apt install -y docker-ce
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
fi

if ! location=$(type -p "docker-compose"); then
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
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
