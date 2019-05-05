#!/bin/bash

echo
echo "################################################################"
echo "  Installing PhpStorm                                           "
echo "################################################################"
echo

if ! [ -a "/opt/PhpStorm-2019.1.1" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo apt install -y libcanberra-gtk-module

    sudo wget https://download-cf.jetbrains.com/webide/PhpStorm-2019.1.1.tar.gz
    sudo tar -xzvf PhpStorm-2019.1.1.tar.gz
    sudo rm PhpStorm-2019.1.1.tar.gz
    sudo mv PhpStorm-191.6707.66 PhpStorm-2019.1.1

    sudo tee /usr/share/applications/jetbrains-phpstorm.desktop << EOF
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=PhpStorm
    Icon=/opt/PhpStorm-2019.1.1/bin/phpstorm.svg
    Exec="/opt/PhpStorm-2019.1.1/bin/phpstorm.sh"
    Commet=
    Categories=Development;
    Terminal=false
EOF

    cd ${SETUP_DIR}
fi
