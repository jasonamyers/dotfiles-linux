# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="simple"
#export ZSH_THEME="agnoster"
export DEFAULT_USER="jmyers"
export PGHOST=localhost
#default to using rednose for nosetests
export NOSE_REDNOSE=1

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias usb="sudo mount /dev/sdb1 /media/jmyers"
alias odintun="ssh -f odin -L 8001:odin:8000 -N"
alias tmux="TERM=screen-256color-bce tmux new -s jam"
alias ls='ls -G'
alias ll='ls -hlatr --color'
alias gg='history | grep'
#alias vim='~/Applications/MacVim.app/Contents/MacOS/Vim'
alias breakitdown="history | awk '{a[$2]++ } END{for(i in a){print a[i] ' ' i}}'|sort -rn |head -n 20"
alias cleanpyc='find . -type f -name "*.pyc" -delete'
alias startpost='sudo systemctl restart postgresql-9.3'
alias stoppost='sudo systemctl stop postgresql-9.3'
alias ppsql='sudo -u postgres psql'
alias cleanup='git branch --merged | grep -v master | grep -v "*" | cut -c3- | xargs -I {} git branch -d {}'
alias glist='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk '"'! a["'$0'"]++'"
alias startred='redis-server /usr/local/etc/redis.conf &'
alias work='workon health;cd health'
alias startwork='startpost; startred;workon health;cd health'
alias vpn='sudo vpnc '
alias vpnd='sudo vpnc-disconnect '
alias dynamo='java -Djava.library.path=~/dynamodb/DynamoDBLocal_lib -jar ~/dynamodb/DynamoDBLocal.jar'
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
alias tmux="TERM=screen-256color-bce tmux"
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
plugins=()

source $ZSH/oh-my-zsh.sh
source ~/.zsh/func/soma_fm
source ~/.zsh/func/pipp
# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/pgsql-9.3/bin/:/usr/local/heroku/bin:~/perl5/bin:/usr/lib/postgresql/9.3/bin/
export PERL5LIB=$PERL5LIB:~/perl5/lib/perl5
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYVER_ROOT=`pyenv prefix`
export PYVER_BIN="$PYVER_ROOT/bin"
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
nvm use 0.10
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python`
export PROJECT_HOME=$HOME/dev
if [[ -r $PYVER_BIN/virtualenvwrapper.sh ]]; then
    source $PYVER_BIN/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/go/bin
PERL_MB_OPT="--install_base \"/home/jmyers/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jmyers/perl5"; export PERL_MM_OPT;
#### EMMA THINGS ####
export LOCALEMMA_EMMA_BASE_DIR=~/dev/emma/
export LOCALEMMA_EMMADMIN_BASE_DIR=~/dev/emmadmin/
export LOCALEMMA_AUDIENCE_BASE_DIR=~/dev/audience/../

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export JAVA_HOME=/usr/java/latest/
export PATH="$PATH:$JAVA_HOME"

export TERM="xterm-256color"
#
# vvvv ---- Added by Pip Bootstrap ---- vvvv #
export STANDARD_CACHE_DIR="${HOME}/Library/Caches/org.pip-installer.pip";
export WHEELHOUSE="${STANDARD_CACHE_DIR}/Wheelhouse";
export PIP_USE_WHEEL="yes";
export PIP_DOWNLOAD_CACHE="${STANDARD_CACHE_DIR}/Downloads";
export PIP_FIND_LINKS="file://${WHEELHOUSE}";
export PIP_WHEEL_DIR="${WHEELHOUSE}";
# ^^^^ ---- Added by Pip Bootstrap ---- ^^^^ #
