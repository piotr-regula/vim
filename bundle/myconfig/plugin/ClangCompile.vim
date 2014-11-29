fun! ClangCompile()
    let l:currentDirectoryPath = expand('%:h')
    let l:currentFileName = expand('%:t')
    cd `=l:currentDirectoryPath`
    exec 'silent! !rm clangOutputFile.o'
    let &l:makeprg='clang++ -std=c++11 ' . l:currentFileName . ' -o clangOutputFile.o'
    make
    exec '!./clangOutputFile.o'
endfun

command! -nargs=0 ClangCompile call ClangCompile()
