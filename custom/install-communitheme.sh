#!/bin/bash

echo
echo "################################################################"
echo "  Installing Communitheme                                       "
echo "################################################################"
echo

if ! package=$(snap list | grep "communitheme"); then
    sudo snap install communitheme
fi
