if exists('b:ttcnSupportLoaded')
    finish
endif
let b:ttcnSupportLoaded = 1

setlocal iskeyword+==
iabbrev <buffer> = :=

nmap <buffer> <leader>pi pV:s/.*\///g<CR>iimport from <ESC>A all;<ESC>F.dt :noh<CR>
onoremap <buffer> it :<c-u>execute "normal! ?testcase\r:nohlsearch\rwviw"<cr>

if !exists('g:ttcnMakeCmd')
    let g:ttcnMakeCmd='make -f remote-cplane/Makefile sct-run'
endif

let &l:makeprg=g:ttcnMakeCmd
