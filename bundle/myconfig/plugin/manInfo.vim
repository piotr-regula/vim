
fun! NoFileBuffer()
    exec 'setlocal buftype=nofile'
endfun

fun! PrepareBuffer(bufferName)
    exec "split " . a:bufferName
    call NoFileBuffer()
endfun

fun! DeleteWholeBuffer()
    exec 'normal! ggVG"_d'
endfun

fun! PasteManPageForWord(word)
    exec "silent .!man " . a:word
endfun

fun! GenerateManInfoInNewWindow()
    let l:word = expand('<cword>')
    call PrepareBuffer(l:word)
    call DeleteWholeBuffer()
    call PasteManPageForWord(l:word)
endfun

fun! GenerateManInfoInNewWindow(word)
    call PrepareBuffer(a:word)
    call DeleteWholeBuffer()
    call PasteManPageForWord(a:word)
endfun

fun! GenerateRegularManPage()
    let l:word = expand('<cword>')
    call GenerateManInfoInNewWindow(l:word)
endfun

fun! GenerateStlManPage()
    let l:word = "std::" . expand('<cword>')
    call GenerateManInfoInNewWindow(l:word)
    exec "setf cpp"
endfun
command! -nargs=0 GenerateRegularManPage call GenerateRegularManPage()
command! -nargs=0 GenerateStlManPage call GenerateStlManPage()

