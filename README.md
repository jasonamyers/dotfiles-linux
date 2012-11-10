=== JAM dotfiles ===

This is my collection of dot files for my mac systems. Greatly copied from binarydud.

To use them:

git clone it into your home directory
rename your current .bash_profile .bashrc .vim .vimrc
ln -s ~/dotfiles/bash_profile .bash_profile
ln -s ~/dotfiles/bashrc .bashrc
ln -s ~/dotfiles/vimfolder .vim
ln -s ~/dotfiles/vimrc .vimrc
You might also need the following:

Homebrew - ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew doctor
homebrew install git bash-completion python
