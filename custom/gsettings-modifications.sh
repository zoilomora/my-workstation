#!/bin/bash

echo
echo "################################################################"
echo "  GSettings Modifications                                       "
echo "################################################################"
echo

# Icons on the desktop <- Disabled
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# Date in the top bar <- Activated
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Paste by clicking on the mouse's central button <- Disabled
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# Natural movement of the mouse <- Activated
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# Energy saving - Turn off screen <- Never
gsettings set org.gnome.desktop.session idle-delay 0

# Action when pressing in the central part of a window <- None
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'

# Night mode <- Activated
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Favorite applications
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'thunderbird.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'keepassxc_keepassxc.desktop', 'org.remmina.Remmina.desktop', 'jetbrains-phpstorm.desktop', 'jetbrains-datagrip.desktop', 'code.desktop', 'mongodb-compass.desktop', 'insomnia_insomnia.desktop', 'slack_slack.desktop', 'telegram-desktop_telegramdesktop.desktop', 'virtualbox.desktop', 'filezilla.desktop', 'winbox.desktop', 'spotify.desktop', 'anydesk.desktop']"
