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
curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg | sudo apt-key add -

# Add repositories
sudo add-apt-repository -y -n ppa:communitheme/ppa
sudo add-apt-repository -y -n ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository -y -n ppa:phoerious/keepassxc
sudo add-apt-repository -y -n "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository -y -n "deb https://download.sublimetext.com/ apt/stable/"
sudo add-apt-repository -y -n "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo add-apt-repository -y -n "deb http://build.openvpn.net/debian/openvpn/release/2.3 stretch main"

# Update package list
sudo apt update

# OpenVPN dependencies
wget http://ftp.us.debian.org/debian/pool/main/o/openssl1.0/libssl1.0.2_1.0.2l-2+deb9u3_amd64.deb
sudo dpkg -i libssl1.0.2_1.0.2l-2+deb9u3_amd64.deb
rm libssl1.0.2_1.0.2l-2+deb9u3_amd64.deb

# Accept EULA from ttf-mscorefonts-installer
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

# Installation - apt
sudo apt install -y \
    ubuntu-restricted-extras \
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
    docker-ce \
    virtualbox-5.2 \
    filezilla \
    keepassxc \
    zsh \
    fonts-powerline \
    git \
    openvpn=2.3.18-stretch0 \
    network-manager-openvpn \
    network-manager-openvpn-gnome

# Block packages
sudo apt-mark hold \
    openvpn

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

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
patch < zshrc.patch

cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
cd ~
