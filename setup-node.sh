#!/bin/sh

set -eu

has() {
	type "$1" > /dev/null 2>&1
}

install_nodenv() {
	git clone https://github.com/nodenv/nodenv.git "$HOME/.nodenv"

	export PATH="$HOME/.nodenv/bin:$PATH"
	eval "$(nodenv init -)"

	mkdir -p "$(nodenv root)"/plugins
	git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
}

setup_nodenv() {
	RECOMMENDED_NODE_VAR=20.12.0

	nodenv install --skip-existing "$RECOMMENDED_NODE_VAR"
	nodenv global "$RECOMMENDED_NODE_VAR"
}

setup_node() {
	has nodenv || install_nodenv
	setup_nodenv

	npm install -g js-beautify css-semdiff jsonlint

	nodenv rehash
}

setup_node
