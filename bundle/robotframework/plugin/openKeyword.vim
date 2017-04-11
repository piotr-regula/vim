if exists('*OpenKeyword')
    finish
endif
fun! OpenKeyword(keyword)
    exec 'keepjumps e ' . g:keyWordList
    exec 'keepjumps normal! /\c' . a:keyword  . '<CR>'
    exec 'keepjumps normal! ^gfn'
endfun
command! -nargs=1 OpenKeyword call OpenKeyword('<args>')
