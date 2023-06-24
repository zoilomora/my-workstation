#!/bin/bash

_static=
while [[ -z ${_static} ]]; do
	printf "enter static (short) hostname: "
	read _static
done

_pretty=
while [[ -z ${_pretty} ]]; do
	printf "enter pretty hostname: "
	read _pretty
done

sudo hostnamectl set-hostname --static ${_static}
sudo hostnamectl set-hostname --pretty "${_pretty}"

sudo apt install python3 python3-venv python3-pip -y
python3 -m venv ansible
source ansible/bin/activate
python3 -m pip install ansible
