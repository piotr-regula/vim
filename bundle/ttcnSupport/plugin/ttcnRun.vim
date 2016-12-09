let s:testcaseMatcher='\v[A-Z]+_.*'

fun! GetComponentNameFromTestase(testcaseName)
    let l:testcaseName = a:testcaseName
    return split(l:testcaseName,'_')[0]
endfun

fun! ChangeDirectoryIfPathProvided()
    if !empty(g:ttcnRootPath)
        echom "entering " . g:ttcnRootPath
        cd `=g:ttcnRootPath`
    endif
endfun

fun! IsTestcaseNameInvalid(testcaseName)
    return (a:testcaseName !~# s:testcaseMatcher)
endfun

fun! GetTestcaseName()
    call SaveRegisterContent()
    exec 'normal yit'
    let l:testcaseName = @"
    call RestoreRegisterContent()
    return l:testcaseName
endfun

fun! TestRunFinishHandler(channel) 
    if !empty(g:notifyCommand)
        exec g:notifyCommand
    endif
    exec "cfile! " . g:backgroundCommandOutput
    exec "cclose"
    copen
endfun

fun! TestRunOutHandler(channel, message)
    echo a:message
endfun

fun! IsAsyncSupported()
    return v:version >= 800
endfun

fun! RunTestcase(componentName, testcaseName)
    let l:ttcnRunCommand = g:ttcnMakeCmd  . " " . g:ttcnComponentFlag . a:componentName . " " 
        \ . g:ttcnTestcaseFlag . a:testcaseName . " " . g:ttcnMakeOpts
    if IsAsyncSupported()
        let g:backgroundCommandOutput = tempname()
        let job = job_start(split(l:ttcnRunCommand), {'close_cb': 'TestRunFinishHandler', 'out_io': 'file', 'out_name': g:backgroundCommandOutput,
        \                   'callback' : 'TestRunOutHandler'})
    else
        exec l:ttcnRunCommand
    endif

endfun

fun! RunCurrentTestcase()
    let l:testcaseName = GetTestcaseName()
    if(IsTestcaseNameInvalid(l:testcaseName))
        echom "You are not inside testcase"
        return
    endif
    call ChangeDirectoryIfPathProvided()
    let l:componentName = GetComponentNameFromTestase(l:testcaseName)
    call RunTestcase(l:componentName, l:testcaseName)
endfun

command! -nargs=0 RunCurrentTestcase call RunCurrentTestcase()

