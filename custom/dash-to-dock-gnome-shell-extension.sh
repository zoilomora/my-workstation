#!/bin/bash

echo
echo "################################################################"
echo "  Installing Dash to Dock GNOME Shell Extension                 "
echo "################################################################"
echo

DASHTODOCK_UUID="dash-to-dock@micxgx.gmail.com"
DASHTODOCK_VERSION="69"

if ! [ -a "~/.local/share/gnome-shell/extensions/$GTILE_UUID" ]; then
    wget -O /tmp/dash-to-dockmicxgx.gmail.com.v$DASHTODOCK_VERSION.shell-extension.zip https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v$DASHTODOCK_VERSION.shell-extension.zip
    mkdir -p ~/.local/share/gnome-shell/extensions/$DASHTODOCK_UUID
    unzip -q /tmp/dash-to-dockmicxgx.gmail.com.v$DASHTODOCK_VERSION.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/$DASHTODOCK_UUID
    rm /tmp/dash-to-dockmicxgx.gmail.com.v$DASHTODOCK_VERSION.shell-extension.zip
    # gnome-extensions enable $DASHTODOCK_UUID
fi
