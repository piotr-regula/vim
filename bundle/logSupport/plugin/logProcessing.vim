fun! LogFilt(...)
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
    let l:threadId = expand('<cword>')
    call GenerateThreadFilter(l:currentPath, l:threadId)
endfun

fun! GenerateThreadFilter(sourceFilePath, threadId)
    let l:bufName = "Thread-" . a:threadId . ".LOG"
    split `=l:bufName`
    setlocal buftype=nofile
    exec 'silent! .!grep "ThreadID:' . a:threadId . '" ' . a:sourceFilePath
endfun

fun! LogFiltError()
    exec 'silent! %!grep "WRN\|ERR"'
endfun

fun! LogSort()
    exec 'silent! %!sort -k8'
endfun

command! -nargs=? LogFilt call LogFilt('<f-args>')
command! -nargs=0 LogFiltThread call LogFiltThread()
command! -nargs=0 LogFiltError call LogFiltError()
command! -nargs=0 LogSort call LogSort()



