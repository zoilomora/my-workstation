#!/bin/bash

echo
echo "################################################################"
echo "  Uninstalling Applications by Default                          "
echo "################################################################"
echo

# Gnome
sudo apt remove -y \
    gnome-2048 \
    gnome-calendar \
    gnome-chess \
    gnome-clocks \
    gnome-contacts \
    gnome-documents \
    gnome-klotski \
    gnome-mahjongg \
    gnome-maps \
    gnome-mines \
    gnome-music \
    gnome-nibbles \
    gnome-robots \
    gnome-sudoku \
    gnome-taquin \
    gnome-tetravex \
    gnome-todo \
    gnome-weather

# LibreOffice
sudo apt remove --purge -y libreoffice*

# Apps
sudo apt remove -y \
    cheese \
    evolution \
#    malcontent \
    rhythmbox \
    shotwell \
    totem \
    transmission-gtk

# Games
sudo apt remove -y \
    aisleriot \
    five-or-more \
    four-in-a-row \
    hitori \
    iagno \
    lightsoff \
    quadrapassel \
    swell-foop \
    tali
