source ~/.bashrc
#export WORKON_HOME=~/envs
#export GIT_EDITOR="/usr/local/bin/mate -w" 
#source /usr/local/Cellar/git/1.7.2.3/etc/bash_completion.d/git-completion.bash
#source /usr/local/bin/virtualenvwrapper.sh
export PATH=/usr/local/Cellar/python/2.7.3/bin:/usr/local/share/python:/usr/local/bin:$PATH:~/bin:/usr/local/sbin:$HOME/.rbenv/bin
#export PATH="$PATH:~/git/git-achievements"
#alias git="git-achievements"
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
[ -r "$file" ] && source "$file"
done
unset file
