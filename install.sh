#!/bin/bash

PBL=$HOME/.pbl
mkdir $PBL
cd $PBL

# Dotfiles
# git clone git@github.com:pablorc/dotfiles.git .dotfiles
ln -s dotfiles/hgrc $HOME/.hgrc
ln -s dotfiles/gitconfig $HOME/.gitconfig
ln -s dotfiles/tmux.conf $HOME/.tmux.conf
touch $HOME/.sh-paths

# Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ln -s .dotfiles/zshrc $HOME/.zshrc
cp .dotfiles/pablorc.zsh-theme $HOME/.oh-my-zsh/themes

# hg-prompt
mkdir -p $HOME/.hg_extensions
cd $HOME/.hg_extensions
hg clone http://bitbucket.org/sjl/hg-prompt/
cd $PBL

#zsh-syntax-highlighting
cd $HOME/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
cd $PBL

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Neovim
brew install neovim/neovim/neovim

# Configure Neovim
mkdir -p $HOME/.config
cd ~/.config
git clone git@github.com:pablorc/neovimfiles.git nvim
echo “Enter neovim and type :PlugInstall”

# Tmux
brew install tmux

# RVM
curl -sSL https://get.rvm.io | bash -s stable

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
