let g:pathogen_disabled = []
call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set backspace=indent,eol,start
set history=1000
set scrolloff=3 

set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

set showcmd
set showmode

set hlsearch
set incsearch

set softtabstop=4
set tabstop=4
set shiftwidth=4

set foldmethod=indent
set foldlevel=99
"set nofoldenable

set hidden

set ruler
set laststatus=2
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set vb
set shiftround
set nobackup        " do not keep a backup file
set noswapfile
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
set undolevels=200
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

syntax on
set expandtab
set sm
set smarttab
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
else
    "colorscheme vibrantink   " use this color scheme
    "colorscheme grb256
    set background=dark   " adapt colors for background
    let g:Powerline_colorscheme = 'solarized256'
    let g:Powerline_theme = 'solarized256'
    let g:Powerline_symbols = "fancy"
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_visibility="high"
    let g:solarized_contract="high"
    colorscheme solarized
    set guifont=Menlo:h14.00  " use this font
endif

if has("gui_running")
    set cursorline
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
    au FileType py set foldmethod=indent
    au FileType py set textwidth=79  " PEP-8 friendly
    au FileType py inoremap # X#
    au FileType py set expandtab
    au FileType py set omnifunc=pythoncomplete#Complete
    autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    
    " Automatically chmod +x Shell scripts
    au BufWritePost   *.sh             !chmod +x %

    au BufNewFile,BufRead *.jinja2 set filetype=html
    
endif

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
