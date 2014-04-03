alias ls='ls -G'
alias la='ls -A'
alias ll='ls -lAh'
export PATH="/usr/local/bin:/usr/local/sbin:${PATH}"

# Use KaoriYa Vim
if [[ -d /Applications/MacVim.app ]]; then
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias gvim='/Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
fi

if [[ -d /Library/Frameworks/Python.framework/Versions/2.7 ]]; then
    # Setting PATH for Python 2.7
    # The orginal version is saved in .bash_profile.pysave
    export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
fi

if [[ -d /Library/Frameworks/Python.framework/Versions/3.3 ]]; then
    # Setting PATH for Python 3.3
    export PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
    alias pygettext='python3 /Library/Frameworks/Python.framework/Versions/3.3/share/doc/python3.3/examples/Tools/i18n/pygettext.py'
fi


# Setting PATH for npm
export PATH="/usr/local/share/npm/bin:${PATH}"

# Setting PATH for nodebrew
export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

# Setting PATH for googkit
if [[ -d "/usr/local/googkit" ]]; then
    export GOOGKIT_HOME="/usr/local/googkit"
    export PATH="${PATH}:${GOOGKIT_HOME}/bin"
    source "${GOOGKIT_HOME}/etc/completion/googkit.bash"
fi

# Stting anyenv
export PATH="${HOME}/.anyenv/bin:${PATH}"
eval "$(anyenv init -)"

# Setting rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Setting rvm
if which rvm > /dev/null; then
    [[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    PATH=${PATH}:${HOME}/.rvm/bin # Add RVM to PATH for scripting
fi

# Display a current branch name
if which git > /dev/null; then
    source "/usr/local/etc/bash_completion.d/git-prompt.sh"
    source "/usr/local/etc/bash_completion.d/git-completion.bash"

    GIT_PS1_SHOWDIRTYSTATE=true
    PS1='\[\033[32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[32m\]\h \[\033[36m\]\w \[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\] \[\033[0m\]\[\033[2;37m\]`date +"%Y/%m/%d %p %H:%M:%S"` \[\033[0m\]\n\\$ '
    export PS1=${PS1}
fi

# vim: et sw=4 ts=4
