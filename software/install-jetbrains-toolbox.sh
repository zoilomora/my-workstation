#!/bin/bash

echo
echo "################################################################"
echo "  Installing Jetbrains Toolbox                                  "
echo "################################################################"
echo

if ! [ -a "/opt/jetbrains-toolbox" ]; then
    curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash
fi
