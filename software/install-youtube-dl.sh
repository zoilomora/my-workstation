#!/bin/bash

echo
echo "################################################################"
echo "  Installing Youtube-dl                                         "
echo "################################################################"
echo

if ! location=$(type -p "youtube-dl"); then
    sudo apt install -y \
        python \
        ffmpeg

    sudo wget -O /usr/local/bin/youtube-dl https://yt-dl.org/downloads/latest/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
fi
