#!/bin/bash

echo
echo "################################################################"
echo "  Installing Psensor                                            "
echo "################################################################"
echo

if ! location=$(type -p "psensor"); then
    sudo apt install -y \
        lm-sensors \
        psensor

    (while :; do echo ""; done) | sudo sensors-detect
fi
