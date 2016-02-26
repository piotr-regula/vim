if !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax match BookmarkerPath "] \zs.* =>> " conceal cchar=»
syntax match BookmarkerIndex "\[\zs\d\+\ze\]"

hi link BookmarkerPath Statement 
hi link BookmarkerIndex Number 

setlocal conceallevel=2
hi clear Conceal

