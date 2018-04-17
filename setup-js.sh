#!/bin/sh

set -eu

has() {
	type "$1" > /dev/null 2>&1
}

setup_ndenv() {
	RECOMMENDED_NODE_VAR="v8.11.1"
	git clone git://github.com/riywo/ndenv.git "$HOME/.ndenv"
	git clone git://github.com/riywo/node-build.git "$HOME/.ndenv/plugins/node-build/"

	export PATH="$HOME/.ndenv/bin:$PATH"
	eval "$(ndenv init -)"

	ndenv install $RECOMMENDED_NODE_VAR
	ndenv global $RECOMMENDED_NODE_VAR
}

setup_lints() {
	has ndenv || setup_ndenv
	npm install -g jshint eslint jsonlint
	ndenv rehash
}

setup_debug_tools() {
	has ndenv || setup_ndenv
	npm install -g js-beautify css-semdiff
	ndenv rehash
}

setup_typescript() {
	has ndenv || setup_ndenv
	npm install -g tslint typescript
	ndenv rehash
}

setup_gulp() {
	has ndenv || setup_ndenv
	npm install -g gulp-cli
	ndenv rehash
}

setup_node() {
	setup_lints
	setup_debug_tools
	setup_gulp
	setup_typescript
}

setup_node
