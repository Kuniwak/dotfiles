#! /bin/zsh

MY_RBENV="$HOME/.rbenv"
if [[ -d $MY_RBENV ]]; then
	export PATH="$MY_RBENV/bin:$MY_RBENV/shims:$PATH"
	eval "$(rbenv init -)"
fi

if has gem; then
	GEM_USER_PATH="$(gem environment gempath | cut -f 1 -d :)"
	export PATH="$GEM_USER_PATH/bin:$PATH"
fi

MY_PLENV="$HOME/.plenv"
if [[ -d $MY_PLENV ]]; then
	export PATH="$MY_PLENV/bin:$MY_PLENV/shims:$PATH"
	eval "$(plenv init -)"
fi

MY_NDENV="$HOME/.nodenv"
if [[ -d $MY_NDENV ]]; then
	export PATH="$MY_NDENV/bin:$PATH"
	eval "$(nodenv init -)"
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
fi

export GOENV_ROOT="$HOME/.goenv"
if [[ -x "$GOENV_ROOT" ]]; then
	export PATH="$GOENV_ROOT/bin:$GOENV_ROOT/shims:$PATH"
	eval "$(goenv init -)"

	export GOPATH="$HOME/go"  # XXX: goenv force to use it...
	export GOBIN="$GOPATH/bin"
	export PATH="$PATH:$GOPATH/bin"
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

SDKMAN_DIR="$HOME/.sdkman"
if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
	source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

ANDROID_DIR="$HOME/Library/Android"
if [[ -d "$ANDROID_DIR" ]]; then
	export PATH="$ANDROID_DIR/sdk/ndk-bundle:$ANDROID_DIR/sdk/platform-tools:$ANDROID_DIR/sdk/tools/bin:$PATH"
fi

DOTNET_DIR="$HOME/.dotnet"
if [[ -d "$DOTNET_DIR" ]]; then
	export PATH="$PATH:$DOTNET_DIR/tools"
fi

# opam configuration
OPAM_DIR="$HOME/.opam"
if [[ -d "$OPAM_DIR" ]]; then
	eval $(opam env)
fi

FLUTTER_DIR="$HOME/flutter"
if [[ -d "$FLUTTER_DIR" ]]; then
	export PATH="$PATH:$FLUTTER_DIR/bin"
fi

LOCAL_DIR="$HOME/.local"
if [[ -d $LOCAL_DIR ]]; then
	export PATH="$LOCAL_DIR/bin:$PATH"
fi
