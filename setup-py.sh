#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_pyenv() {
	git clone https://github.com/yyuu/pyenv.git "$HOME/.pyenv"
	git clone https://github.com/yyuu/pyenv-virtualenv.git "$HOME/.pyenv/plugins/pyenv-virtualenv"

	export PATH="$HOME/.pyenv/bin:$PATH"
	export PIP_REQUIRE_VIRTUALENV=true
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
}

setup_pip() {
	has pyenv || setup_pyenv
	cwd=`pwd`
	trap "cd $cwd" 1 2 3 15

	cd /tmp
	curl -O https://bootstrap.pypa.io/get-pip.py
	echo 'Type password or abort installation for pip.'
	python3 get-pip.py
	cd $cwd
}

setup_flake8() {
	has pip3 || setup_pip
	pip3 install flake8
	pyenv rehash
}

setup_python() {
	setup_pip
	setup_flake8
}

setup_python
