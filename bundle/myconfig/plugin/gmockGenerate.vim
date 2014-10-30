let s:hppFileMatcher = '\v.*\.hpp'

fun! GmockGen()
    let l:currentPath = expand('%:p')
    if !IsHppFile(l:currentPath)
        echom "this is not hpp file"
        return
    endif
    echom l:currentPath
    let l:targetPath = CreateMockPath(l:currentPath)
    call GenerateMockInSplit(l:targetPath, l:currentPath)
endfun

fun! IsHppFile(filename)
    return (a:filename =~# s:hppFileMatcher)
endfun

fun! CreateMockPath(hppFilePath)
    return substitute(a:hppFilePath,'Include\(.*\)\.hpp','Test_modules\1Mock.hpp',"")
endfun

fun! GenerateMockInSplit(mockPath, currentPath)
    split `=a:mockPath`
    exec 'silent! .!' . g:gmockGenCmd . " " . a:currentPath
endfun

command! -nargs=0 GmockGen call GmockGen()

