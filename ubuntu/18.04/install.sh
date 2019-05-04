#!/usr/bin/env bash

set -e

# Upgrade
sudo apt update
sudo apt full-upgrade -y

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

# Remove snap packages
sudo snap remove \
    gnome-calculator \
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
curl -fsSL https://swupdate.openvpn.net/repos/repo-public.gpg | sudo apt-key add -
curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Add repositories
sudo add-apt-repository -y -n ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository -y -n ppa:phoerious/keepassxc
sudo add-apt-repository -y -n "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository -y -n "deb https://download.sublimetext.com/ apt/stable/"
sudo add-apt-repository -y -n "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo add-apt-repository -y -n "deb http://build.openvpn.net/debian/openvpn/release/2.3 stretch main"
sudo add-apt-repository -y -n "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"

# Update package list
sudo apt update

# Installation - OpenVPN
wget http://ftp.us.debian.org/debian/pool/main/o/openssl1.0/libssl1.0.2_1.0.2r-1~deb9u1_amd64.deb
sudo dpkg -i libssl1.0.2_1.0.2r-1~deb9u1_amd64.deb
rm libssl1.0.2_1.0.2r-1~deb9u1_amd64.deb
sudo apt install -y \
    openvpn=2.3.18-stretch0 \
    network-manager-openvpn \
    network-manager-openvpn-gnome
sudo apt-mark hold \
    openvpn

# Installation - Ubuntu Restricted Extras
## Accept EULA from ttf-mscorefonts-installer
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y \
    ubuntu-restricted-extras

# Installation - System Utilities
sudo apt install -y \
    gnome-calculator \
    gnome-tweak-tool \
    unrar \
    htop

# Installation - Sensors
sudo apt install -y \
    lm-sensors \
    psensor

# Detect hardware sensors
(while :; do echo ""; done) | sudo sensors-detect

# Installation - Network Utilities
sudo apt install -y \
    net-tools \
    traceroute

# Installation - Disk utilities
sudo apt install -y \
    exfat-fuse \
    exfat-utils \
    ntfs-3g \
    gparted \
    ncdu

# Installation - Utilities
sudo apt install -y \
    screenfetch \
    filezilla \
    keepassxc \
    sublime-text \
    virtualbox-6.0

# Installation - Z Shell
sudo apt install -y \
    zsh \
    fonts-powerline \
    git

# Installation - Remote control
sudo apt install -y \
    remmina \
    libfreerdp-plugins-standard \
    remmina-plugin-secret \
    remmina-plugin-vnc \
    remmina-plugin-exec \
    remmina-plugin-nx \
    remmina-plugin-spice \
    remmina-plugin-telepathy \
    remmina-plugin-xdmcp

# Installation - Google Chrome
sudo apt install -y \
    google-chrome-stable

# Installation - Disc burner
sudo apt install -y \
    xfburn

# Installation - MongoDB Compass
sudo apt install -y \
    libgconf-2-4
wget https://downloads.mongodb.com/compass/mongodb-compass_1.17.0_amd64.deb
sudo dpkg -i mongodb-compass_1.17.0_amd64.deb
rm mongodb-compass_1.17.0_amd64.deb

# Installation - youtube-dl
sudo apt install -y \
    python \
    ffmpeg \
    mediainfo-gui
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Installation - Docker
sudo apt install -y \
    docker-ce
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Installation - Snap
sudo snap install \
    communitheme \
    telegram-desktop \
    vlc \
    postman

# Installation - Slack
sudo snap install slack --classic

# Installation - SmartGit
wget https://www.syntevo.com/downloads/smartgit/smartgit-18_2_7.deb
sudo dpkg -i smartgit-18_2_7.deb
rm smartgit-18_2_7.deb

# Installation - Oh My Zsh
echo
echo "+--------------------------------------------------------------------------------------+"
echo "| Oh My Zsh will be installed, after installation it will appear inside the new shell. |"
echo "| Type the 'exit' command to exit Z shell and continue the installation                |"
echo "+--------------------------------------------------------------------------------------+"
echo
read -p "Press enter to continue"

cp zshrc.patch ~

cd ~

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
patch < zshrc.patch
rm zshrc.patch

cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
cd ~

# Install IDE
cd /opt

sudo wget https://download-cf.jetbrains.com/webide/PhpStorm-2019.1.1.tar.gz
sudo tar -xzvf PhpStorm-2019.1.1.tar.gz
sudo rm PhpStorm-2019.1.1.tar.gz
sudo mv PhpStorm-191.6707.66 PhpStorm-2019.1.1
sudo tee /usr/share/applications/jetbrains-phpstorm.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=PhpStorm
Icon=/opt/PhpStorm-2019.1.1/bin/phpstorm.svg
Exec="/opt/PhpStorm-2019.1.1/bin/phpstorm.sh"
Commet=
Categories=Development;
Terminal=false
EOF

sudo wget https://download-cf.jetbrains.com/datagrip/datagrip-2019.1.2.tar.gz
sudo tar -xzvf datagrip-2019.1.2.tar.gz
sudo rm datagrip-2019.1.2.tar.gz
sudo tee /usr/share/applications/jetbrains-datagrip.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=DataGrip
Icon=/opt/DataGrip-2019.1.2/bin/datagrip.svg
Exec="/opt/DataGrip-2019.1.2/bin/datagrip.sh"
Commet=
Categories=Development;
Terminal=false
EOF

# Customization
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true

# Upgrade
sudo apt update
sudo apt --fix-broken install
sudo apt upgrade -y
