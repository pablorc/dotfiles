#!/bin/bash

config_dir=~/.pbl
neovim=$config_dir/neovimfiles
dotfiles=$config_dir/dotfiles
bin=$config_dir/bin
git_helpers=$config_dir/git-helpers

mkdir $config_dir
cd $config_dir

git clone git@github.com:pablorc/dotfiles.git $dotfiles
git clone git@github.com:pablorc/neovimfiles.git $neovim
git clone git@github.com:pablorc/git-helpers.git $git_helpers

# Link home-living files
cp $dotfiles/gitconfig ~/.gitconfig
ln -s $dotfiles/global_gitignore ~/.global_gitignore
ln -s $dotfiles/zshrc ~/.zshrc
ln -s $dotfiles/pblsh ~/.pblsh
ln -s $dotfiles/gemrc ~/.gemrc
cp $dotfiles/pbl_env_example ~/.pbl_env

stow -t $HOME stow/starship

echo "Write your git user name"
read git_username
echo "Write your git user email"
read git_email
git config --global --add user.name "$git_username"
git config --global --add user.email "$git_email"

echo "Remember to fill your .pbl_env file!"
