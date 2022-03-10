#!/bin/bash

uid=$(id -u)
if [ $uid == 0 ]; then
    echo "run as normal user"
    exit
fi

# fcitx5 mozc
read -p "set fcitx env? [y/N]" prompt
if [[ $prompt == "y" ]]; then
    echo GTK_IM_MODULE=fcitx  | sudo tee -a /etc/environment
    echo QT_IM_MODULE=fcitx   | sudo tee -a /etc/environment
    echo XMODIFIERS=@im=fcitx | sudo tee -a /etc/environment
    echo SDL_IM_MODULE=fcitx  | sudo tee -a /etc/environment
fi

read -p "launch fcitx5-configtool? [y/N]" prompt
if [[ $prompt == "y" ]]; then
    fcitx5-configtool
fi