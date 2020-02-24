"==========================
"      Main opts
"==========================

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
let mapleader =","
let g:mapleader = ","
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
"blink closing tag in insert mode
set showmatch
"match angle brackets
set matchpairs+=<:>
"enable dictionary completion
set complete+=k

"workaround for gx in gvim (open url links)
let g:netrw_browsex_viewer="setsid xdg-open"
"==========================
"   visual configuration
"==========================

syntax on
colorscheme darktooth
set ruler
set nowrap
set nocompatible  "disable compatibility with older ver
set t_Co=256 "support for 256 colors
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set linespace =-2  "fix for white borders
set laststatus=2 "always display statusline
hi clear Conceal "clear conceal background

"==========================
"       plugins
"==========================

let g:asyncRunCommand='AsyncRun'

"pathogen enable
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_indent_levels = 3
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#575757 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#828282 ctermbg=4

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

"Mark
let g:mwDefaultHighlightingPalette = 'extended'

"grep
let Grep_Skip_Files='*.bak, *.svn*, *.tmp*, *.swp, *.swo, *.rej, *.orig, *.swm'
let Grep_Skip_Dirs = '.svn lteDo'

"keep multiple cursors
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

"neosnippets (For snippet_complete marker)
if has('conceal')
  set conceallevel=2 concealcursor=i
  endif
let g:neosnippet#snippets_directory=['~/.vim/bundle/neosnippet-snippets/neosnippets','~/.vim/bundle/neosnippet-snippets/mySnippets']

"ttcnSupport
let g:ttcnRootPath = '~/lte/trunk/'

"pythonSupport
let g:pymode = 0
let g:pymode_rope = 0
let g:pymode_folding = 0

"fzf
set rtp+="~/.fzf"  "add fzf location to runtime path

"myConfig
let g:gmockGenCmd = '~/devTools/generator/gmock_gen.py'

"latexBox
let g:LatexBox_split_type="new"

"clang format
let g:clang_format#command="clang-format-3.8"

"makeSidePanel
let g:makePanelCmd='make -f ~/lte/trunk/remote-cplane/Makefile'
let g:makePanelTargetListLocation='~/.MakeTargets.txt'
let g:makePanelRootPath='~/lte/trunk/'

"startify
let g:startify_bookmarks = [ '~/.vimrc','~/.bashrc','~/lte/trunk' ]
let g:startify_files_number = 10
let g:startify_enable_special = 0
let g:startify_list_order = [
        \ [' Recent files'],
        \ 'files',
        \ [' Sessions'],
        \ 'sessions',
        \ [' Bookmarks'],
        \ 'bookmarks',
        \ ]
let g:startify_custom_header = [
\ "                                .d$$b                                                                                                                  ",
\ "                              .' TO$;\                                                                                                                 ",
\ "                             /  : TP._;                                                                                                                ",
\ "                            / _.;  :Tb|                   ▄████████    ▄████████   ▄▄▄▄███▄▄▄▄   ███    █▄     ▄████████    ▄████████  ▄█                                                                                                       ",
\ "                           /   /   ;j$j                  ███    ███   ███    ███ ▄██▀▀▀███▀▀▀██▄ ███    ███   ███    ███   ███    ███ ███                                                                                                       ",
\ "                       _.-\"       d$$$$                  ███    █▀    ███    ███ ███   ███   ███ ███    ███   ███    ███   ███    ███ ███▌                                                                                                     ",
\ "                     .' ..       d$$$$;                  ███          ███    ███ ███   ███   ███ ███    ███  ▄███▄▄▄▄██▀   ███    ███ ███▌                                                                                                      ",
\ "                    /  /P'      d$$$$P. |\              ▀███████████ ▀███████████ ███   ███   ███ ███    ███ ▀▀███▀▀▀▀▀   ▀███████████ ███▌                                                                                                      ",
\ "                   /   \"      .d$$$P' |\^\"l                      ███   ███    ███ ███   ███   ███ ███    ███ ▀███████████   ███    ███ ███                                                                                                     ",
\ "                 .'           `T$P^\"\"\"\"\"  :               ▄█    ███   ███    ███ ███   ███   ███ ███    ███   ███    ███   ███    ███ ███                                                                                                  ",
\ "             ._.'      _.'                 ;            ▄████████▀    ███    █▀   ▀█   ███   █▀  ████████▀    ███    ███   ███    █▀  █▀                                                                                                        ",
\ "          `-.-\".-'-' ._.       _.-\"     .-\"                                                                   ███    ███                                                                                                                     ",
\ "        `.-\" _____  ._               .-\"                ▄█     █▄   ▄██████▄   ▄█          ▄████████                                                                                                                                          ",
\ "       -(.g$$$$$$$b.                .'                 ███     ███ ███    ███ ███         ███    ███                                                                                                                                            ",
\ "         \"\"^^T$$$P^)              .(:                  ███     ███ ███    ███ ███         ███    █▀                                                                                                                                           ",
\ "           _/  -\"  /.'           /:/;                  ███     ███ ███    ███ ███        ▄███▄▄▄                                                                                                                                               ",
\ "        ._.'-'`-'  \")/           /;/;                  ███     ███ ███    ███ ███       ▀▀███▀▀▀                                                                                                                                               ",
\ "     `-.-\"..--\"\"   \" /           /  ;                  ███     ███ ███    ███ ███         ███                                                                                                                                               ",
\ "    .-\" ..--\"\"        -'           :                   ███ ▄█▄ ███ ███    ███ ███▌    ▄   ███                                                                                                                                                ",
\ "    ..--\"\"--.-\"         (\      .-(\                     ▀███▀███▀   ▀██████▀  █████▄▄██   ███                                                                                                                                                ",
\ "      ..--\"\"                `-\(\/;`                                          ▀                                                                                                                                                       ",
\ "        _.                        :                                                                                                                    ",
\ "                                  ;`-                                                                                                                  ",
\ "",
\  ]
