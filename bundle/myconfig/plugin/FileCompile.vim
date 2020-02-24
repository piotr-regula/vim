fun! ClangCompile()
    let l:currentDirectoryPath = expand('%:h')
    let l:currentFileName = expand('%:t')
    cd `=l:currentDirectoryPath`
    exec 'silent! !rm clangOutputFile.o'
    let &l:makeprg='clang++ -std=c++14 -pthread ' . ' -stdlib=libc++ ' . l:currentFileName . ' -O3 -o clangOutputFile.o'
    make
    exec '!./clangOutputFile.o'
endfun


fun! GccCompile()
    let l:currentDirectoryPath = expand('%:h')
    let l:currentFileName = expand('%:t')
    cd `=l:currentDirectoryPath`
    exec 'silent! !rm gccOutputFile.o'
    let &l:makeprg='g++ -std=c++14 -Wall ' . l:currentFileName . ' -O3 -o gccOutputFile.o'
    make
    exec '!./gccOutputFile.o'
endfun
command! -nargs=0 ClangCompile call ClangCompile()
command! -nargs=0 GccCompile call GccCompile()
