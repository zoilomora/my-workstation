#!/bin/bash

echo
echo "################################################################"
echo "  Installing gTile GNOME Shell Extension                        "
echo "################################################################"
echo

GTILE_UUID="gTile@vibou"
GTILE_VERSION="34"

if ! [ -a "~/.local/share/gnome-shell/extensions/$GTILE_UUID" ]; then
    wget -O /tmp/gTilevibou.v$GTILE_VERSION.shell-extension.zip https://extensions.gnome.org/extension-data/gTilevibou.v$GTILE_VERSION.shell-extension.zip
    mkdir -p ~/.local/share/gnome-shell/extensions/$GTILE_UUID
    unzip -q /tmp/gTilevibou.v$GTILE_VERSION.shell-extension.zip -d ~/.local/share/gnome-shell/extensions/$GTILE_UUID
    rm /tmp/gTilevibou.v$GTILE_VERSION.shell-extension.zip
    gnome-extensions enable $GTILE_UUID
fi
