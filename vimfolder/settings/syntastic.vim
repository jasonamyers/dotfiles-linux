"*****************************************
" Syntastic

  "*********************
  " Config
  "
  let g:syntastic_stl_format = '%E{%e Errors}%B{ [>] }%W{%w Warnings}'
  let g:syntastic_enable_signs = 1
  let g:syntastic_auto_loc_list=0
  let g:syntastic_loc_list_height=3
  let g:syntastic_python_checker = 'flake8'
  let g:syntastic_python_checker_args = "--max-complexity 13 --ignore=E501,E128"
  let g:syntastic_check_on_open=1

  run SyntasticEnable ruby
  run SyntasticEnable eruby
  run SyntasticEnable c
  run SyntasticEnable cpp
  run SyntasticEnable coffee
  run SyntasticEnable css
  run SyntasticEnable cucumber
  run SyntasticEnable sass
  run SyntasticEnable haml
  run SyntasticEnable less
  run SyntasticEnable html
  run SyntasticEnable xhtml
  run SyntasticEnable javascript
  run SyntasticEnable sh
