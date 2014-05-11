# emacsキーバインドを使用
bindkey -e

setopt ignore_eof

autoload -U compinit
compinit

autoload -U colors
colors

# 補完
setopt COMPLETE_IN_WORD

# コピペ時PROMPTを消す
setopt TRANSIENT_RPROMPT

# BEEPを消す
setopt NO_BEEP

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
SAVEHIST=$HISTSIZE

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
# }}}

# Zsh completions (https://github.com/zsh-users/zsh-completions)
if [ -r /usr/local/share/zsh-completions ]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# vim: fdm=marker
