if type vim > /dev/null 2>&1; then
	EDITOR=vim
else
	EDITOR=vi
fi
export EDITOR

if [ -r ~/.zshenv.local ]; then
	. ~/.zshenv.local
fi
