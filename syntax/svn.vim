" Vim syntax file
"
" Language:     svn 
" Maintainer:   Regg 
"


if exists("b:current_syntax")
  finish
endif

syn sync fromstart

syn match   svnAdded    "^+.*"
syn match   svnRem  "^-.*"
syn match   svnFile     "^+++.*("
syn match   svnFile     "^---.*("

if version < 508
let g:did_ttcn_syn_inits = 1
command -nargs=+ HiLink hi link <args>
else
command -nargs=+ HiLink hi def link <args>
endif

  HiLink svnAdded Label
  HiLink svnRem Number 
  HiLink svnFile String

delcommand HiLink



let b:current_syntax = "svn"

