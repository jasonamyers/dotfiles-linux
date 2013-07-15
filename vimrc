let g:pathogen_disabled = []
""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

set nocompatible
set backspace=indent,eol,start
" Sets how many lines of history VIM has to remember
set history=1000
" Set how many lines below cursor on scroll
set scrolloff=3 

set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Shows info about current command
set showcmd
" Shows mode
set showmode

" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

" 1 tab == 4 spaces
set softtabstop=4
set tabstop=4
set shiftwidth=4

set foldmethod=indent
set foldlevel=1
"set nofoldenable

set hidden

set ruler
" Always show the status line
set laststatus=2
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set vb
set shiftround      " Move Len(shiftwidth-1) on >> <<
set nobackup        " do not keep a backup file
set noswapfile      " don't use swap files
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set ignorecase      " ignore case when searching
set nowrap          " stop lines from wrapping
set noignorecase   " don't ignore case
set ttyfast         " smoother changes
set bs=2            " Backspace can delete previous characters
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set undolevels=200  " keep 200 undos
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)] 

set noautoindent    " turn off by default, enable for specific filetypes
set nosmartindent   " turn off by default, enable for specific filetypes
set nocindent       " turn off by default, enable for specific filetypes

let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" VCS Command Configs
let mapleader = ","
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
nnoremap   <Up>     <NOP>
nnoremap   <Down>   <NOP>
nnoremap   <Left>   <NOP>
nnoremap   <Right>  <NOP>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
autocmd Syntax html,vim inoremap < <lt>><Left>
function! IsEmptyPair(str)
    for pair in split( &matchpairs, ',' ) + [ "''", '""', '``' ]
        if a:str == join( split( pair, ':' ),'' )
            return 1
        endif
    endfor
    return 0
endfunc
function! WithinEmptyPair()
    let cur = strpart( getline('.'), col('.')-2, 2 )
    return IsEmptyPair( cur )
endfunc
function! SkipDelim(char)
    let cur = strpart( getline('.'), col('.')-2, 3 )
    if cur[0] == "\\"
        return a:char
    elseif cur[1] == a:char
        return "\<Right>"
    elseif cur[1] == ' ' && cur[2] == a:char
        return "\<Right>\<Right>"
    elseif IsEmptyPair( cur[0] . a:char )
        return a:char . "\<Left>"
    else
        return a:char
    endif
endfunc
inoremap <expr> ) SkipDelim(')')
inoremap <expr> ] SkipDelim(']')
inoremap <expr> } SkipDelim('}')
inoremap <expr> ' SkipDelim("'")
inoremap <expr> " SkipDelim('"')
inoremap <expr> ` SkipDelim('`')
inoremap <expr> <BS>    WithinEmptyPair() ? "\<Right>\<BS>\<BS>"      : "\<BS>"
inoremap <expr> <CR>    WithinEmptyPair() ? "\<CR>\<CR>\<Up>"         : "\<CR>"
inoremap <expr> <Space> WithinEmptyPair() ? "\<Space>\<Space>\<Left>" : "\<Space>"
vmap q( s()<C-R>"<Esc>
vmap q) s()<C-R>"<Esc>
vmap q[ s[]<C-R>"<Esc>
vmap q] s[]<C-R>"<Esc>
vmap q{ s{}<C-R>"<Esc>
vmap q} s{}<C-R>"<Esc>
vmap q' s''<C-R>"<Esc>
vmap q" s""<C-R>"<Esc>
vmap q` s``<C-R>"<Esc>

" Enable syntax highlighting
syntax on
" Use spaces instead of tabs
set expandtab
" Show matching braces
set sm
" Be smart when using tabs ;)
set smarttab
" Set term to 256 Colors
set t_Co=256
if has("gui_running")
    " See ~/.gvimrc
    set guifont=Menlo:h14.00  " use this font
    set background=dark   " adapt colors for background
    set guioptions-=T
    set list 
    set listchars=tab:▷⋅,trail:⋅,nbsp:⋅ " mark trailing white space
    autocmd filetype html,xml set listchars-=tab:▷⋅.
    colorscheme jellybeans
    set cursorline
else
    set background=dark   " adapt colors for background
    let g:airline_powerline_fonts=1
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_visibility="high"
    let g:solarized_contract="high"
    colorscheme solarized
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14.00  " use this font
endif

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,py,asp  set autoindent
    au FileType cpp,c,java,sh,pl,php,py,asp  set smartindent
    au FileType cpp,c,java,sh,pl,php,py,asp  set cindent
    let python_version_2 = 1
    let python_highlight_all = 1
    syntax on
    au FileType py syn keyword pythonDecorator True None False self
    au FileType py set foldmethod=indent
    au FileType py set textwidth=79  " PEP-8 friendly
    au FileType py inoremap # X#
    au FileType python inoremap <buffer> $r return 
    au FileType python inoremap <buffer> $i import 
    au FileType python inoremap <buffer> $p print 
    au FileType python map <buffer> <leader>1 /class 
    au FileType python map <buffer> <leader>2 /def 
    au FileType python map <buffer> <leader>C ?class 
    au FileType python map <buffer> <leader>D ?def 
    au FileType py set expandtab
    au FileType py set omnifunc=pythoncomplete#Complete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
    autocmd BufWritePost *.js JSLint
    autocmd BufEnter * :syntax sync fromstart

    " Automatically chmod +x Shell scripts
    au BufWritePost   *.sh             !chmod +x %
    au BufNewFile,BufRead *.jinja2 set filetype=html
endif

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
map <F1> :bnext<cr>
map <F2> :bprevious<cr>
map <F4> :Bclose<cr>
set pastetoggle=<F5>

" Show me where I'm exceeding 80 chars on a line
:match ErrorMsg '\%>80v.\+'


" When auto-completing items, 2nd tab shows a list when multiple matches
set wildmode=longest,list
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif


map ` :NERDTreeToggle<CR>" map F3 to open NERDTree
map ~ :FuzzyFinderBuffer<CR>
map <leader>ft :%s/	/    /g<CR> " replace all tabs with 4 spaces
map <silent> <C-N> :silent noh<CR> " turn off highlighted search
map <F7> :TlistToggle<CR> " map F7 to toggle the Tag Listing
 

set enc=utf-8
set fileformats=unix,dos,mac
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=3
:command C let @/=""
" Syntastic checks syntax with flake8/pyflakes/pylint
let g:syntastic_python_checker = 'flake8'
" flake8 - Warn when complexity over 12 in flakes, ignore longline warnings on PEP8
let g:syntastic_python_checker_args = "--max-complexity 13 --ignore=E501,E128"
" Check files on open and save
let g:syntastic_check_on_open=1
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
