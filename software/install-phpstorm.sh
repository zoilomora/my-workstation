#!/bin/bash

echo
echo "################################################################"
echo "  Installing PhpStorm                                           "
echo "################################################################"
echo

if ! [ -a "/opt/PhpStorm-2020.1.2" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo apt install -y libcanberra-gtk-module

    sudo wget https://download-cf.jetbrains.com/webide/PhpStorm-2020.1.2.tar.gz
    sudo tar -xzf PhpStorm-2020.1.2.tar.gz
    sudo rm PhpStorm-2020.1.2.tar.gz
    sudo mv PhpStorm-201.7846.90 PhpStorm-2020.1.2

    sudo tee /usr/share/applications/jetbrains-phpstorm.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=PhpStorm
Icon=/opt/PhpStorm-2020.1.2/bin/phpstorm.svg
Exec="/opt/PhpStorm-2020.1.2/bin/phpstorm.sh"
Commet=
Categories=Development;
Terminal=false
EOF

    cd ${SETUP_DIR}
fi
