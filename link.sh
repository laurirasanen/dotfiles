#!/bin/bash

ln -s "$(pwd)/.aliases.sh" "$HOME/.aliases.sh"

mkdir -p ~/bin
stow --target=$HOME/bin bin
sudo chmod +x ~/bin/*.sh

mkdir -p ~/.config
stow --target=$HOME/.config .config

cp --update=none .tokens_template ~/.tokens
