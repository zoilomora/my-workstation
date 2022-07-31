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

# Week number <- Activated
gsettings set org.gnome.desktop.calendar show-weekdate true

# Energy saving - Turn off screen <- Never
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# Button Layout
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Dynamic Workspace <- Disabled
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1

# Dash to Dock configuration
# dconf write /org/gnome/shell/extensions/dash-to-dock/preferred-monitor 0
# dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
# dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
# dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity 0.5

# Favorite applications
# gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'thunderbird.desktop', 'org.gnome.Terminal.desktop', 'google-chrome.desktop', 'keepassxc_keepassxc.desktop', 'org.remmina.Remmina.desktop', 'jetbrains-phpstorm.desktop', 'jetbrains-datagrip.desktop', 'code.desktop', 'mongodb-compass.desktop', 'insomnia.desktop', 'syntevo-smartgit.desktop', 'slack_slack.desktop', 'telegram-desktop_telegram-desktop.desktop', 'virtualbox.desktop', 'filezilla.desktop', 'winbox.desktop', 'spotify.desktop', 'anydesk.desktop', 'camunda-modeler.desktop']"
