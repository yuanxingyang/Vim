syn on
"common conf {{             通用配置 
"set ai                      "自动缩进 
set bs=2                    "在insert模式下用退格键删除 
set showmatch               "代码匹配 
set laststatus=2            "总是显示状态行 
"set expandtab               "以下三个配置配合使用，设置tab和缩进空格数 
"set shiftwidth=4 
"set tabstop=4 
set cursorline              "为光标所在行加下划线 
set cursorcolumn
"set number                  "显示行号 
set autoread                "文件在Vim之外修改过，自动重新读入 
set mouse=c                 "ssh copy
set ignorecase              "检索时忽略大小写 
set fileencodings=uft-8,gbk "使用utf-8或gbk打开文件 
"set hls                     "检索时高亮显示匹配项 
set helplang=cn             "帮助系统设置为中文 
set hlsearch
"set foldmethod=marker       "代码折叠 
"set previewwindow
"}}

autocmd! bufwritepost $HOME/.vimrc source %

"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
"let mapleader = ','
"noremap <C-l> gt
"nnoremap <C-h> gT
"nnoremap <leader>t : tabe<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap  <C-j>   <Down>
inoremap  <C-k>   <Up>
function! UpdateCtags()
	let curdir=getcwd()
	while !filereadable("./tags")
		cd ..
		if getcwd() == "/"
			break
		endif
	endwhile
	if filewritable("./tags")
		!./genTags.sh 
	endif
	execute ":cd " . curdir
endfunction

nmap <F10> :call UpdateCtags()<CR> 
"开始使用Vundle的必须配置
"set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"使用Vundle来管理Vundle
"Bundle 'gmarik/vundle'

"PowerLine插件 状态栏增强展示
"Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
"set laststatus=2
"set t_Co=256
"let g:Powline_symbols='fancy'

Bundle 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
let g:ycm_show_diagnostics_ui = 0
"nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"Vundle配置必须 开启插件

Bundle 'Colour-Sampler-Pack'

Bundle 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=100
let g:tagbar_autofocus = 1
map <F3> :Tagbar<CR>

Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

"Bundle 'fholgado/minibufexpl.vim'
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplMoreThanOne=0
"map <F4> :MBEbp<CR>
"map <F5> :MBEbn<CR>

Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

Bundle 'Yggdroot/LeaderF',{ 'do': './install.sh' }
let g:Lf_ShortcutF = '<C-f>'
"let g:Lf_RootMarkers = 'genTags.sh'
"let g:Lf_WorkingDirectoryMode = 'AcF'

syntax on
colorscheme private
filetype plugin indent on
set showmode
set tags=./tags;,tags
