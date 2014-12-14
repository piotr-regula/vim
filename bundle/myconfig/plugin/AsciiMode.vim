
"                       ╔═════╦═════╗
" |---T---|             ║     ║     ║
" |===+===|     -==>    ╠═════╬═════╣
" |___L___|             ║     ║     ║
"                       ╚═════╩═════╝

fun AsciiModeTableEnable()
    imap <buffer> \|- ╔
    imap <buffer> - ═
    imap <buffer> _ ═
    imap <buffer> -\| ╗
    imap <buffer> + ╬
    imap <buffer> \|_ ╚
    imap <buffer> _\| ╝
    imap <buffer> L ╩
    imap <buffer> l ╩
    imap <buffer> t ╦
    imap <buffer> T ╦
    imap <buffer> \| ║
    imap <buffer> \|= ╠
    imap <buffer> =\| ╣
endfun

fun AsciiModeTableDisable()
    iunmap <buffer> \|-
    iunmap <buffer> -
    iunmap <buffer> _
    iunmap <buffer> -\|
    iunmap <buffer> +
    iunmap <buffer> \|_
    iunmap <buffer> _\|
    iunmap <buffer> L
    iunmap <buffer> l
    iunmap <buffer> t
    iunmap <buffer> T
    iunmap <buffer> \|
    iunmap <buffer> \|=
    iunmap <buffer> =\|
endfun

fun AsciiModeSymbolsEnable()
    iabbrev c ©
    iabbrev +- ±
    iabbrev <3 ♥
    iabbrev :) ☺
    iabbrev infinity ∞
    iabbrev sum Σ
    iabbrev alfa α
    iabbrev beta ß
    iabbrev pi π
    iabbrev sigma σ
    iabbrev micro µ
    iabbrev tau τ
    iabbrev omega Ω
    iabbrev fi φ
    iabbrev epsilon ε
    iabbrev >= ≥
    iabbrev <= ≤
    iabbrev ~= ≈
    iabbrev =~ ≈
    iabbrev root √
    iabbrev ^2 ²
    iabbrev <- ←
    iabbrev -> →
    iabbrev vv ↓
    iabbrev ^^ ↑
endfun

fun AsciiModeSymbolsDisable()
    iunabbrev c
    iunabbrev +-
    iunabbrev <3
    iunabbrev :)
    iunabbrev infinity
    iunabbrev sum
    iunabbrev alfa
    iunabbrev beta
    iunabbrev pi
    iunabbrev sigma
    iunabbrev micro
    iunabbrev tau
    iunabbrev omega
    iunabbrev fi
    iunabbrev epsilon
    iunabbrev >=
    iunabbrev <=
    iunabbrev ~=
    iunabbrev =~
    iunabbrev root
    iunabbrev ^2
    iunabbrev <-
    iunabbrev ->
    iunabbrev vv
    iunabbrev ^^
endfun

let g:isAsciiTableEnabled = 0
fun AsciiTableToggle()
    if g:isAsciiTableEnabled
        call AsciiModeTableDisable()
        let g:isAsciiTableEnabled = 0
    else
        call AsciiModeTableEnable()
        let g:isAsciiTableEnabled = 1
    endif
endfun

let g:isAsciiSymbolsEnabled = 0
fun AsciiSymbolsToggle()
    if g:isAsciiSymbolsEnabled
        call AsciiModeSymbolsDisable()
        let g:isAsciiSymbolsEnabled = 0
    else
        call AsciiModeSymbolsEnable()
        let g:isAsciiSymbolsEnabled = 1
    endif
endfun

command! -nargs=0 AsciiTableToggle call AsciiTableToggle()
command! -nargs=0 AsciiSymbolsToggle call AsciiSymbolsToggle()

