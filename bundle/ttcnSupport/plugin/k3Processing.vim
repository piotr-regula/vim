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

fun! IsCurrentWordValid()
    return (expand('<cword>') ==? "Expected")
endfun

fun! CopyExpectedAndReceivedLines()
    exec 'normal! Vjy'
endfun

fun! DeleteWholeBuffer()
    exec 'normal! ggVG"_d'
endfun

fun! PasteExpected()
    exec 'normal! pkJdt{jdd'
endfun

fun! PasteReceived()
    exec 'normal! pkJdt{'
endfun

fun! FormatText()
    exec 'silent! %s/\v([{,])/\1\r/g | silent! %s/}/\r}/g'
endfun

fun! NoFileBuffer()
    exec 'setlocal buftype=nofile'
endfun
fun! PrepareBuffer(bufferName)
    exec "split " . a:bufferName
    call NoFileBuffer()
endfun
fun! PrepareExpectedBuffer()
    call PrepareBuffer("Expected")
    call DeleteWholeBuffer()
    call PasteExpected()
    call FormatText()
    exec "diffthis"
endfun

fun! PrepareReceivedBuffer()
    exec "vsplit Received"
    call DeleteWholeBuffer()
    call PasteReceived()
    call FormatText()
    exec "diffthis"
    call NoFileBuffer()
endfun

fun! OpenMismatchesInNewWindowAndShowDiff()
    call SaveRegisterContent()
    call CopyExpectedAndReceivedLines()
    call PrepareExpectedBuffer()
    call PrepareReceivedBuffer()
    call RestoreRegisterContent()
endfun

fun! K3Comp()
    if IsCurrentWordValid()
        call OpenMismatchesInNewWindowAndShowDiff()
    endif
endfun

fun! K3RrcReconf()
    call OpenRrcReconfInNewWindow()
endfun

fun! OpenRrcReconfInNewWindow()
    let @z=""
    let copyAllRrcReconfToRegisterZ = '%g/rrcConnectionReconfiguration:=\n/normal! Vj%"Zy'
    exec copyAllRrcReconfToRegisterZ
    exec PrepareBuffer("RrcReconf")
    exec 'normal! "zp'
endfun

command! -nargs=0 K3Filt call K3Filt()
command! -nargs=0 K3Comp call K3Comp()
command! -nargs=0 K3RrcReconf call K3RrcReconf()


