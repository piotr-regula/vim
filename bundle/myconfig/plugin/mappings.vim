"================================================================
"                           Map
"================================================================

"n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
"i  Insert mode map. Defined using ':imap' or ':inoremap'.
"v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
"x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
"s  Select mode map. Defined using ':smap' or ':snoremap'.
"c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
"o  Operator pending mode map. Defined using ':omap' or ':onoremap'

nmap , <Leader>

"FUNCTIONAL KEYS"""""""""""""""""""""""""""""""""""""""""""""""

"direxplorer
nnoremap <silent><f1> :Sexplore<cr>
imap <f1> <esc><f1>a
"quit
nnoremap <silent><F2> :q<CR>
imap <F2> <ESC><f2>a
"splits
nnoremap <silent><F3> :set cursorline! cursorcolumn!<cr>
imap <F3> <ESC><f3>a
"buffers
nnoremap <silent><F4> :CtrlP<CR>
imap <F4> <ESC><F4>a
"FilesTree
nnoremap <silent><F5> :NERDTreeToggle<CR>
imap <F5> <ESC><F5>a
"Creating tabs
nnoremap <silent><F6> :tab split<CR>
imap <F6> <ESC><F6>a
"Grep
nnoremap <silent> <F7> :Rgrep<CR>
imap <F7> <esc><f7>a
"Temporary buffer
nnoremap <silent><f9> :Sscratch<cr>
imap <f9> <esc><f9>a
"TagList
nnoremap <silent> <F10> :TlistToggle<CR>
imap <f10> <esc><f10>a
"Svn Blame
nnoremap <silent> <F11> :VCSBlame<CR>:set filetype=cpp<CR>
imap <f11> <esc><f11>a
"clear search highlights
nnoremap <silent><f12> :noh<cr>
imap <f12> <ESC><f12>

"SMALL TWEAKS""""""""""""""""""""""""""""""""""""""""""""""""""

" use tagselect by default
nmap <C-]> g<C-]>
"Y = Yank from cursor till end of line
nmap Y y$
""no register replace during paste
xnoremap p pgvy
"reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
"move screen to word in search mode
nmap <silent> n nzz
nmap <silent> N Nzz
nmap <silent> * *zz
nmap <silent> # #zz
nmap <silent> g* g*zz
nmap <silent> g# g#zz
"enable shift insert
map! <s-insert> <c-r>*
"Bubble single lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
"uppercase in insert mode
imap <c-u> <esc>viwUea
"save
nnoremap <silent><C-S> :w <CR>
imap <C-S> <esc><C-S>
"copy lines of code (from ( to ) from { to } etc )
nnoremap <silent><C-C> V%y
"comment uncomment line
nnoremap <silent><A-/> i<Home>//<Esc>
imap <A-/> <Home>//
"uncomment
nnoremap <silent><A-.> i<Home><del><del><Esc>
imap <A-.> <Home><del><del>
"resize split windows
if bufwinnr(1)
    nmap + <C-W>5+
    nmap _ <C-W>5-
endif

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in" :<c-u>normal! f"vi"<cr>


"VARIOUS MAPPINGS""""""""""""""""""""""""""""""""""""""""""""""

" These work like * and g*, but do not move the cursor and always set hls.
map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>
"clear search
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>hpp  :call OpenHeader()<CR>
nmap <silent> <leader>cpp  :call OpenSource()<CR>
nmap <silent> <leader>n  :call ShowFuncName()<CR>
nmap <silent> <leader>g  :%!grep
"delete trailing whitespaces
nmap <silent> <leader><space> :%s/\s\+$//e<CR>
"search trailing spaces
nmap <silent> <leader>spaces / \+$<CR>
"show menu bar
nmap <silent> <leader>menu  :set guioptions+=m<CR>
"noerrorbellscopy path to buffer
nmap <Leader>ff :let @"=expand("%")<CR>:let @*=expand("%")<CR>
nmap <Leader>fd :let @"=expand("%:t")<CR>:let @*=expand("%:t")<CR>
"pastemode
nmap <leader>paste :set paste!<CR>
"find merge conflicts
nmap <leader>mc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
"create include statement from full path
nmap <leader>pi pV:s/.*\///g<CR>i#include "<ESC>$a"<ESC>:noh<CR>
"add header
nmap <leader>header header<C-Tab><ESC>ki#pragma once<ESC>Go<ESC>
"format file
nmap <leader>format :%s/\([{}]\)/\r\1/g<CR>:%!astyle<CR>
"load quickfix with content from last make
nmap <leader>make :cfile ~/.dump/makedump<CR>:cw<CR>
"jump skipping I
nmap <leader>j eblve<C-]><CR>
"create plantuml flow and open it with eog
nmap <leader>pu :make<CR>,ff:!eog<space><C-R>"<backspace>ng&<CR><CR>
"search object inheritance
nmap <leader>inh :Regrep<CR><Home>(public\|private\|protected).*<CR>
"search object construction
nmap <leader>con :Regrep<CR><End>(\(\|>[ ]*\()<CR>
"source vim
nnoremap <leader>sv :source $MYVIMRC<cr>

"FILES"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>vimrc     <f6>:e ~/.vimrc<cr>
nmap <silent> <leader>map     <f6>:e ~/.vim/bundle/myconfig/plugin/mappings.vim<cr>
nmap <silent> <leader>my     <f6>:e ~/.vim/bundle/myconfig/plugin/<cr>
nmap <silent> <leader>ttcn      <f6>:e ~/.vim/bundle/snipmate/snippets/ttcn.snippets<cr>:set nofoldenable<cr>
nmap <silent> <leader>c      <f6>:e ~/.vim/bundle/snipmate/snippets/c.snippets<cr>:set nofoldenable<cr>

"PLUGIN MAPPINGS"""""""""""""""""""""""""""""""""""""""""""""""

"Neocomplcache
inoremap <buffer> <expr><Tab> pumvisible() ? "\<C-N>" : "\<tab>"
inoremap <buffer> <expr><S-Tab> "\<C-P>"
"use region expanding on v/c-v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"Scratch buffers
nnoremap <Leader>1 :Sscratch1<cr>
nnoremap <Leader>2 :Sscratch2<cr>
nnoremap <Leader>3 :Sscratch3<cr>
nnoremap <Leader>4 :Sscratch4<cr>
nnoremap <Leader>5 :Sscratch5<cr>
nnoremap <Leader>6 :Sscratch6<cr>

