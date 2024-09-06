#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_rbenv() {
	RECOMMENDED_RB_VAR="3.3.0"
	git clone https://github.com/sstephenson/rbenv "$HOME/.rbenv"
	git clone https://github.com/sstephenson/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"

	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"

	rbenv install $RECOMMENDED_RB_VAR
	rbenv global $RECOMMENDED_RB_VAR
}

setup_carton() {
	has rbenv || setup_rbenv
	gem install bundler
	rbenv rehash
}

setup_rubocop() {
	has rbenv || setup_rbenv
	gem install rubocop
	rbenv rehash
}

setup_ruby() {
	has rbenv || setup_rbenv
	has rubocop || setup_rubocop
}

setup_ruby
