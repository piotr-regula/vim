"==========================
"      Main opts
"==========================
"
set nu     "show line numbers / relative line numbers
set autoindent "set tabs
set softtabstop=4
set ts=4 sw=4 et "indent settings  tabstop , shift (>>) width, expandtab
set noea "set noequalalways - no window resize after close
set tw=0 "no automatic line breaks
filetype plugin on "enable filetype based plugins

set ignorecase " search case options
set smartcase
set incsearch "auto move to search string
set hlsearch
let mapleader =" "
let g:mapleader = " "
set novisualbell "dont flash screen
set noerrorbells         " don't beep
set t_vb= "visual beep disabled

set hidden "hidden buffer
set nobackup
set noswapfile

set bs=2 "working backspace

set history=10000         " remember more commands and search history
set undolevels=10000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.svn*,*.tmp*,*.orig,*.rej

set completeopt=longest,menuone "select longest common text from matches, show menu even with one match
"set clipboard=unnamed "let shift+insert work for default copy pasting
"config for viewing man pages in vim
let $PAGER=''

"==========================
"   visual configuration
"==========================
syntax on
colorscheme ir_black
set guifont=Monaco\ 11

set ruler
set nowrap
set nocompatible  "disable compatibility with older ver
set t_Co=256 "support for 256 colors
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set laststatus=2 "always display statusline

"================================================================
"       plugins
"================================================================

"pathogen enable
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_indent_levels = 3
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#575757   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#828282 ctermbg=4

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

"Mark
let g:mwDefaultHighlightingPalette = 'extended'

"grep
let Grep_Skip_Files='*.bak, *.svn*, *.tmp*, *.swp, *.swo, *.rej, *.orig, *.swm'
let Grep_Skip_Dirs = '.svn lteDo'

let g:ctrlp_max_depth=100
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = ""
let g:ctrlp_custom_ignore='.git$|\tmp$\|swp$'
let g:ctrlp_follow_symlings=1
let ctrlp_clear_cache_on_exit=1
