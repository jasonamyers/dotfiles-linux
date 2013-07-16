if has("autocmd")
" Autoload Filetypes:
  autocmd BufRead,BufNewFile {COMMIT_EDITMSG} setf gitcommit
  autocmd BufRead,BufNewFile {*.clj} setf clojure

  autocmd BufRead,BufNewFile {gitconfig} setf gitconfig

" Automagically Save Files When Focus Is Lost But Ignore Any Warnings:
  autocmd BufLeave,FocusLost,WinLeave,CmdwinLeave * silent! wall

" Spell Check When Writing Commit Logs:
  autocmd FileType svn,*commit* setlocal spell

" Remove Trailing Whitespace On Save:
  autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" Setup File Specific Settings:
  autocmd BufRead,BufNewFile *.txt call g:PersonalVim_SetupWrapping()

" Jump To Last Known Cursor Position When Opening A File:
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

" Resize Splits When The Window Is Resized:
  autocmd VimResized * exe "normal! \<c-w>="
end
