#! /bin/zsh

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

if has npm; then
	export PATH="./node_modules/.bin:$PATH"
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

if has stack; then
	function stack_path_silent () {
		stack path $1 2> /dev/null
	}
	export PATH="$(stack_path_silent --local-bin-path):$PATH"
fi

SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

JAVA_HOME_DETECTOR="/usr/libexec/java_home"
if [ -x "$JAVA_HOME_DETECTOR" ]; then
	export JAVA_HOME="$($JAVA_HOME_DETECTOR)"
fi
