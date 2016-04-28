#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_denv() {
	RECOMMENDED_PL_VAR="dmd-2.071.0"
	git clone git://github.com/repeatedly/denv.git "$HOME/.denv"

	export PATH="$HOME/.denv/bin:$PATH"
	eval "$(denv init -)"

	denv install $RECOMMENDED_PL_VAR
	denv global $RECOMMENDED_PL_VAR
}


setup_d() {
	setup_denv
}

setup_d
