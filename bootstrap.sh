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

sudo dnf install -y ansible ansible-collection-community-general
