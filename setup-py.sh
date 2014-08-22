#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_pyenv() {
	RECOMMENDED_PY_VAR='3.4.1'
	git clone git://github.com/tokuhirom/pyenv.git "$HOME/.pyenv"
	git clone git://github.com/tokuhirom/Perl-Build.git "$HOME/.pyenv/plugins/perl-build/"

	export PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"

	pyenv install $RECOMMENDED_PY_VAR
	pyenv global $RECOMMENDED_PY_VAR
}

setup_pip() {
	has pyenv || setup_pyenv
	cwd=`pwd`
	trap "cd $cwd" 1 2 3 15

	cd /tmp
	curl -O https://bootstrap.pypa.io/get-pip.py
	sudo python get-pip.py
	cd $cwd
}

setup_flake8() {
	has pip || setup_pip
	sudo pip install flake8
	pyenv rehash
}

setup_python() {
	setup_pip
	setup_flake8
}

setup_python
