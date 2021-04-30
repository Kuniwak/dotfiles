has() {
	type "$1" > /dev/null 2>&1
}

if type vim > /dev/null 2>&1; then
	export EDITOR='vim'
	export GIT_EDITOR='vim'
	alias vi='vim'
else
	export EDITOR='vi'
	export GIT_EDITOR='vi'
fi

if [ -r ~/.zshenv.local ]; then
	. ~/.zshenv.local
fi
source "$HOME/.cargo/env"
