#!/bin/sh

set -u

has() {
	type "$1" > /dev/null 2>&1
}

setup_swiftenv() {
	git clone git://github.com/kylef/swiftenv.git "$HOME/.swiftenv"
}

setup_lints() {
	has swiftenv || setup_swiftenv
	brew install swiftlint
}

setup_swift() {
	setup_lints
}

setup_swift
