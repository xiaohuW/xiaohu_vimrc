"____                 _  __     _____ __  __ ____   ____ 
"/ ___| ___   ___   __| | \ \   / /_ _|  \/  |  _ \ / ___|
"| |  _ / _ \ / _ \ / _` |  \ \ / / | || |\/| | |_) | |    
"| |_| | (_) | (_) | (_| |   \ V /  | || |  | |  _ <| |___ 
"\____|\___/ \___/ \__,_|    \_/  |___|_|  |_|_| \_\\____|
"_            __  _____              _   _       
"| |__  _   _  \ \/ /_ _|__ _  ___   | | | |_   _ 
"| '_ \| | | |  \  / | |/ _` |/ _ \  | |_| | | | |
"| |_) | |_| |  /  \ | | (_| | (_) | |  _  | |_| |
"|_.__/ \__, | /_/\_\___\__,_|\___/  |_| |_|\__,_|
"       |___/                                     

"----------------------------------------------------------------
"---------常规set设置--------------------------------------------
"----------------------------------------------------------------
"自定义按键
let mapleader=","
let g:mapleader=","
syntax on "语法高亮
set smartindent "C语言自动缩进
set number "显示行号
set wildmenu "用tab将命令展开
"默认先执行不高亮
exec "nohlsearch" 
set showcmd "底部显示命令
set incsearch "以下三条为搜索相关设置
set smartcase 
set ignorecase
set hlsearch "搜索时高亮
set cursorline "定位行显示
set scrolloff=4 "光标不顶格

"----------------------------------------------------------------
"-----------xiaohu的自定义组合快捷键-----------------------------
"----------------------------------------------------------------
noremap <LEADER><CR> :nohlsearch<CR>	
noremap <C-n> :NERDTreeToggle<CR>
"自动补齐快捷键
vnoremap <C-w> :Tab /
noremap  <C-Up> 4k
noremap  <C-Down> 4j
noremap  <C-Right> 4l
noremap  <C-Left> 4h
noremap  <LEADER>n :TagbarToggle<CR>

"----------------------------------------------------------------
"------------Plug安装插件----------------------------------------
"----------------------------------------------------------------
call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'git@github.com:%s.git'
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim'
Plug 'scrooloose/nerdtree'
Plug 'crusoexia/vim-monokai'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'		        "数值对齐插件，快捷键ctrl+w
Plug 'preservim/tagbar'                         "右侧函数展示
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline-themes'           
Plug 'preservim/nerdcommenter'		        "快捷注释
Plug 'Yggdroot/indentLine' 		        "显示代码缩进层次	
Plug 'vhda/verilog_systemverilog.vim'           "verilog语法识别，begin end自动缩进
Plug 'dense-analysis/ale' 		        "verilog语法检错
Plug 'itchyny/vim-cursorword' 	 	        "同变量下划线
Plug 'yuttie/hydrangea-vim'
Plug 'morhetz/gruvbox'
Plug 'jistr/vim-nerdtree-tabs'			"以下四项为nerdtree美化插件，配套字体nerd font需要下载
Plug 'ryanoasis/vim-devicons'     	        "add beautiful icons besides files
Plug 'Xuyuanp/nerdtree-git-plugin'   	        "display git status within Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "enhance devicons</nerdtree>
call plug#end()

"----------------------------------------------------------------
"--------------各个插件的具体设置--------------------------------
"----------------------------------------------------------------
"colorscheme config
"autocmd vimenter * nested colorscheme gruvbox
"set bg=dark
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 1 
"let g:gruvbox_italicize_comments = 1
"colorscheme gruvbox

"colorscheme config
set termguicolors
let g:tokyonight_style = 'night' " available: night, stormW
let g:tokyonight_enable_italic = 0 
colorscheme tokyonight

"auto-pairs config
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

"airline-scheme-config
"set laststatus=2  "永远显示状态栏
"let g:airline_powerline_fonts = 1  " 支持 powerline 字体
"let g:airline#extensions#tabline#enabled = 1 "显示窗口tab和buffer
"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'

"airline-scheme-config
set t_Co=256
set ttimeoutlen=50
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
"let g:airline#extensions#whitespace#enabled=0
"let g:airline#extensions#whitespace#symbol='!'
set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
if has("gui_running") && &enc == 'utf-8' && &fenc == 'utf-8'
	let g:airline_left_sep = '⮀'
	let g:airline_left_alt_sep = '⮁'
	let g:airline_right_sep = '⮂'
	let g:airline_right_alt_sep = '⮃'
	let g:airline_symbols.branch = '⭠'
	let g:airline_symbols.readonly = '⭤'
	let g:airline_symbols.linenr = '⭡'
else
	let g:airline_left_sep = '▶'
	let g:airline_left_alt_sep = '▶'
	let g:airline_right_sep = '◀'
	let g:airline_right_alt_sep = '◀'
	let g:airline_symbols.branch = '|'
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = 'LN'
endif
let g:airline_detect_paste=0
let g:airline#extensions#default#section_truncate_width = {'b': 79, 'x': 60, 'y': 55, 'z': 45}
let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr} %1l%#restore#:%1v'
let g:airline#extensions#tabline#enabled = 1 "显示窗口tab和buffer
set laststatus=2  "永远显示状态栏

"保存时自动缩进
augroup autoindent
	au!
	autocmd BufWritePre * :normal migg=G`i
augroup End

"ale语法检查防止vim卡顿
let g:ale_cache_executable_check_failures = 1

"tagbar config
let g:tagbar_ctags_bin = 'ctags'      "tagbar以来ctags插件
let g:tagbar_left = 0                 "让tagbar在页面右侧显示，默认右边
let g:tagbar_width = 25               "设置tagbar的宽度为28列，默认40
let g:tagbar_autofocus = 1            "默认在vim打开的文件内
let g:tagbar_sort = 1                 "设置标签排序，默认排序

"nerdtree config
let g:NERDChristmasTree = 1           "自动装饰漂亮，不过貌似没什么用
let g:NERDTreeWinSize = 25 
