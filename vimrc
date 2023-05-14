"----------------------------------------------------------------
"---------常规set设置--------------------------------------------
"----------------------------------------------------------------
"
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
	    \set guioptions-=T <Bar>
	    \set guioptions-=m <bar>
	    \else <Bar>
	    \set guioptions+=T <Bar>
	    \set guioptions+=m <Bar>
	    \endif<CR>
"剪切板共享
set clipboard+=unnamed
"字体
set guifont=Droid_Sans_Mono:h12
"让代码不自动换行
set nowrap
"去掉滚动条
set guioptions-=r 
set guioptions-=l 
set guioptions-=R 
set guioptions-=L 
"半透明
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 220) 
hi Normal guibg=NONE
"去掉缓存文件
set nobackup
set noundofile
set noswapfile
"防止乱码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set termencoding=cp936
language messages zh_CN.UTF-8
"自定义按键
let mapleader=","
let g:mapleader=","
syntax on "语法高亮
set autoindent
"更改缩进长度
set shiftwidth=4
set softtabstop=4
"set smartindent "C语言自动缩进
set number "显示行号
set wildmenu "用tab将命令展开
"默认先执行不高亮
exec "nohlsearch" 
set showcmd "底部显示命令
set incsearch "以下三条为搜索相关设置
set smartcase 
set ignorecase
set hlsearch "搜索时高亮
set cursorline                          "高亮当前行
set cursorcolumn                        "高亮当前列
set relativenumber                      "相对行号显示
set scrolloff=4 "光标不顶格
set winaltkeys=no

"----------------------------------------------------------------
"-----------xiaohu的自定义组合快捷键-----------------------------
"----------------------------------------------------------------
noremap <LEADER><CR> :nohlsearch<CR>	
noremap <C-n> :NERDTreeToggle<CR>
"自动补齐快捷键
vnoremap <C-w> :Tab /
noremap  <C-Up> 5k
noremap  <C-Down> 5j
noremap  <C-Right> 5l
noremap  <C-Left> 5h
"分屏大小调整
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-l> :vertical resize -5<cr>
nnoremap <M-h> :vertical resize +5<cr>
"保存不退出
noremap <c-s> :w<CR>
"退出不保存
noremap <LEADER>s :q!<CR>
noremap <C-t> :tabnew<CR>:NERDTree<CR>
map <f11> <esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<cr>
"noremap  <leader>n :tagbartoggle<cr>
"----------------------------------------------------------------
"------------plug安装插件----------------------------------------
"----------------------------------------------------------------
call plug#begin('d:\vim\vim90\plugged') 
"let g:plug_url_format = 'git@github.com:%s.git'
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/inkstained-vim'
Plug 'soft-aesthetic/soft-era-vim'
Plug 'sickill/vim-monokai'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'		        "数值对齐插件，快捷键ctrl+w
"Plug 'preservim/tagbar'                         "右侧函数展示
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline-themes'           
Plug 'preservim/nerdcommenter'		        "快捷注释
Plug 'yggdroot/indentline' 		        "显示代码缩进层次	
Plug 'vhda/verilog_systemverilog.vim'           "verilog语法识别，begin end自动缩进
Plug 'w0rp/ale' 		        "verilog语法检错
Plug 'itchyny/vim-cursorword' 	 	        "同变量下划线
"Plug 'neoclide/coc.nvim', {'branch': 'release'} "补全
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
"Plug 'Valloric/YouCompleteMe'
Plug 'yuttie/hydrangea-vim'
Plug 'morhetz/gruvbox'
"Plug 'jistr/vim-nerdtree-tabs'			"以下四项为nerdtree美化插件，配套字体nerd font需要下载
"Plug 'ryanoasis/vim-devicons'     	        "add beautiful icons besides files
"Plug 'Xuyuanp/nerdtree-git-plugin'   	        "display git status within Nerdtree
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "enhance devicons</nerdtree>
call plug#end()

"----------------------------------------------------------------
"--------------各个插件的具体设置--------------------------------
"----------------------------------------------------------------
"colorscheme config
autocmd vimenter * nested colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1 
let g:gruvbox_italicize_comments = 1
colorscheme gruvbox

"colorscheme zellner
"colorscheme inkstained
"colorscheme soft-era
"colorscheme monokai

"colorscheme config
"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 0 
"colorscheme tokyonight

"auto-pairs config
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})


"airline-scheme-config
"set t_Co=256
"set ttimeoutlen=50
"let g:airline_theme='powerlineish'
""let g:airline_theme='tokyonight'
""let g:airline_theme='gruvbox'
"let g:airline_powerline_fonts=1
""let g:airline#extensions#whitespace#enabled=0
""let g:airline#extensions#whitespace#symbol='!'
"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif
"let g:airline_detect_paste=0
"let g:airline#extensions#default#section_truncate_width = {'b': 79, 'x': 60, 'y': 55, 'z': 45}
"let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr} %1l%#restore#:%1v'
let g:airline#extensions#tabline#enabled = 1 "显示窗口tab和buffer
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#hunks#enabled = 1
set laststatus=2  "永远显示状态栏

"nerdtree config
let g:NERDChristmasTree = 1           "自动装饰漂亮，不过貌似没什么用
let g:NERDTreeWinSize = 20 

"apc_config
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b
" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
set shortmess+=c
:autocmd BufWinEnter * :ApcEnable
