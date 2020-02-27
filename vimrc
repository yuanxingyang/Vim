set tags=./.tags;,.tags

set bs=2   " enable delete feature under insert mode for Backspace 
set cursorcolumn   "show the column where the cursor
set cursorline     
set hls      "highligh search result
set autoread  " auto reload 

call plug#begin('~/.vim/plugged')
"-------------- nerdtree
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' } 
let NERDTreeWinSize=30
let NERDTreeWinPos='left'
map <F2> :NERDTreeToggle<CR>

"-------------- tagbar
Plug 'majutsushi/tagbar' , { 'on':  'Tagbar' }
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=100
let g:tagbar_autofocus = 1
map <F3> :Tagbar<CR>

"-------------- aireline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum' "'molokai'
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒 '
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"-------------- Code remove and comment 
Plug 'tomtom/tcomment_vim'

"Plug 'godlygeek/tabular'

"-------------- Code indentation line
Plug 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

"-------------- auto generate tags file
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.root']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"-------------- YouCompleteMe
Plug 'Valloric/YouCompleteMe' , { 'for': ['s', 'S', 'c', 'h', 'hpp','C', 'cpp', 'cc', 'cxx'] }
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_cache_omnifunc=0
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tag_files = 1 
let g:ycm_show_diagnostics_ui = 0
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif " disable YCM when the mode is not insert
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"-------------- static c/c++ code check
Plug 'w0rp/ale', { 'for': ['s', 'S', 'c', 'h', 'hpp','C', 'cpp', 'cc', 'cxx', 'py', 'sh', 'mk', 'makefile', 'Makefile'] }
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

call plug#end()
