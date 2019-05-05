#!/bin/bash

echo
echo "################################################################"
echo "  Installing Telegram                                           "
echo "################################################################"
echo

if ! location=$(type -p "telegram-desktop"); then
  	sudo snap install telegram-desktop
fi
