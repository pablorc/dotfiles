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

Run install.sh

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
