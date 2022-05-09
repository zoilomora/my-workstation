#!/bin/bash

echo
echo "################################################################"
echo "  Installing yt-dlp                                             "
echo "################################################################"
echo

if ! location=$(type -p "yt-dlp"); then
    sudo apt install -y ffmpeg

    sudo wget -O /usr/local/bin/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/download/2022.03.08.1/yt-dlp
    sudo chmod a+rx /usr/local/bin/yt-dlp
fi
