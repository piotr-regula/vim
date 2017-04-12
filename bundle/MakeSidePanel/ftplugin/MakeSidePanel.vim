if exists('b:makeSidePanelLoaded')
    finish
endif
let b:makeSidePanelLoaded = 1

execute "nnoremap <buffer> <enter> :" . g:asyncRunCommand . " " . g:makePanelCmd . " " . "<C-r><C-w><CR> :copen<CR>"
let &l:makeprg=g:makePanelCmd
