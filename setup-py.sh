#!/bin/sh

set -e
set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_pyenv() {
	git clone git://github.com/tokuhirom/pyenv.git "$HOME/.pyenv"
	git clone git://github.com/tokuhirom/Perl-Build.git "$HOME/.pyenv/plugins/perl-build/"

	export PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"

	pyenv install $RECOMMENDED_PL_VAR
	pyenv global $RECOMMENDED_PL_VAR
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
}
