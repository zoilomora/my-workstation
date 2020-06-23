#!/bin/bash

echo
echo "################################################################"
echo "  Installing DataGrip                                           "
echo "################################################################"
echo

if ! [ -a "/opt/DataGrip-2020.1.4" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo apt install -y libcanberra-gtk-module

    sudo wget https://download-cf.jetbrains.com/datagrip/datagrip-2020.1.4.tar.gz
    sudo tar -xzf datagrip-2020.1.4.tar.gz
    sudo rm datagrip-2020.1.4.tar.gz

    sudo tee /usr/share/applications/jetbrains-datagrip.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=DataGrip
Icon=/opt/DataGrip-2020.1.4/bin/datagrip.svg
Exec="/opt/DataGrip-2020.1.4/bin/datagrip.sh"
Commet=
Categories=Development;
Terminal=false
EOF

    cd ${SETUP_DIR}
fi
