=== JAM dotfiles ===

This is my collection of dot files for my mac systems. Greatly copied from binarydud.

To use them:

* git clone it into your home directory
* rename your current .bash_profile .bashrc .vim .vimrc
* ln -s ~/dotfiles/bash_profile .bash_profile
* ln -s ~/dotfiles/bashrc .bashrc
* ln -s ~/dotfiles/vimfolder .vim
* ln -s ~/dotfiles/vimrc .vimrc


You might also need the following first:

Homebrew - 
* ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
* brew doctor
* brew install git bash-completion python
* git config --global color.ui auto
* git config --global core.autocrlf input
* git config --global user.name "Name"
* git config --global user.email "name@domain.com"

* git config --global core.excludesfile "~/.gitignore"

* add .DS_Store and thumbs.db to that file

* git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
