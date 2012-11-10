export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-color 
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

alias ls='ls -G'  
alias ll='ls -hlatr --color'
alias gg='history | grep'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

export GIT_EDITOR="mvim" 
#source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='[mattgeorge:\w$(__git_ps1)] \[\033[01;32m\]\u\[\033[00m\]\$ '
#export PS1='[\u@\h:\w$(__git_ps1)] \[\033[01;32m\]\u\[\033[00m\]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
export COMMAND_MODE=unix2003
export TM_PYCHECKER=pylint

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR="vim"

#borrowed from MITSUHIKO
MY_DEFAULT_COLOR="[00m"
MY_GRAY_COLOR="[37m"
MY_PINK_COLOR="[35m"
MY_GREEN_COLOR="[32m"
MY_ORANGE_COLOR="[33m"
MY_RED_COLOR="[31m"
if [ `id -u` == '0' ]; then
  MY_USER_COLOR=$MY_RED_COLOR
else
  MY_USER_COLOR=$MY_PINK_COLOR
fi

export MY_BASEPROMPT='\e${MY_USER_COLOR}\u\
\e${MY_GRAY_COLOR}@\e${MY_ORANGE_COLOR}\h \
\e${MY_GRAY_COLOR}in \e${MY_GREEN_COLOR}\w\
\e${MY_GRAY_COLOR}$(__git_ps1)\e${MY_DEFAULT_COLOR}'
export PS1="${MY_BASEPROMPT}
$ "
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:ls:ll:la:l:cd:pwd:exit:mc:su:df:clear"

export WORKON_HOME=$HOME/.virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/Cellar/python/2.7.3/bin/python
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PROJECT_HOME=$HOME/Develop
if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
    source /usr/local/share/python/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
