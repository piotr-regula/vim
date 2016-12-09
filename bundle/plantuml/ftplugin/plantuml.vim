" Vim plugin file
" Language:     PlantUML
" Maintainer:   Aaron C. Meadows < language name at shadowguarddev dot com>
" Last Change:  19-Jun-2012
" Version:      0.1
"

if exists("b:loaded_plantuml_plugin")
    finish
endif
let b:loaded_plantuml_plugin = 1

if !exists("b:plantuml_executable_script")
	let b:plantuml_executable_script="plantuml"
endif
let b:path=expand("%")
let b:path=fnameescape(b:path)
let b:makecommand=b:plantuml_executable_script." ".b:path

" define a sensible makeprg for plantuml files
autocmd Filetype plantuml let &l:makeprg=b:makecommand

nnoremap <buffer> <C-h> :silent !firefox http://plantuml.com/sequence.html&<CR>

nnoremap <buffer> <leader>pu :make<CR>:let @"=expand("%:r")<CR>:!eog<space>"<C-R>".png"&<CR><CR>
