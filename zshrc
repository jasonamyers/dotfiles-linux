# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"
export DEFAULT_USER="jasonamyers"
export PGHOST=localhost

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tmux="TERM=screen-256color-bce tmux"
alias ls='ls -G'  
alias ll='ls -hlatr --color'
alias gg='history | grep'
#alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias breakitdown="history | awk '{a[$2]++ } END{for(i in a){print a[i] ' ' i}}'|sort -rn |head -n 20"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias ppsql='sudo -u postgres psql'
alias vga='xrandr --output VGA1 --auto --above LVDS1 && xrandr --output LVDS1 --auto'

alias pmr='python manage.py runserver'
alias pmshell='python manage.py shell'
alias pmdb='python manage.py dbshell'
alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v'
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff -w "$@" | vim'
alias gc='git commit -v'
alias gca='git commit -va'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR="vim"
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[ ]*:ls:ll:la:l:cd:pwd:exit:mc:su:df:clear"

export WORKON_HOME=$HOME/.virtualenv
export VIRTUALENVWRAPPER_PYTHON=`which python`
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PROJECT_HOME=$HOME/src
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, fabric, pip, redis-cli, sublime, tmux)

source $ZSH/oh-my-zsh.sh
# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
