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
    \ or . 'Function Leave' .
    \ or . 'Function Leave' .
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

fun! K3Comp()
    if expand('<cword>') ==? "Expected"
        let  registerContent = @"
        exec 'normal! Vjy'
        exec "split Expected"
        exec 'normal! ggVG"_dpkJdt{jdd'
        exec 'silent! %s/\v([{,])/\1\r/g | silent! %s/}/\r}/g'
        exec "diffthis"
        exec "vsplit Received"
        exec 'normal! ggVG"_dpkJdt{'
        exec 'silent! %s/\v([{,])/\1\r/g | silent! %s/}/\r}/g'
        exec "diffthis"
        let @"= registerContent
    endif

endfun
command! -nargs=0 K3Filt call K3Filt()
command! -nargs=0 K3Comp call K3Comp()


