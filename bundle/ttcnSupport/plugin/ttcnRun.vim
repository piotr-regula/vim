let s:testcaseMatcher='\v[A-Z]+_.*'

fun! RunCurrentTestcase()
    call SaveRegisterContent()
    exec 'normal yit'
    let l:testcaseName = @"
    call RestoreRegisterContent()

    if(l:testcaseName !~# s:testcaseMatcher)
        echom "You are not inside testcase"
        return
    endif
    let l:componentName = split(l:testcaseName, '_')[0]
    exec "make! SC=" . l:componentName . " TCS=" . l:testcaseName . " " . g:ttcnMakeOpts "| copen"
endfun

command! -nargs=0 RunCurrentTestcase call RunCurrentTestcase()

