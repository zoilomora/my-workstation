#!/bin/bash

echo
echo "################################################################"
echo "  Installing Telegram                                           "
echo "################################################################"
echo

if ! location=$(type -p "telegram-desktop"); then
    sudo apt install -y telegram-desktop
fi
