#!/bin/bash

echo
echo "################################################################"
echo "  Installing Remmina                                            "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "remmina-ppa-team/remmina-next"); then
    sudo add-apt-repository -y -u ppa:remmina-ppa-team/remmina-next
fi

if ! location=$(type -p "remmina"); then
    sudo apt install -y \
        remmina \
        libfreerdp-plugins-standard \
        remmina-plugin-secret \
        remmina-plugin-vnc \
        remmina-plugin-exec \
        remmina-plugin-nx \
        remmina-plugin-spice \
        remmina-plugin-telepathy \
        remmina-plugin-xdmcp
fi
