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
		git clone git@github.com:Kuniwak/dotfiles "$dotfiles"
	fi

	symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
	symlink "$dotfiles/.gitignore.global" "$HOME/.gitignore.global"
	symlink "$dotfiles/.curlrc" "$HOME/.curlrc"
	symlink "$dotfiles/.tigrc" "$HOME/.tigrc"
	symlink "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"
	symlink "$dotfiles/.agignore" "$HOME/.agignore"
	symlink "$dotfiles/.ptignore" "$HOME/.ptignore"
	symlink "$dotfiles/.vimperatorrc" "$HOME/.vimperatorrc"
	symlink "$dotfiles/.pentadactylrc" "$HOME/.pentadactylrc"
	symlink "$dotfiles/.percol.d" "$HOME/.percol.d"

	if has zsh; then
		symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
		symlink "$dotfiles/.zshenv" "$HOME/.zshenv"
		symlink "$dotfiles/.zshprofile" "$HOME/.zshprofile"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting"
	fi

	if has vim; then
		neobundle="$dotfiles/.vim/bundle"
		symlink "$dotfiles/.vim" "$HOME/.vim"
		symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
		symlink "$dotfiles/.vimrc.bundle" "$HOME/.vimrc.bundle"
		symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
		symlink "$dotfiles/.xvimrc" "$HOME/.xvimrc"
		if [ -d "$neobundle" ]; then
			(cd "$neobundle" && git pull --rebase)
		else
			git clone git@github.com:Shougo/neobundle.vim "$neobundle/neobundle.vim"
		fi
	fi
}

setup
