#! /bin/zsh

MY_RBENV="$HOME/.rbenv"
if [[ -d $MY_RBENV ]]; then
	export PATH="$MY_RBENV/bin:$MY_RBENV/shims:$PATH"
	eval "$(rbenv init -)"
fi

MY_PLENV="$HOME/.plenv"
if [[ -d $MY_PLENV ]]; then
	export PATH="$MY_PLENV/bin:$MY_PLENV/shims:$PATH"
	eval "$(plenv init -)"
fi

MY_NDENV="$HOME/.ndenv"
if [[ -d $MY_NDENV ]]; then
	export PATH="$MY_NDENV/bin:$MY_NDENV/shims:$PATH"
	eval "$(ndenv init -)"
fi

MY_DENV="$HOME/.denv"
if [[ -d $MY_DENV ]]; then
	export PATH="$MY_DENV/bin:$MY_DENV/shims:$PATH"
	eval "$(denv init -)"
fi

if has npm; then
	export PATH="./node_modules/.bin:$PATH"
fi

MY_PYENV="$HOME/.pyenv"
if [[ -d $MY_PYENV ]]; then
	export PYENV_ROOT=$MY_PYENV
	export PATH="$MY_PYENV/bin:$MY_PYENV/shims:$PATH"
	eval "$(pyenv init -)"

	if [[ -d "$MY_PYENV/plugins/pyenv-virtualenv" ]];then
		eval "$(pyenv virtualenv-init -)"
	fi
fi

export GOENV_ROOT="$HOME/.goenv"
if [[ -x "$GOENV_ROOT" ]]; then
	export PATH="$GOENV_ROOT/bin:$PATH"
	eval "$(goenv init -)"

	export GOPATH="$HOME/.go"
	export PATH="$PATH:$GOPATH/bin"
fi

MAC_PYTHON_DIR="$HOME/Library/Python"
if [[ -d "$MAC_PYTHON_DIR" ]]; then
	for pip_dir in $(find "$MAC_PYTHON_DIR" -type d -depth 1); do
		export PATH="$pip_dir/bin:$PATH"
	done
fi

SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [[ $SSH_AUTH_SOCK != $SOCK ]]
then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

MY_CARGO="$HOME/.cargo"
if [[ -d $MY_CARGO ]]; then
	export PATH="$MY_CARGO/bin:$PATH"
fi

MY_SWIFTENV="$HOME/.swiftenv"
if [[ -d $MY_SWIFTENV ]]; then
	export SWIFTENV_ROOT="$MY_SWIFTENV"
	export PATH="$MY_SWIFTENV/bin:$PATH"
	eval "$(swiftenv init -)"
fi


JAVA_HOME_DETECTOR="/usr/libexec/java_home"
if [[ -x "$JAVA_HOME_DETECTOR" ]]; then
	export JAVA_HOME="$($JAVA_HOME_DETECTOR)"
fi
