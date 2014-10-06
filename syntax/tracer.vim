
" Language:     tracer
"

if exists("b:current_syntax")
  finish
endif

" Literals
syn match   logString  "SACK.[A-Z]*_[A-Za-z]*"
syn match   logVerdictValue  "Start timer"
syn match   logString  "Timeout"
syn match   logNotify  "Expected"
"
syn keyword logDecl  Received Send
syn keyword logBool    true false
syn keyword logVerdictValue   omit null pass inconc none error
syn region  logString  start=/"/ end=/"/ skip=/""/ oneline

if version < 508
command -nargs=+ HiLink hi link <args>
else
command -nargs=+ HiLink hi def link <args>
endif

HiLink logBool   Boolean
HiLink logVerdictValue  Constant
HiLink logSpecialMsg  Special
HiLink logDecl   Statement
HiLink logError  Error
HiLink logString String
HiLink logLog    PreProc
HiLink logImportantMsg   Error
HiLink logNotify   Type

delcommand HiLink


let b:current_syntax = "tracer"

