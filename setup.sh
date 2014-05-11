#!/bin/sh
# Thnaks, kaorimatz!

set -e
set -u

setup() {
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
	has git && symlink "$dotfiles/.gitignore.global" "$HOME/.gitignore.global"
	has curl && symlink "$dotfiles/.curlrc" "$HOME/.curlrc"
	has tig && symlink "$dotfiles/.tigrc" "$HOME/.tigrc"
	has git && symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
	has git && symlink "$dotfiles/.zshenv" "$HOME/.zshenv"
	has git && symlink "$dotfiles/.zshprofile" "$HOME/.zshprofile"

	if has vim; then
		vimfiles=$HOME/.orgachem-vim
		if [ -d "$vimfiles" ]; then
			(cd "$vimfiles" && git pull --rebase)
		else
			git clone https://github.com/OrgaChem/OrgaChem-Vim-Configurations "$vimfiles"
			symlink "$vimfiles/_vimrc" "$HOME/.vimrc"
			symlink "$vimfiles/_gvimrc" "$HOME/.gvimrc"
			symlink "$vimfiles/vimfiles" "$HOME/.vim"
			git clone https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"
		fi
	fi
}

setup
