#!/bin/sh
# Thnaks, kaorimatz!

set -e
set -u

dotfiles=$HOME/.dotfiles

has() {
  type "$1" > /dev/null 2>&1
}

symlink() {
  [ -e "$2" ] || ln -s "$1" "$2"
}

if [ -d "$dotfiles" ]; then
  (cd "$dotfiles" && git pull --rebase)
else
  git clone https://github.com/OrgaChem/.dotfiles "$dotfiles"
fi

has git && symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
has git && symlink "$dotfiles/.gitignore_global" "$HOME/.gitignore_global"

if has vim; then
  vimfiles=$HOME/.orgachem-vim
  git clone https://github.com/OrgaChem/OrgaChem-Vim-Configurations "$vimfiles"
  symlink "$vimfiles/_vimrc" "$HOME/.vimrc"
  symlink "$vimfiles/_gvimrc" "$HOME/.gvimrc"
  symlink "$vimfiles/vimfiles" "$HOME/.vim"
  git clone https://github.com/Shougo/neobundle.vim "$vimfiles/bundle/neobundle.vim"
fi

if [ -f "$HOME/.bashrc" ]; then
  mv "$HOME/.bashrc" "$HOME/.bashrc.org" 
fi

has git && symlink "$dotfiles/.bashrc" "$HOME/.bashrc"
