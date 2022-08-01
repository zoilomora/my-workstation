#!/bin/bash

echo
echo "################################################################"
echo "  Installing Postman                                            "
echo "################################################################"
echo

if ! [ -a "/opt/Postman" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo curl -fsSL -o postman-linux-x64.tar.gz https://dl.pstmn.io/download/latest/linux64/
    sudo tar -xzf postman-linux-x64.tar.gz
    sudo rm postman-linux-x64.tar.gz
    sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

    sudo tee /usr/share/applications/postman.desktop << EOF
[Desktop Entry]
Type=Application
Name=Postman REST Client
Icon=/opt/Postman/app/resources/app/assets/icon.png
Exec="/opt/Postman/Postman"
Comment=Postman REST Client Desktop App
Categories=Development;Code;Testing;
EOF

    cd ${SETUP_DIR}
fi
