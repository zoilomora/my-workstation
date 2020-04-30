#!/bin/bash

echo
echo "################################################################"
echo "  Installing MongoDB Compass                                    "
echo "################################################################"
echo

if ! location=$(type -p "mongodb-compass"); then
    sudo apt install -y libgconf-2-4

    wget -O /tmp/mongodb-compass_1.21.0_amd64.deb https://downloads.mongodb.com/compass/mongodb-compass_1.21.0_amd64.deb
    sudo dpkg -i /tmp/mongodb-compass_1.21.0_amd64.deb
    rm /tmp/mongodb-compass_1.21.0_amd64.deb
fi
