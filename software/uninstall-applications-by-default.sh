#!/bin/bash

echo
echo "################################################################"
echo "  Uninstalling Applications by Default                          "
echo "################################################################"
echo

sudo apt remove -y \
    gnome-calendar \
    gnome-mines \
    gnome-mahjongg \
    gnome-sudoku \
    aisleriot \
    simple-scan \
    rhythmbox \
    totem \
    cheese \
    shotwell \
    gnome-todo

sudo snap remove \
    gnome-calculator \
    remmina
