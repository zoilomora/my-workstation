#!/usr/bin/env bash

set -e

# Icons on the desktop <- Disabled
gsettings set org.gnome.desktop.background show-desktop-icons false

# Date in the top bar <- Activated
gsettings set org.gnome.desktop.interface clock-show-date true

# Paste by clicking on the mouse's central button <- Disabled
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# Natural movement of the mouse <- Activated
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# Energy saving - Turn off screen <- Never
gsettings set org.gnome.desktop.session idle-delay 0

# Sounds for events <- Activated
gsettings set org.gnome.desktop.sound event-sounds true

# Action when pressing in the central part of a window <- None
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'

# Position of window buttons <- macOS
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

# Night mode <- Activated
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Night mode at sunrise and sunset <- Activated
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true
