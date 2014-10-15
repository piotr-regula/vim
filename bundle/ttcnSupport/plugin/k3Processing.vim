fun! K3Filt()

    let or = '\)\|\('
    let listStart = '\('
    let listEnd = '\)'
    let grepStart = 'silent! %!grep -v "'
    let grepEnd = '"'
    let filterEmptyLines = 'silent! %s/^ *\n//g'
    let foldContentInBracket = '%g/^ {/normal! zf%'

    exec grepStart . listStart .
    \      'Function Enter' .
    \ or . 'Function Leave' .
    \ or . '\<Log\>' .
    \ or . 'Waiting for' .
    \ or . 'Begin test case' .
    \ or . 'Port map' .
    \ or . 'Default activated' .
    \ or . 'Match Successfull' .
    \ or . 'Component created' .
    \ or . 'Component start' .
    \ or . 'Message Queued' .
    \ or . 'CCS_CONNECTOR' .
    \ listEnd . grepEnd
    exec filterEmptyLines
    exec foldContentInBracket
endfun

fun! SaveRegisterContent()
    let  s:registerContent = @"
endfun

fun! RestoreRegisterContent()
    let @"= s:registerContent
endfun

fun! IsCurrentWordValid()
    return (expand('<cword>') ==? "Expected")
endfun

fun! K3Comp()
    let copyExpectedAndReceivedLines = 'normal! Vjy'
    let deleteWholeBuffer = 'normal! ggVG"_d'
    let pasteExpected = 'normal! pkJdt{jdd'
    let format = 'silent! %s/\v([{,])/\1\r/g | silent! %s/}/\r}/g'
    let noFileBuffer = 'setlocal buftype=nofile'
    let pasteReceived = 'normal! pkJdt{'

    if IsCurrentWordValid()
        call SaveRegisterContent()
        exec copyExpectedAndReceivedLines
        exec "split Expected"
        exec deleteWholeBuffer 
        exec pasteExpected
        exec format
        exec "diffthis"
        exec noFileBuffer
        exec "vsplit Received"
        exec deleteWholeBuffer 
        exec pasteReceived
        exec format
        exec "diffthis"
        exec noFileBuffer
        call RestoreRegisterContent()
    endif

endfun
command! -nargs=0 K3Filt call K3Filt()
command! -nargs=0 K3Comp call K3Comp()


