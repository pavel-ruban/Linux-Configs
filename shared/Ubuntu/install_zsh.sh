#!/bin/bash

sudo apt-get install zsh zsh-common zsh-syntax-highlighting
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
cd ~

if [ ! -r ~/.zshrc ]
then
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.zshrc
else
  echo '!warning: you already have ~/.zshrc file, skipping this file downloading.'
fi

if [ ! -r ~/.zsh-theme ]
then
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.zsh-theme
else
  echo '!warning: you already have ~/.zsh-theme skipping this file downloading.'
fi
