let s:hppFileMatcher = '\v.*\.hpp'

fun! GmockGen()
    let l:currentPath = expand('%:p')
    let l:currentFileName = expand('%:t')
    if !IsHppFile(l:currentPath)
        echom "this is not hpp file"
        return
    endif
    echom l:currentPath
    let l:targetPath = CreateMockPath(l:currentPath)
    call GenerateMockInSplit(l:targetPath, l:currentPath)
    call FormatFileAndAddIncludes(l:currentFileName)
endfun

fun! IsHppFile(filename)
    return (a:filename =~# s:hppFileMatcher)
endfun

fun! CreateMockPath(hppFilePath)
    return substitute(a:hppFilePath,'Include\(.*\)\.hpp','Test_modules\1Mock.hpp',"")
endfun

fun! FormatFileAndAddIncludes(sourceFile)
    call Format()
    call AddIncludes(a:sourceFile)
endfun

fun! Format()
    exec '%s/\( \)*{/\r{/g'
    exec '%s/\vMock([^ ]*)/\1Mock/g'
    exec 'normal! Go'
endfun

fun! AddIncludes(sourceFile)
    exec 'normal! ggO'
    let l:includes = ['#pragma once', '',
    \                   '#include "' . a:sourceFile . '"',
    \                  '#include <UecGoogleMock.hpp>','']
    silent put=l:includes
endfun

fun! GenerateMockInSplit(mockPath, currentPath)
    split `=a:mockPath`
    exec 'silent .!' . g:gmockGenCmd . " " . a:currentPath
endfun

command! -nargs=0 GmockGen call GmockGen()

