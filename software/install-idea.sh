#!/bin/bash

echo
echo "################################################################"
echo "  Installing IntelliJ IDEA                                      "
echo "################################################################"
echo

if ! [ -a "/opt/ideaIC-2019.3" ]; then
    SETUP_DIR="$(pwd)"
    cd /opt

    sudo apt install -y libcanberra-gtk-module

    sudo wget https://download-cf.jetbrains.com/idea/ideaIC-2019.3.tar.gz
    sudo tar -xzf ideaIC-2019.3.tar.gz
    sudo rm ideaIC-2019.3.tar.gz
    sudo mv idea-IC-193.5233.102 ideaIC-2019.3

    sudo tee /usr/share/applications/jetbrains-idea-ce.desktop << EOF
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=ideaIC
    Icon=/opt/ideaIC-2019.3/bin/idea.svg
    Exec="/opt/ideaIC-2019.3/bin/idea.sh"
    StartupWMClass=jetbrains-idea-ce
    Commet=
    Categories=Development;
    Terminal=false
EOF

    cd ${SETUP_DIR}
fi
