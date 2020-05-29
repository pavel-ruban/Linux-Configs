#!/bin/bash

sudo apt -y install zsh zsh-common
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cd ~ || exit

if [ ! -r ~/.zshrc ]
then
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.zshrc
else
  echo '!warning: you already have ~/.zshrc file, moved it to ~/.zshrc.old'
  mv ~/.zshrc ~/.zshrc.old
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.zshrc
fi

if [ ! -r ~/.zsh-theme ]
then
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.zsh-theme
else
  echo '!warning: you already have ~/.zsh-theme file, moved it to ~/.zsh-theme.old'
  mv ~/.zsh-theme ~/.zsh-theme.old
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.zsh-theme
fi

if [ ! -r ~/.dir_colors ]
then
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.dir_colors
else
  echo '!warning: you already have ~/.dir_colors file, moved it to ~/.dir_colors.old'
  mv ~/.dir_colors ~/.dir_colors.old
  wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/.dir_colors
fi

# Replace contrib files, if needed they can be reinstalled.

sudo rm /etc/zsh/*
cd /etc/zsh/ || exit

sudo wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/etc/zsh/keephack
sudo wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/etc/zsh/zprofile
sudo wget https://raw.githubusercontent.com/pavel-ruban/Linux-Configs/master/shared/Ubuntu/etc/zsh/zshrc

zsh