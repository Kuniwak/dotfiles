#!/bin/bash
# Thanks, @kaorimatz!

set -euo pipefail


has() {
  local command_name="$1"
  type "$command_name" > /dev/null 2>&1
}


symlink_with_bkup() {
  local source="$1"
  local dest="$2"
  local timestamp
  timestamp="$(date +%s)"
  local bkup_dir="$HOME/.backups/$timestamp"

  if [[ -e "$dest" ]]; then
    mkdir -p "$bkup_dir"
    mv "$dest" "$bkup_dir/$(basename "$dest")"
  fi
  ln -s "$source" "$dest"
}


symlink_if_not_exists() {
  local source="$1"
  local dest="$2"

  mkdir -p "$(dirname "$2")"
  [[ -e "$dest" ]] || ln -s "$source" "$dest"
}


git_clone_if_not_exists() {
  local repo="$1"
  local dest="$2"
  [[ -e "$dest" ]] || git clone "$repo" "$dest"
}


setup() {
	local dotfiles="$HOME/.dotfiles"
	git_clone_if_not_exists 'https://github.com/Kuniwak/dotfiles' "$dotfiles"

	symlink_if_not_exists "$dotfiles/.gitconfig" "$HOME/.gitconfig"
	symlink_if_not_exists "$dotfiles/.gitignore.global" "$HOME/.gitignore.global"
	symlink_if_not_exists "$dotfiles/.curlrc" "$HOME/.curlrc"
	symlink_if_not_exists "$dotfiles/.tigrc" "$HOME/.tigrc"
	symlink_if_not_exists "$dotfiles/.tmux.conf" "$HOME/.tmux.conf"
	symlink_if_not_exists "$dotfiles/.agignore" "$HOME/.agignore"
	symlink_if_not_exists "$dotfiles/.ptignore" "$HOME/.ptignore"
	symlink_if_not_exists "$dotfiles/.vimperatorrc" "$HOME/.vimperatorrc"
	symlink_if_not_exists "$dotfiles/.pentadactylrc" "$HOME/.pentadactylrc"
	symlink_if_not_exists "$dotfiles/.percol.d" "$HOME/.percol.d"
	symlink_if_not_exists "$dotfiles/.bundle/config" "$HOME/.bundle/config"
	symlink_if_not_exists "$dotfiles/.config/Microsoft.PowerShell_profile.ps1" "$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"

	if has zsh; then
		symlink_with_bkup "$dotfiles/.zshrc" "$HOME/.zshrc"
		symlink_if_not_exists "$dotfiles/.zshenv" "$HOME/.zshenv"
		symlink_if_not_exists "$dotfiles/.zshprofile" "$HOME/.zshprofile"
		git_clone_if_not_exists 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "$HOME/.zsh-syntax-highlighting"
	fi

	if has vim; then
		local neobundle="$dotfiles/.vim/bundle"
		symlink_if_not_exists "$dotfiles/.vim" "$HOME/.vim"
		symlink_if_not_exists "$dotfiles/.vimrc" "$HOME/.vimrc"
		symlink_if_not_exists "$dotfiles/.vimrc.bundle" "$HOME/.vimrc.bundle"
		symlink_if_not_exists "$dotfiles/.gvimrc" "$HOME/.gvimrc"
		symlink_if_not_exists "$dotfiles/.xvimrc" "$HOME/.xvimrc"
		symlink_if_not_exists "$dotfiles/.ideavimrc" "$HOME/.ideavimrc"
		git_clone_if_not_exists 'https://github.com/Shougo/neobundle.vim' "$neobundle/neobundle.vim"
	fi
}

setup
