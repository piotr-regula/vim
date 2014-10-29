" Vim syntax file
"
" Language:     outfile log
"

if exists("b:current_syntax")
  finish
endif

syn match   outInfo   "INF[\/,#][^ ]*"
syn match   outDebug   "DBG[\/,#][^ ]*"
syn match   outWarning   "WRN[\/,#][^ ]*"
syn match   outError   "ERR[\/,#][^ ]*"
syn match   outAddInfo  "\[ThreadID[^\]]*\]"
syn match   outApplicationMessage "\([A-Z0-9]\+_\)\{2,\}[A-Z0-9]\+"
syn match   outMessage  "msgId\s*=\s*0x[a-f0-9]\{0,4}\W"
syn match   outMessage  "messageId\s*=\s*[a-f0-9]\{0,4}\W"

if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

  HiLink outWarning  Statement
  HiLink outMessage   Keyword
  HiLink outInfo   Type
  HiLink outDebug String
  HiLink outError    Error
  HiLink outApplicationMessage MoreMsg
  HiLink outAddInfo PreProc

  delcommand HiLink

let b:current_syntax = "outfile"

