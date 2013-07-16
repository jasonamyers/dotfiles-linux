"*********************
" Custom Syntax Highlighting

" Highlight Trailing Whitespace:
call matchadd('Error', '\s\+\%#\@<!$', 20)

" Highlight Spaces In Front Of REAL Tabs:
call matchadd('Error', ' \+\ze\t', 20)
