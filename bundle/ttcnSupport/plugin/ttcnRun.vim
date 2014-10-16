let s:testcaseMatcher='\v[A-Z]+_.*'

fun! RunCurrentTestcase()
    if !exists('g:ttcnMakeCmd')
        return
    endif
    exec 'normal! yit'
    if(@" !~# s:testcaseMatcher)
        return
    endif
    let l:testcaseName = @"
    let l:componentName = split(@", '_')[0]
    exec "make SC=" . l:componentName . " TCS=" . l:testcaseName
endfun

command! -nargs=0 RunCurrentTestcase call RunCurrentTestcase()

