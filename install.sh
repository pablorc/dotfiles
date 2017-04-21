
# Dotfiles
git clone git@github.com:pablorc/dotfiles.git
ln -s dotfiles/hgrc .hgrc
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/tmux.conf .tmux.conf
touch $HOME/.sh-paths

# Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ln -s dotfiles/zshrc .zshrc
cp dotfiles/pablorc.zsh-theme $HOME/.oh-my-zsh/themes

# hg-prompt
mkdir -p dotfiles
cd $HOME/dotfiles
hg clone http://bitbucket.org/sjl/hg-prompt/ 
cd $HOME

#zsh-syntax-highlighting
cd $HOME/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
cd $HOME

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Neovim
brew install neovim/neovim/neovim

# Configure Neovim
mkdir -p .config
cd ~/.config
git clone git@github.com:pablorc/neovimfiles.git nvim
echo “Enter neovim and type :PlugInstall”

# Tmux
brew install tmux

# RVM
curl -sSL https://get.rvm.io | bash -s stable

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
