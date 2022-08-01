#!/bin/bash

sudo apt install -y \
    python3-pip \
    libgtk-3-dev \
    sassc \
    ninja-build

sudo pip3 install -y \
    meson

cd /tmp

wget https://github.com/ubuntu/yaru/archive/refs/tags/22.04.4.tar.gz
tar -xzf 22.04.4.tar.gz
rm 22.04.4.tar.gz

cd yaru-22.04.4
meson build

cd build
sudo ninja install

sudo pip3 uninstall -y meson
sudo apt remove --purge -y \
    libgtk-3-dev \
    sassc \
    ninja-build

sudo apt autoremove

# https://www.gnome-look.org/p/1252100/
# sudo cp -R Yaru-light /usr/share/themes
