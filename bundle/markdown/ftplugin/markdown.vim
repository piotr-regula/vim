" Vim plugin file
" Language:     Markdown
"

if exists("b:markdown_loaded")
    finish
endif
let b:markdown_loaded = 1

if !exists("b:markdown_executable")
	let b:markdown_executable="gimli -f"
endif
let b:path=expand("%")
let b:path=fnameescape(b:path)

let b:markdown_opt="-outputdir "
let b:dirPath=expand("%:h")
let b:dirPath=fnameescape(b:dirPath)
let b:markdown_opt=b:markdown_opt.b:dirPath

let b:makecommand=b:markdown_executable." ".b:path." ".b:markdown_opt
let &l:makeprg=b:makecommand

" define a sensible makeprg for plantuml files

