#!/bin/bash

echo
echo "################################################################"
echo "  Installing Insomnia                                           "
echo "################################################################"
echo

if ! location=$(type -p "insomnia"); then
    sudo snap install insomnia
fi
