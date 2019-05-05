#!/bin/bash

echo
echo "################################################################"
echo "  Installing Slack                                              "
echo "################################################################"
echo

if ! location=$(type -p "slack"); then
  	sudo snap install slack --classic
fi
