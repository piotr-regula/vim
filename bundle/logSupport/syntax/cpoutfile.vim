" Vim syntax file
"
" Language:     cpoutfile log
"

if exists("b:current_syntax")
  finish
endif


syn  match  outInfo                "^[^ ]*\[info\]"
syn  match  outDebug               "^[^ ]*\[debug\]"
syn  match  outWarning             "^[^ ]*\[warning\]"
syn  match  outError               "^[^ ]*\[error\]"
syn  match  outTrace               "^[^ ]*\[trace\]"
syn  match  outApplicationMessage  "\[MESSAGE\]"
syn  match  outApplicationMessage  "\[PROTOBUF[^\]]*\]"
syn  match  outAddInfo             "\[[^>[]*->[^\]]*\]"
syn  match  outFile                " [^ :]*[hc]pp"


if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

  HiLink outWarning   PreProc
  HiLink outFile  DiffChange 
  HiLink outInfo  MoreMsg
  HiLink outDebug String
  HiLink outError    Error
  HiLink outTrace Type
  HiLink outApplicationMessage MoreMsg
  HiLink outAddInfo Statement

  delcommand HiLink

let b:current_syntax = "outfile"

