#!/bin/sh
# Thanks, @kaorimatz!

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
		git clone https://github.com/Kuniwak/.dotfiles "$dotfiles"
	fi

	has git && symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
	has git && symlink "$dotfiles/.gitignore.global" "$HOME/.gitignore.global"
	has curl && symlink "$dotfiles/.curlrc" "$HOME/.curlrc"
	has tig && symlink "$dotfiles/.tigrc" "$HOME/.tigrc"

	if has zsh; then
		symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
		symlink "$dotfiles/.zshenv" "$HOME/.zshenv"
		symlink "$dotfiles/.zshprofile" "$HOME/.zshprofile"
	fi

	if has vim; then
		neobundle="$dotfiles/.vim/bundle"
		symlink "$dotfiles/.vim" "$HOME/.vim"
		symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
		symlink "$dotfiles/.vimrc.bundle" "$HOME/.vimrc.bundle"
		symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
		if [ -d "$neobundle" ]; then
			(cd "$neobundle" && git pull --rebase)
		else
			git clone https://github.com/Shougo/neobundle.vim "$neobundle/neobundle.vim"
		fi
	fi
}

setup
