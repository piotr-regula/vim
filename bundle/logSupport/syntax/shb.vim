" Vim syntax file
"
" Language:     shb log
"

if exists("b:current_syntax")
  finish
endif

syn match   shbMessage1 "\([A-Z0-9]\+_\)\{2,\}[A-Z0-9]\+"
syn match   shbMessage2 "[A-Z0-9]\+_[A-Za-z0-9]\+(0x[^)]\+)"
syn match   shbKeyword1 "message sent"
syn match   shbKeyword2 "message recv"
syn match   shbState "[Ss]tate[A-Za-z0-9]\+ -> [Ss]tate[A-Za-z0-9]\+"

if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

  HiLink shbKeyword1   Number
  HiLink shbKeyword2   Keyword
  HiLink shbMessage1   MoreMsg
  HiLink shbMessage2   Type
  HiLink shbState      String

  delcommand HiLink

let b:current_syntax = "shb"

