#!/bin/bash

config_dir=~/.pbl
dotfiles=$config_dir/dotfiles

mkdir $config_dir
cd $config_dir

# git clone git@github.com:pablorc/dotfiles.git $dotfiles
git clone https://github.com/pablorc/dotfiles.git $dotfiles

cd $dotfiles

ansible-playbook --ask-vault-pass main.yml
