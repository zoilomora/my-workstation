#!/bin/bash

echo
echo "################################################################"
echo "  Installing OpenVPN                                            "
echo "################################################################"
echo

repositories=$(grep ^[^#] /etc/apt/sources.list /etc/apt/sources.list.d/*)
if ! repository=$(echo "$repositories" | grep "build.openvpn.net"); then
    wget -qO - https://swupdate.openvpn.net/repos/repo-public.gpg | sudo apt-key add -
    sudo add-apt-repository -y -u "deb http://build.openvpn.net/debian/openvpn/release/2.3 stretch main"
fi

if ! package=$(dpkg-query --list | grep "libssl1.0.2"); then
    wget http://ftp.us.debian.org/debian/pool/main/o/openssl1.0/libssl1.0.2_1.0.2r-1~deb9u1_amd64.deb
    sudo dpkg -i libssl1.0.2_1.0.2r-1~deb9u1_amd64.deb
    rm libssl1.0.2_1.0.2r-1~deb9u1_amd64.deb
fi

if ! package=$(dpkg-query --list | grep "openvpn"); then
    sudo apt install -y \
        openvpn=2.3.18-stretch0 \
        network-manager-openvpn \
        network-manager-openvpn-gnome

    sudo apt-mark hold openvpn
fi
