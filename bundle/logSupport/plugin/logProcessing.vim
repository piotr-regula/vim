fun! LogFilt(...)
    let l:filt = a:1
    if !empty(l:filt)
        exec 'silent! %!grep -i ' . l:filt
    endif
endfun

fun! LogFiltComponent(...)
    let l:componentName = a:1
    if !empty(l:componentName)
        let l:componentName = toupper(l:componentName)
        exec 'silent! %!grep ' . l:componentName
    endif
    exec 'silent! %s/^.*\(ERR\/\|WRN\/\|DBG\/\|INF\/\)/\1/g'
    exec 'nohlsearch'
endfun

fun! LogFiltThread()
    let l:currentPath = expand('%:p')
    let l:id = expand('<cword>')
    call GenerateThreadFilter(l:currentPath, l:id)
endfun

fun! GenerateThreadFilter(sourceFilePath, id)
    let l:bufName = "Thread-" . a:id . ".LOG"
    split `=l:bufName`
    setlocal buftype=nofile
    exec 'silent! .!grep "ThreadID:[^]]*' . a:id . '" ' . a:sourceFilePath
endfun

fun! LogFiltError()
    exec 'silent! %!grep "WRN\/\|ERR\/"'
endfun

fun! LogFiltErrorExtended()
    exec 'silent! %!grep -i "WRN\/\|ERR\/\|unexpect"'
endfun

fun! LogSort()
    exec 'silent! %!sort -k8'
endfun

command! -nargs=? LogFilt call LogFilt('<f-args>')
command! -nargs=? LogFiltComponent call LogFiltComponent('<f-args>')
command! -nargs=0 LogFiltThread call LogFiltThread()
command! -nargs=0 LogFiltError call LogFiltError()
command! -nargs=0 LogSort call LogSort()



