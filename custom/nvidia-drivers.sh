#!/bin/bash

echo
echo "################################################################"
echo "  Installing NVIDIA Drivers                                     "
echo "################################################################"
echo

# Update operating system
sudo apt update
sudo apt upgrade -y

# Disable nvidia nouveau driver
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nouveau.conf"

# Update the initramfs of the newest kernel
sudo update-initramfs -u

# Change boot target to the text mode
sudo systemctl set-default multi-user.target
sudo reboot

# Driver requirements
sudo apt install gcc make build-essential linux-headers-`uname -r` 

# Driver installation - https://www.nvidia.es/Download/index.aspx
sudo ./NVIDIA-Linux-x86_64-515.65.01.run 

# Change boot target to the graphical mode
sudo systemctl set-default graphical.target
sudo reboot
