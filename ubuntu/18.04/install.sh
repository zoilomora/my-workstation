#!/usr/bin/env bash

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

# Remove snap packages
sudo snap remove -y \
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

# Add repositories
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
    net-tools \
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
    network-manager-openvpn-gnome \
    remmina \
    libfreerdp-plugins-standard \
    remmina-plugin-secret \
    remmina-plugin-vnc \
    remmina-plugin-exec \
    remmina-plugin-nx \
    remmina-plugin-spice \
    remmina-plugin-telepathy \
    remmina-plugin-xdmcp

# Block packages
sudo apt-mark hold \
    openvpn

# Docker
sudo systemctl enable docker
sudo groupadd docker && sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Installation - Snap
sudo snap install \
    communitheme \
    telegram-desktop \
    vlc \
    postman

# Installation - Snap Classic
sudo snap install slack --classic
sudo snap install vscode --classic

# Installation - deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

wget https://www.syntevo.com/downloads/smartgit/smartgit-18_2_5.deb
sudo dpkg -i smartgit-18_2_5.deb
rm smartgit-18_2_5.deb

wget https://downloads.mongodb.com/compass/mongodb-compass_1.16.0_amd64.deb
sudo dpkg -i mongodb-compass_1.16.0_amd64.deb
rm mongodb-compass_1.16.0_amd64.deb

# Installation - copy
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Detect hardware sensors
(while :; do echo ""; done) | sudo sensors-detect

# Copy patch to the home directory
cp zshrc.patch ~

# Customization
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true

cd ~
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
patch < zshrc.patch
rm zshrc.patch

cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
cd ~

# Install IDE
cd /opt

sudo wget https://download-cf.jetbrains.com/webide/PhpStorm-2018.3.3.tar.gz
sudo tar -xzvf PhpStorm-2018.3.3.tar.gz
sudo mv PhpStorm-183.5153.36 PhpStorm-2018.3.3
sudo cat << EOF > /usr/share/applications/jetbrains-phpstorm.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=PhpStorm
Icon=/opt/PhpStorm-2018.3.3/bin/phpstorm.svg
Exec="/opt/PhpStorm-2018.3.3/bin/phpstorm.sh"
Commet=
Categories=Development;
Terminal=false
EOF

sudo wget https://download-cf.jetbrains.com/datagrip/datagrip-2018.3.1.tar.gz
sudo tar -xzvf datagrip-2018.3.1.tar.gz
sudo cat << EOF > /usr/share/applications/jetbrains-datagrip.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=DataGrip
Icon=/opt/DataGrip-2018.3.1/bin/datagrip.svg
Exec="/opt/DataGrip-2018.3.1/bin/datagrip.sh"
Commet=
Categories=Development;
Terminal=false
EOF

sudo wget https://download-cf.jetbrains.com/python/pycharm-professional-2018.3.4.tar.gz
sudo tar -xzvf pycharm-professional-2018.3.4.tar.gz
sudo mv pycharm-2018.3.4 PyCharm-2018.3.4
sudo cat << EOF > /usr/share/applications/jetbrains-pycharm.desktop
cat jetbrains-pycharm.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Icon=/opt/PyCharm-2018.3.4/bin/pycharm.svg
Exec="/opt/PyCharm-2018.3.4/bin/pycharm.sh"
Commet=
Categories=Development;
Terminal=false
EOF
