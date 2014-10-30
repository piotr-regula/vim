let s:testcaseMatcher='\v[A-Z]+_.*'

fun! GetComponentNameFromTestase(testcaseName)
    let l:testcaseName = a:testcaseName
    return split(l:testcaseName,'_')[0]
endfun

fun! ChangeDirectoryIfPathProvided()
    if !empty(g:ttcnRootPath)
        cd `=g:ttcnRootPath`
    endif
endfun

fun! IsTestcaseNameValid(testcaseName)
    return (a:testcaseName !~# s:testcaseMatcher)
endfun

fun! GetTestcaseName()
    call SaveRegisterContent()
    exec 'normal yit'
    let l:testcaseName = @"
    call RestoreRegisterContent()
    return l:testcaseName
endfun

fun! RunTestcase(componentName, testcaseName)
    exec "make! ". g:ttcnComponentFlag . a:componentName . " " 
        \ . g:ttcnTestcaseFlag . a:testcaseName . " " . g:ttcnMakeOpts "| copen"
endfun

fun! RunCurrentTestcase()
    let l:testcaseName = GetTestcaseName()
    if(IsTestcaseNameValid(l:testcaseName))
        echom "You are not inside testcase"
        return
    endif
    call ChangeDirectoryIfPathProvided()
    let l:componentName = GetComponentNameFromTestase(l:testcaseName)
    call RunTestcase(l:componentName, l:testcaseName)
endfun

command! -nargs=0 RunCurrentTestcase call RunCurrentTestcase()

