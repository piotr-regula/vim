" Vim syntax file
"
" Language:     regr 
" Maintainer:   Regg 
"


if exists("b:current_syntax")
  finish
endif

syn sync fromstart

syn match Error  "@note.*"

let b:current_syntax = "notes"

