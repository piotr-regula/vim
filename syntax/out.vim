
" Vim syntax file
"
" Language:     outLog 
"


if exists("b:current_syntax")
  finish
endif


syn match   logInfo   "INF[\/,#][^ ]*"
syn match   logDebug   "DBG[\/,#][^ ]*"
syn match   logWarning   "WRN[\/,#][^ ]*"
syn match   logError   "ERR[\/,#][^ ]*"

syn match   logApplicationMessage "\([A-Z0-9]\+_\)\{2,\}[A-Z0-9]\+"
syn match   logMessage  "msgId\s*=\s*0x[a-f0-9]\{0,4}\W"
syn match   logMessage  "messageId\s*=\s*[a-f0-9]\{0,4}\W"

if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

  HiLink logWarning  Special
  HiLink logMessage   Keyword
  HiLink logInfo   Type
  HiLink logDebug Statement
  HiLink logError    Error
  HiLink logApplicationMessage MoreMsg

  delcommand HiLink

let b:current_syntax = "out"

