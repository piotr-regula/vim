" Language:     log
"

if exists("b:current_syntax")
  finish
endif

" Built-in types
syn keyword ttcnType    address anytype boolean char default float integer
syn keyword ttcnType    objid verdicttype timer set record union
syn keyword ttcnType    enumerated component BACKTRACE

" Type definitions
syn keyword ttcnTypDef  type procedure mixed 

" Storage classes
syn keyword ttcnStore   var const external

" Module, import and group stuff
syn keyword ttcnModule  module modulepar group import from

" Attributes
syn keyword ttcnAttrib  with display encode extension variant 

" Operators
syn keyword ttcnOper    mod rem not and or xor not4b and4b or4b xor4b
syn keyword ttcnOper    complement pattern match valueof self mtc read
syn keyword ttcnOper    activate create running system subset superset  
syn keyword ttcnOper    getverdict
"
" Statements
syn keyword ttcnCond    if else
syn keyword ttcnRepeat  for while do repeat
syn keyword ttcnStat    log stop alt interleave deactivate connect 
syn keyword ttcnStat    disconnect map unmap start done send call reply
syn keyword ttcnStat    trigger getcall getreply check clear
syn keyword ttcnStat    timeout setverdict
syn keyword ttcnStat    action execute return goto
syn keyword ttcnLabel   label
syn keyword ttcnExcept  raise catch
"syn match   ttcnstat    "->"
"syn match   ttcnStat    ":="
syn keyword ttcnContr   control
syn keyword ttcnStat    function testcase signature noblock exception
syn keyword ttcnStat    altstep template
"syn match   ttcnStat    "\<runs\s\+on\>"

" Predefined functions
syn keyword ttcnFunc    int2char int2unichar int2bit int2hex int2oct
syn keyword ttcnFunc    int2str int2float float2int char2int unichar2int
syn keyword ttcnFunc    bit2int bit2hex bit2oct bit2str hex2int hex2bit
syn keyword ttcnFunc    hex2oct hex2str oct2int oct2bit oct2str str2int
syn keyword ttcnFunc    str2oct lengthof sizeof ispresent ischosen regexp
syn keyword ttcnFunc    substr rnd

" Various keywords
syn keyword ttcnKeyw    in out inout any all sender to value modifies
syn keyword ttcnKeyw    nowait param length recursive except optional 
syn keyword ttcnKeyw    ifpresent language override

" Literals
syn match   ttcnImportantMsg  "Waiting for"
syn match   ttcnImportantMsg  "ANY PORT"
syn match   ttcnImportantMsg  "Final Verdict"
syn match   ttcnImportantMsg  "fail"
syn match   ttcnConst  "Start timer"
syn match   ttcnString  "Timeout"
syn match   ttcnImportantMsg  "fail"
syn keyword   ttcnDecl  Received Send
syn match   ttcnNotify  "Expected"
syn match   ttcnNotify  "New verdict"
syn match   ttcnContr  "Message Queued"
syn match   ttcnLog  "+++++++++++++REASON  BEGIN++++++++++"
syn match   ttcnLog  "+++++++++++++REASON  END++++++++++"
syn match   ttcnConst  "Function Enter"
syn match   ttcnString  "Function Leave"
syn match   ttcnString  "Match Successfull"
syn match   ttcnImportantMsg  "Match Failed"
syn keyword ttcnBool    true false
syn keyword ttcnConst   omit null pass inconc none error
syn region  ttcnString  start=/"/ end=/"/ skip=/""/ oneline

if version < 508
command -nargs=+ HiLink hi link <args>
else
command -nargs=+ HiLink hi def link <args>
endif

HiLink ttcnAttrib PreProc
HiLink ttcnBool   Boolean
HiLink ttcnConst  Constant
HiLink ttcnCmnt   Comment
HiLink ttcnCond   Conditional
HiLink ttcnContr  Special
HiLink ttcnDecl   Statement
HiLink ttcnError  Error
HiLink ttcnExcept Exception
HiLink ttcnFunc   Function
HiLink ttcnKeyw   Keyword
HiLink ttcnLabel  Label
HiLink ttcnModule PreProc
HiLink ttcnNumber Number
HiLink ttcnOper   Operator
HiLink ttcnRepeat Repeat
HiLink ttcnStat   Statement
HiLink ttcnStore  StorageClass
HiLink ttcnString String
HiLink ttcnTodo   Todo
HiLink ttcnType   Type
HiLink ttcnTypDef TypeDef
HiLink ttcnLog    PreProc
HiLink ttcnImportantMsg   Error
HiLink ttcnNotify   Type

delcommand HiLink


let b:current_syntax = "log"

