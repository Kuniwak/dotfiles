if type vim > /dev/null 2>&1; then
	export EDITOR='vim'
	export GIT_EDITOR='vim'
	alias vi='vim'
else
	export EDITOR='vi'
	export GIT_EDITOR='vi'
fi

MY_RBENV="$HOME/.rbenv"
if [ -d $MY_RBENV ]; then
	export PATH="$MY_RBENV/bin:$MY_RBENV/shims:$PATH"
	eval "$(rbenv init -)"
fi

MY_PLENV="$HOME/.plenv"
if [ -d $MY_PLENV ]; then
	export PATH="$MY_PLENV/bin:$MY_PLENV/shims:$PATH"
	eval "$(plenv init -)"
fi

MY_NDENV="$HOME/.ndenv"
if [ -d $MY_NDENV ]; then
	export PATH="$MY_NDENV/bin:$MY_NDENV/shims:$PATH"
	eval "$(ndenv init -)"
fi

MY_PYENV="$HOME/.pyenv"
if [ -d $MY_PYENV ]; then
	export PYENV_ROOT=$MY_PYENV
	export PATH="$MY_PYENV/bin:$MY_PYENV/shims:$PATH"
	eval "$(pyenv init -)"

	if [ -d "$MY_PYENV/plugins/pyenv-virtualenv" ];then
		eval "$(pyenv virtualenv-init -)"
	fi
fi

MY_CABAL="$HOME/.cabal"
if [ -d $MY_CABAL ]; then
	export PATH="$MY_CABAL/bin:$PATH"
fi

MY_GHC="/usr/local/ghc-7.8"
if [ -d $MY_GHC ]; then
	export PATH="$MY_GHC/bin:$PATH"
fi

SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

#eval "$(hub alias -s)"

if [ -r ~/.zshenv.local ]; then
	. ~/.zshenv.local
fi
