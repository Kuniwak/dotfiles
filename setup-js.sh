#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_ndenv() {
	RECOMMENDED_NODE_VAR="v0.10.26"
	git clone git://github.com/riywo/ndenv.git "$HOME/.ndenv"
	git clone git://github.com/riywo/node-build.git "$HOME/.ndenv/plugins/node-build/"

	export PATH="$HOME/.ndenv/bin:$PATH"
	eval "$(ndenv init -)"

	ndenv install $RECOMMENDED_NODE_VAR
	ndenv global $RECOMMENDED_NODE_VAR
}

setup_jshint() {
	has ndenv || setup_ndenv
	npm -g jshint
	ndenv rehash
}

setup_grunt_cli() {
	has ndenv || setup_ndenv
	npm -g grunt_cli
	ndenv rehash
}

setup_node() {
	has jshint || setup_jshint
	has grunt || setup_grunt_cli
}

setup_node
