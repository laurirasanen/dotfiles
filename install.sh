#!/bin/bash

uid=$(id -u)
if [ $uid == 0 ]; then
    echo "run as normal user"
    exit
fi

# packages
sudo pacman -Syu

sudo pacman -S \
    git-lfs \
    gcc \
    cmake \
    make \
    clang \
    curl \
    dkms \
    udev \
    base-devel \
    linux-headers \
    meson \
    ninja \
    gdb \
    xclip \
    gcc \
    python \
    steam \
    discord \
    krita \
    vlc \
    keepassxc \
    audacity \
    yt-dlp \
    obs-studio \
    gamemode \
    gamescope \
    deluge \
    firejail \
    btop \
    dotnet-sdk \
    fcitx5 \
    fcitx5-mozc \
    fcitx5-qt \
    fcitx5-gtk \
    fcitx5-nord \
    fcitx5-configtool \
    lib32-fontconfig \
    ttf-liberation \
    wqy-zenhei \
    darktable \
    zip \
    unzip \
    nvtop \
    stow \
    otf-font-awesome \
    libreoffice-still \
    zola \
    alacritty \
    imagemagick \
    man-db \
    fuse2 \
    fuse3 \
    neovim \
    nodejs \
    npm \
    zsh \
    eza

# yay :)
read -p "install yay? [y/N]" prompt
if [[ $prompt == "y" ]]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
fi

# logitech wheel
read -p "install wheel stuff? [y/N]" prompt
if [[ $prompt == "y" ]]; then
  yay -S new-lg4ff-git
  yay -S oversteer
fi

# shell
read -p "install zsh? [y/N]" prompt
if [[ $prompt == "y" ]]; then
    yay -S --noconfirm zsh-theme-powerlevel10k-git
    echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
    sudo chsh -s /usr/bin/zsh
    echo 'source ~/.aliases' >>~/.zshrc
    echo 'autoload -Uz compinit' >>~/.zshrc
    echo 'compinit' >>~/.zshrc
fi

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# home configs
./link.sh

sudo pacman -Qdtq | sudo pacman -Rs -
sudo pacman -Sc
