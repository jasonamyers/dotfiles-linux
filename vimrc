set nocompatible

source ~/.vim/bundles.vim
source ~/.vim/functions.vim
source ~/.vim/keybindings.vim

for f in split(glob('~/.vim/settings/*.vim'), '\n')
    exe 'source' f
endfor

source ~/.vim/global.vim
source ~/.vim/auto_commands.vim
source ~/.vim/syntax.vim
