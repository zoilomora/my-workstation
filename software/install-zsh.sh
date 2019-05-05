#!/bin/bash

echo
echo "################################################################"
echo "  Installing Z Shell + Oh My Zsh                                "
echo "################################################################"
echo

if ! package=$(dpkg-query --list | grep "fonts-powerline"); then
    sudo apt install -y fonts-powerline
fi

if ! location=$(type -p "zsh"); then
    sudo apt install -y zsh
fi

if ! [ -a "~/.zshrc" ]; then
    echo
    echo "+--------------------------------------------------------------+"
    echo "| Oh My Zsh will be installed, after installation it will      |"
    echo "|     appear inside the new shell.                             |"
    echo "| Type the 'exit' command to exit Z shell and                  |"
    echo "|     continue the installation                                |"
    echo "+--------------------------------------------------------------+"
    echo
    read -p "Press enter to continue"

    SETUP_DIR="$(pwd)"

    cd ~
    sh -c "$(wget -qO - https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions

    cd ${SETUP_DIR}

    sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g" ~/.zshrc
    sed -i "s/plugins=(git)/plugins=(\n  git\n  composer\n  docker\n  docker-compose\n  symfony\n  zsh-autosuggestions\n)/g" ~/.zshrc

    echo "DEFAULT_USER=\$USER" >> ~/.zshrc
    echo "" >> ~/.zshrc
    echo "alias zshconfig=\"nano ~/.zshrc\"" >> ~/.zshrc
fi
