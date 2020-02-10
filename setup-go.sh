#!/bin/sh

set -eu

has() {
	type "$1" > /dev/null 2>&1
}

setup_goenv() {
	git clone git@github.com:syndbg/goenv.git "$HOME/.goenv"

	export PATH="$HOME/.goenv/bin:$PATH"
	eval "$(goenv init -)"
}

setup_goenv
