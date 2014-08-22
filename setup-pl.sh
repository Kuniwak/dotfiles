#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_plenv() {
	RECOMMENDED_PL_VAR="5.14.2"
	git clone git://github.com/tokuhirom/plenv.git "$HOME/.plenv"
	git clone git://github.com/tokuhirom/Perl-Build.git "$HOME/.plenv/plugins/perl-build/"

	export PATH="$HOME/.plenv/bin:$PATH"
	eval "$(plenv init -)"

	plenv install $RECOMMENDED_PL_VAR
	plenv global $RECOMMENDED_PL_VAR
}

setup_cpanm() {
	has plenv || setup_plenv
	plenv install-cpanm
	plenv rehash
}

setup_carton() {
	has plenv || setup_plenv
	has cpanm || setup_cpanm
	cpanm install Carton
	plenv rehash
}

setup_perlcritic() {
	has plenv || setup_plenv
	has cpanm || setup_cpanm
	cpanm install Perl::Critic
	plenv rehash
}

setup_perl() {
	has carton || setup_carton
	has perlcritic || setup_perlcritic
}

setup_perl
