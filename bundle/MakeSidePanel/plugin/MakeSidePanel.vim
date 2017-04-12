let s:makePanelName = "__MakePanel__"

fun! MakePanelToggle()
    let bnr = bufwinnr(s:makePanelName)
    if bnr > 0
        exec bnr . "wincmd w"
        exec "q"
    else
        call CreateMakePanel(s:makePanelName)
    endif
endfun

fun! CreateMakePanel(bufferName)
    exec "botright vsplit " . a:bufferName
    exec "vertical resize 60"
    exec "setlocal buftype=nofile"
    exec "silent .! cat " . g:makePanelTargetListLocation 
    cd `=g:makePanelRootPath`
    exec "setfiletype MakeSidePanel"
endfun

fun! OpenMakePanel()
    echom "open"
endfun

command! -nargs=0 MakePanelToggle call MakePanelToggle()
command! -nargs=0 OpenMakePanel call OpenMakePanel()
