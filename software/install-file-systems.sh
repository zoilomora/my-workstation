#!/bin/bash

echo
echo "################################################################"
echo "  Installing File Systems                                       "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "exfat-fuse"); then
    sudo apt install -y exfat-fuse
fi

if ! package=$(dpkg-query --list | grep "exfat-utils"); then
    sudo apt install -y exfat-utils
fi

if ! package=$(dpkg-query --list | grep "ntfs-3g"); then
    sudo apt install -y ntfs-3g
fi
