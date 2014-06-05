if type vim > /dev/null 2>&1; then
	EDITOR=vim
else
	EDITOR=vi
fi
export EDITOR

MY_RBENV="$HOME/.rbenv"
if [ -d $MY_RBENV ]; then
	export PATH="$MY_RBENV/bin:$PATH"
	eval "$(rbenv init -)"
fi

MY_PLENV="$HOME/.plenv"
if [ -d $MY_PLENV ]; then
	export PATH="$MY_PLENV/bin:$PATH"
	eval "$(plenv init -)"
fi

MY_NDENV="$HOME/.ndenv"
if [ -d $MY_NDENV ]; then
	export PATH="$MY_NDENV/bin:$PATH"
	eval "$(ndenv init -)"
fi

MY_PYENV="$HOME/.pyenv"
if [ -d $MY_PYENV ]; then
	export PATH="$MY_PYENV/bin:$PATH"
	eval "$(pyenv init -)"
fi

MY_CABAL="$HOME/.cabal"
if [ -d $MY_CABAL ]; then
	export PATH="$MY_CABAL/bin:$PATH"
fi

#eval "$(hub alias -s)"

if [ -r ~/.zshenv.local ]; then
	. ~/.zshenv.local
fi
