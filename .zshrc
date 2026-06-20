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

in-git() {
	git rev-parse --show-toplevel >/dev/null 2>&1
}

github-owner-repo() {
	local url
	url="$(git remote get-url origin)"
	print -r -- "${${url/#ssh:\/\/git@/}/#git@/}"
}

precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

	local loc
	if in-git; then
		loc="$(github-owner-repo)"
	else
		loc="$(pwd)"
	fi

	# DEFAULT=$'%F{green}[%D{%m/%d %T}]%f $'
	# ERROR=$'%F{red}[%D{%m/%d %T}]%f $'
	DEFAULT=$'%F{green}$%f'
	ERROR=$'%F{red}$%f'
	PROMPT=$'%(?.${DEFAULT}.${ERROR}) '
	RPROMPT="%1(v|%F{red}%1v%f|) %F{cyan}${loc}%f %F{magenta}%n%f"
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

ZSH_COMPLETIONS=/usr/local/share/zsh-completions
if [[ -d $ZSH_COMPLETIONS ]]; then
	fpath=("$ZSH_COMPLETIONS/src" $fpath)
fi

AWS_COMPLETIONS=/usr/local/bin/aws_zsh_completer.sh
if [[ -x $AWS_COMPLETIONS ]]; then
	source "$AWS_COMPLETIONS"
fi

ZSH_SYNTAX_HIGHLIGHTING_PATH="$HOME/.zsh-syntax-highlighting"
if [[ -d "$ZSH_SYNTAX_HIGHLIGHTING_PATH" ]]; then
	source "$ZSH_SYNTAX_HIGHLIGHTING_PATH/zsh-syntax-highlighting.zsh"
fi

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
alias less='less -n'
alias posh='pwsh -nologo'
alias pwsh='pwsh -nologo'
alias sudoedit='sudo vim -u NONE -N'
alias codex='cage --preset codex codex -s danger-full-access'
alias claude='cage --preset claude claude'
alias gemini='cage --preset gemini gemini'
alias brew='cage --preset homebrew brew'
alias g='git'
alias -g C='`git rev-parse --abbrev-ref HEAD`'

function gcd() {
	local query="$*"
	res="$(ghq list | peco --query "$query" --exit-0)"
	if [[ -z "$res" ]]; then
		false
	else
		cd "$(ghq root)/$res"
	fi
}

function gco() {
	local query="$*"
	res="$(g wt | tail -n +2 | peco --query "$query" --exit-0 | awk '{print $(NF-1)}')"
	if [[ -z "$res" ]]; then
		false
	else
		g wt "$res"
	fi
}

alias tn='tmux new -s'
function ta() {
	session_names=$(tmux ls -F "#{session_name}")

	if [[ -z "$session_names" ]]; then
		return 1
	fi

	session_name=$(echo "$session_names" | peco)
	tmux attach -t "$session_name"
}

h() {
	eval `history -nr 1 | peco`
}
# }}}

if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

eval "$(git wt --init zsh)"
# vim: fdm=marker
