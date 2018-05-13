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
export GIT_EDITOR="vim -p"

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

	# DEFAULT=$'%F{green}[%D{%m/%d %T}]%f $'
	# ERROR=$'%F{red}[%D{%m/%d %T}]%f $'
	DEFAULT=$'%F{green}$%f'
	ERROR=$'%F{red}$%f'
	PROMPT=$'%(?.${DEFAULT}.${ERROR}) '
	RPROMPT="%1(v|%F{red}%1v%f|) %F{cyan}%d%f %F{magenta}%n%f"
}
# }}}

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

PATH_LOADER="$HOME/.dotfiles/path_loader.zsh"
if [ -r "$PATH_LOADER" ]; then
	source "$PATH_LOADER"
fi

ZSH_COMPLETIONS=/usr/local/share/zsh-completions
if [ -d $ZSH_COMPLETIONS ]; then
	fpath=("$ZSH_COMPLETIONS/src" $fpath)
fi

ZSH_SYNTAX_HIGHLIGHTING_PATH="$HOME/.zsh-syntax-highlighting"
if [ -d "$ZSH_SYNTAX_HIGHLIGHTING_PATH" ]; then
	source "$ZSH_SYNTAX_HIGHLIGHTING_PATH/zsh-syntax-highlighting.zsh"
fi

# General aliases {{{
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
alias pt='pt --home-ptignore'
alias be='bundle exec --'
# }}}

# Git aliases {{{
alias g='git'
alias -g B='`git branch -a | percol --prompt "GIT BRANCH>" | sed -e "s/^\*[ ]*//g"`'
alias -g R='`git remote | percol --prompt "GIT REMOTE>" | head -n 1`'
alias -g S='`git log --date=short --pretty="format:%h %cd %an%d %s" | percol --prompt "GIT SHA1>" | head -n 1 | sed "s/^\([0-9a-f]*\).*/\1/"`'
alias -g D='`echo S | sed "s/\([0-9a-f]*\)/\1..\1^/" | xargs git diff --name-only | percol --prompt "GIT DIFF FILE>" | sed "s/^\(\S*\).*/\1/"`'
alias -g LR='`git branch -a | percol --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/^\*\s*//" | sed "s/remotes\/\([^\/]*\)\/\(.*\)/\2 \1\/\2/"`'
alias -g C='`git rev-parse --abbrev-ref HEAD`'
# }}}

# Tmux aliases {{{
alias tn='tmux new -s'
if has 'percol'; then
	tmux-attach-percol() {
		tmux attach -t `tmux ls -F "#{session_name}" | percol`
	}
	alias ta='tmux-attach-percol'
fi
# }}}

if has 'percol'; then
	ssh-add-percol() {
	for id_rsa in $(find ~/.ssh -type f -name 'id_rsa' | percol); do
		ssh-add "$id_rsa"
		done
	}
	alias sa='ssh-add-percol'

	git-conflict-percol() {
		vim -p `git diff --name-only --diff-filter=U | percol`
	}

	history-percol() {
		eval `history -nr 1 | percol`
	}

	git-checkout-remote-percol() {
		remote_branch=`git remote -a | percol | head -1`
		branch_name=`sed "s/remotes\/[^\/]*\///"`
		git checkout -b $branch_name $remote_branch
	}
fi

if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# vim: fdm=marker
