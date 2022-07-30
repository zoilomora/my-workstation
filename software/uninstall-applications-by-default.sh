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

# Apps
sudo apt remove -y \
    cheese \
    evolution \
    libreoffice-calc \
    libreoffice-draw \
    libreoffice-impress \
    libreoffice-writer \
    malcontent \
    rhythmbox \
    shotwell \
    totem \
    transmission-gtk

# Games
sudo apt remove -y \
    five-or-more \
    four-in-a-row \
    hitori \
    iagno \
    lightsoff \
    quadrapassel \
    swell-foop \
    tali
