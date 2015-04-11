# Dotfiles

Set of configurations for making my terminal hours easier. Currently I'm
using: 

- Zsh
- oh-my-zsh
- Tmux
- Vim (see [this repo](https://github.com/pablorc/vimfiles))
- Mercurial
- Git

## Instalation

Run the following commands to get all the configurations working

    git clone git@github.com:pablorc/dotfiles.git
    ln -s dotfiles/hgrc .hgrc
    ln -s dotfiles/gitconfig .hgrc
    ln -s dotfiles/ .hgrc
    ln -s dotfiles/tmux.conf .tmux.conf
    touch $HOME/.sh-paths

Installing and configuring oh-my-zsh

    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    ln -s dotfiles/zshrc .zshrc
    cp dotfiles/pablorc.zsh-theme $HOME/.oh-my-zsh/themes

And some development helpers

    # hg-prompt
    mkdir -p dotfiles
    cd $HOME/dotfiles
    hg clone http://bitbucket.org/sjl/hg-prompt/ 
    cd $HOME

    #zsh-syntax-highlighting
    cd $HOME/.oh-my-zsh/custom/plugins
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    cd $HOME

## Configuration

All configuration should be placed in the respective file. Also, `.sh-paths` contains all the command line variables needed to get all working.

## Using npm without sudo

Run the following commands **after** uninstall node.

**Note**: This script only works for Mac OS X

    myshellpath=${HOME}/.zshrc
    brew install node --without-npm
    mkdir "${HOME}/.npm-packages"
    echo NPM_PACKAGES="${HOME}/.npm-packages" >>$myshellpath 
    echo prefix=${HOME}/.npm-packages >> ${HOME}/.npmrc
    curl -L https://www.npmjs.org/install.sh | sh
    echo NODE_PATH=\"\$NPM_PACKAGES/lib/node_modules\:\$NODE_PATH\" >> $myshellpath
    echo PATH=\"\$NPM_PACKAGES/bin\:\$PATH\" >> $HOME/.sh-paths
    source $myshellpath
