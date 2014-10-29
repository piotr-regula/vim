fun! LogFilt(...)
    let l:componentName = a:1
    if !empty(l:componentName)
        let l:componentName = toupper(l:componentName)
        exec 'silent! %!grep ' . l:componentName
    endif
    exec 'silent! %s/^.*\(ERR\/\|WRN\/\|DBG\/\|INF\/\)/\1/g'
    exec 'nohlsearch'
endfun

fun! LogFiltError()
    exec 'silent! %!grep "WRN\|ERR"'
endfun

fun! LogSort()
    exec 'silent! %!sort -k8'
endfun

command! -nargs=? LogFilt call LogFilt('<f-args>')
command! -nargs=0 LogFiltError call LogFiltError()
command! -nargs=0 LogSort call LogSort()



