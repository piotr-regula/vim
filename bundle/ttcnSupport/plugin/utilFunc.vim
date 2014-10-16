fun! SaveRegisterContent()
    let  s:registerContent = @"
endfun

fun! RestoreRegisterContent()
    let @"= s:registerContent
endfun
