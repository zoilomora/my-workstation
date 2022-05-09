#!/bin/bash

echo
echo "################################################################"
echo "  Installing PhpStorm                                           "
echo "################################################################"
echo

if ! [ -a "/opt/PhpStorm-2022.1" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo apt install -y libcanberra-gtk-module

    sudo wget https://download-cdn.jetbrains.com/webide/PhpStorm-2022.1.tar.gz
    sudo tar -xzf PhpStorm-2022.1.tar.gz
    sudo rm PhpStorm-2022.1.tar.gz
    sudo mv PhpStorm-221.5080.224 PhpStorm-2022.1

    sudo tee /usr/share/applications/jetbrains-phpstorm.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=PhpStorm
Icon=/opt/PhpStorm-2022.1/bin/phpstorm.svg
Exec="/opt/PhpStorm-2022.1/bin/phpstorm.sh"
Commet=
Categories=Development;
Terminal=false
EOF

    cd ${SETUP_DIR}
fi
