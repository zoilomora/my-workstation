#!/usr/bin/env bash

# Go to temporary folder
cd /tmp

# Upgrade
sudo apt update && sudo apt full-upgrade -y

# Remove packages by default
sudo apt remove -y \
	ubuntu-web-launchers \
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
    remmina

# Required to add repositories
sudo apt install -y \
    curl \
    ca-certificates \
    apt-transport-https \
    software-properties-common

# Add certificates
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -

# Add repositories
sudo add-apt-repository -y -n ppa:communitheme/ppa
sudo add-apt-repository -y -n ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository -y -n ppa:phoerious/keepassxc
sudo add-apt-repository -y -n "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository -y -n "deb https://download.sublimetext.com/ apt/stable/"
sudo add-apt-repository -y -n "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

# Update package list
sudo apt update

# Accept EULA from ttf-mscorefonts-installer
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

# Installation - apt
sudo apt install -y \
    ubuntu-restricted-extras \
    ubuntu-communitheme-session \
    gnome-tweak-tool \
    lm-sensors \
    psensor \
    exfat-fuse \
    exfat-utils \
    ntfs-3g \
    unrar \
    gparted \
    htop \
    sublime-text \
    screenfetch \
    remmina \
    libfreerdp-plugins-standard \
    remmina-plugin-secret \
    remmina-plugin-vnc \
    remmina-plugin-exec \
    remmina-plugin-nx \
    remmina-plugin-spice \
    remmina-plugin-telepathy \
    remmina-plugin-xdmcp \
    docker-ce \
    virtualbox-5.2 \
    filezilla \
    keepassxc \
    zsh \
    fonts-powerline \
    git

# Installation - Snap
sudo snap install \
    telegram-desktop \
    vlc \
    postman

# Installation - Snap Classic
sudo snap install slack --classic
sudo snap install phpstorm --classic
sudo snap install vscode --classic

# Installation - deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

wget https://www.syntevo.com/downloads/smartgit/smartgit-18_1_5.deb
sudo dpkg -i smartgit-18_1_5.deb
rm smartgit-18_1_5.deb

# Installation - copy
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Settings
sudo groupadd docker && sudo usermod -aG docker $USER

# Detect hardware sensors
(while :; do echo ""; done) | sudo sensors-detect

# Go to the home directory
cd ~

# Customization
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true

patch < zshrc.patch
