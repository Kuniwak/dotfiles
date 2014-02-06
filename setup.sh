#! /usr/bin/bash
DOTFILES_DIR=`dirname ${0}`

if [[ -f ~/.bashrc ]]; then
    echo $DOTFILES_DIR/.bashrc >> $HOME/.bashrc
else
    ln -s $DOTFILES_DIR/.bashrc $HOME/.bashrc
fi
source ${HOME}/.bashrc

if [[ ! -f ~/.gitignore_global ]]; then
    ln -s $DOTFILES_DIR/.gitignore_global $HOME/.gitignore_global
fi

if [[ ! -f ~/.gitconfig ]]; then
    ln -s $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
fi
