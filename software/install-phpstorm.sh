#!/bin/bash

echo
echo "################################################################"
echo "  Installing PhpStorm                                           "
echo "################################################################"
echo

if ! [ -a "/opt/PhpStorm-2019.3.4" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo apt install -y libcanberra-gtk-module

    sudo wget https://download-cf.jetbrains.com/webide/PhpStorm-2019.3.4.tar.gz
    sudo tar -xzf PhpStorm-2019.3.4.tar.gz
    sudo rm PhpStorm-2019.3.4.tar.gz
    sudo mv PhpStorm-193.6911.26 PhpStorm-2019.3.4

    sudo tee /usr/share/applications/jetbrains-phpstorm.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=PhpStorm
Icon=/opt/PhpStorm-2019.3.4/bin/phpstorm.svg
Exec="/opt/PhpStorm-2019.3.4/bin/phpstorm.sh"
Commet=
Categories=Development;
Terminal=false
EOF

    cd ${SETUP_DIR}
fi
