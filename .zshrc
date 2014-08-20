# emacsキーバインドを使用
bindkey -e

setopt ignore_eof

# 補完
setopt COMPLETE_IN_WORD

# コピペ時PROMPTを消す
setopt TRANSIENT_RPROMPT

# BEEPを消す
setopt NO_BEEP

autoload -U colors; colors
autoload -U compinit; compinit

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

has() {
	type "$1" > /dev/null 2>&1
}

export EDITOR="vim -p"

# Prompt {{{
setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"

zstyle ':vcs_info:*' formats '[%b%m%u%c]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

	PROMPT="%F{green}[%D{%m/%d %T}]%f → " 
	RPROMPT="%1(v|%F{red}%1v%f|) %F{cyan}%d%f %F{magenta}%n%f"
}
# }}}


# History {{{
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=${HISTSIZE}

setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
# }}}


# Aliases {{{
case "${OSTYPE}" in
freebsd*|darwin*)
	alias ls="ls -FG"
	;;
linux*)
	alias ls="ls -F --color"
	;;
esac

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

dotfiles="$HOME/.dotfiles"
dotfiles_local="$HOME/.dotfiles"

alias ev="vi $dotfiles/.vimrc"
alias eb="vi $dotfiles/.vimrc.bundle"
alias elv="vi $dotfiles_local/.vimrc.local"
alias elb="vi $dotfiles_local/.vimrc.bundle.local"

alias ez="vi $dotfiles/.zshrc"
alias ee"vi $dotfiles/zshenv"
alias elz="vi $dotfiles_local/.zshrc.local"
alias ele="vi $dotfiles_local/.zshenv.local"

alias g='git'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*[ ]*//g"`'
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
alias -g S='`git log --date=short --pretty="format:%h %cd %an%d %s" | peco --prompt "GIT SHA1>" | head -n 1 | sed "s/^\([0-9a-f]*\).*/\1/"`'
alias -g D='`echo S | sed "s/\([0-9a-f]*\)/\1..\1^/" | xargs git diff --name-only | peco --prompt "GIT DIFF FILE>" | head -n 1 | sed "s/^\(\S*\).*/\1/"`'
alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/^\*\s*//" | sed "s/remotes\/[^\/]*\/\(\S*\)/\1 \0/"`'

alias wee="weechat --no-plugin --no-script --run-command \"\$(grep -h '^/' ~/.weechat/startup ~/.weechat/startup.local 2> /dev/null | tr '\n' ';')\""
# }}}

if has 'peco'; then
	ssh-add-peco() {
		for id_rsa in `ls -1 ~/.ssh/**/id_rsa | peco`; do
			ssh-add "$id_rsa"
		done
	}
	alias sa='ssh-add-peco'

	tmux-attach-peco() {
		tmux attach -t `tmux ls -F "#{session_name}" | peco | head -1`
	}
	alias ta='tmux-attach-peco'

	git-conflict-peco() {
		vim -p `git diff --name-only --diff-filter=U | peco`
	}

	history-peco() {
		eval `history -nr 1 | peco`
	}

	git-checkout-remote-peco() {
		remote_branch=`git remote -a | peco | head -1`
		branch_name=`sed "s/remotes\/[^\/]*\///"`
		git checkout -b $branch_name $remote_branch
	}
fi

ZSH_COMPLETIONS=/usr/local/share/zsh-completions
if [ -d $ZSH_COMPLETIONS ]; then
	fpath=("$ZSH_COMPLETIONS/src" $fpath)
fi

if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# vim: fdm=marker
