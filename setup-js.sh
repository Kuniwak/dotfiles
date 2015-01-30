#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_ndenv() {
	RECOMMENDED_NODE_VAR="v0.10.36"
	git clone git://github.com/riywo/ndenv.git "$HOME/.ndenv"
	git clone git://github.com/riywo/node-build.git "$HOME/.ndenv/plugins/node-build/"

	export PATH="$HOME/.ndenv/bin:$PATH"
	eval "$(ndenv init -)"

	ndenv install $RECOMMENDED_NODE_VAR
	ndenv global $RECOMMENDED_NODE_VAR
}

setup_jshint() {
	has ndenv || setup_ndenv
	npm install -g jshint
	ndenv rehash
}

setup_gulp() {
	has ndenv || setup_ndenv
	npm install -g gulp
	ndenv rehash
}

setup_node() {
	has jshint || setup_jshint
	has gulp || setup_gulp
}

setup_node
