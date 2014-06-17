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
"direxplorer
nmap <silent><f1> :Sexplore<cr>
map! <f1> <esc><f1>a
"quit
nmap <silent><F2> :q<CR>
map! <F2> <ESC><f2>a
"splits
noremap <silent><F3> :set cursorline! cursorcolumn!<cr>
map! <F3> <ESC><f3>a
"buffers
nmap <silent><F4> :CtrlP<CR>
map! <F4> <ESC><F4>a
"FilesTree
nmap <silent><F5> :NERDTreeToggle<CR>
map! <F5> <ESC><F5>a
"Creating tabs
nmap <silent><F6> :tab split<CR>
map! <F6> <ESC><F6>a
"Grep
nmap <silent> <F7> :Rgrep<CR>
map! <F7> <esc><f7>a
"Temporary buffer
nmap <silent><f9> :Sscratch<cr>
map! <f9> <esc><f9>a
"TagList
nmap <silent> <F10> :TlistToggle<CR>
map! <f10> <esc><f10>a
"Svn Blame
nmap <silent> <F11> :VCSBlame<CR>:set filetype=cpp<CR>
map! <f11> <esc><f11>a
"clear search highlights
nmap <silent><f12> :noh<cr>
map! <f12> <ESC><f12>

" use tagselect by default
nnoremap <C-]> g<C-]>

"save
nmap <silent><C-S> :w <CR>
map! <C-S> <esc><C-S>
"copy blocks of code (from ( to ) from { to } etc )
nmap <silent><C-C> V%y
map! <C-C> <ESC><C-C>
"comment uncomment line
nmap <silent><A-/> i<Home>//<Esc>
map! <A-/> <Home>//
"uncomment
nmap <silent><A-.> i<Home><del><del><Esc>
map! <A-.> <Home><del><del>
"EasyMotion
nmap <Space> ,w
"Moving between windows
map <S-W> <C-w><Up>
map <S-S> <C-w><Down>
map <S-A> <C-w><Left>
" These work like * and g*, but do not move the cursor and always set hls.
map <Leader>* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
map <Leader>g* :let @/ = expand('<cword>')\|set hlsearch<C-M>
"nnoremap ; : ": without shift
"clear search
nmap <silent> ,/ :nohlsearch<CR>
"Y = Yank from cursor till end of line
nmap Y y$


nmap <silent> <leader>hpp  :call OpenHeader()<CR>
nmap <silent> <leader>cpp  :call OpenSource()<CR>
nmap <silent> <leader>n  :call ShowFuncName()<CR>
nmap <silent> <leader>g  :%!grep
"search trailing spaces
nmap <silent> <leader><space>  / \+$<CR>
"show menu bar
nmap <silent> <leader>menu  :set guioptions+=m<CR>
"delete trailing whitespaces
nmap <silent> <leader>spaces :%s/\s\+$//e<CR>

"filter out log
nmap <silent> <leader>log    <ESC>:%s/^.*\(ERR\\|WRN\\|DBG\\|INF\)/\1/g<CR>
nmap <silent> <leader>filter <leader>log<CR>
nmap <silent> <leader>error <ESC>:%!grep "WRN\\\|ERR"<CR>
nmap <silent> <leader>err   <leader>error<CR>
"noerrorbellscopy path to buffer
nnoremap <Leader>ff :let @"=expand("%")<CR>:let @*=expand("%")<CR>
nnoremap <Leader>fd :let @"=expand("%:t")<CR>:let @*=expand("%:t")<CR>
"pastemode
nmap <silent> <leader>paste :set paste!<CR>

"visual with leader leader
nmap <Leader><Leader> V

"move screen to word in search mode
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
"reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

"resize split windows
if bufwinnr(1)
    map + <C-W>5+
    map _ <C-W>5-
endif

nmap <silent> <leader>vimrc     <f6>:e ~/.vimrc<cr>
nmap <silent> <leader>map     <f6>:e ~/.vim/bundle/myconfig/plugin/mappings.vim<cr>
nmap <silent> <leader>ttcn      <f6>:e ~/.vim/bundle/snipmate/snippets/ttcn.snippets<cr>:set nofoldenable<cr>
nmap <silent> <leader>c      <f6>:e ~/.vim/bundle/snipmate/snippets/c.snippets<cr>:set nofoldenable<cr>

"enable shift insert
map! <s-insert> <c-r>*

"Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

""no register replace during paste
xnoremap <expr> p 'pgv"'.v:register.'y'

"find merge conflicts
nmap <silent> <leader>mc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
"Neocomplcache
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <buffer> <expr><Tab> pumvisible() ? "\<C-N>" : "\<tab>"
inoremap <buffer> <expr><S-Tab> "\<C-P>"
"
"generate gmock files in current buffer
nmap <silent> <leader>gmock :%!~/devTools/generator/gmock_gen.py %<CR>
nmap <silent> <leader>mock <leader>gmock
nmap <silent> <leader>pi pV:s/.*\///g<CR>i#include "<ESC>$a"<ESC>:noh<CR>
nmap <silent> <leader>header iheader<C-Tab><ESC>k,fdpF.DVU"ayiwi#ifndef <ESC>o#define <ESC>"apGo#endif<CR>o<ESC>
nmap <silent> <leader>format :%s/\([{}]\)/\r\1/g:%!astyle
"PLUGIN MAPPINGS

"use region expanding on v/c-v
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nmap <Leader>1 :Sscratch1<cr>
nmap <Leader>2 :Sscratch2<cr>
nmap <Leader>3 :Sscratch3<cr>
nmap <Leader>4 :Sscratch4<cr>
nmap <Leader>5 :Sscratch5<cr>
nmap <Leader>6 :Sscratch6<cr>


