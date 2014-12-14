"================================================================
"                           Various
"================================================================

function! OpenHeader()
  if match(expand("%:p"),'\.cpp') > 0
    let s:flipname = substitute(expand("%:p"),'\.cpp\(.*\)','\.hpp\1',"")
    let s:flipname = substitute(s:flipname,'Source','Include',"")
    exe ":e " . s:flipname
  endif
endfun

function! OpenSource()
  if match(expand("%:p"),'\.hpp') > 0
    let s:flipname = substitute(expand("%:p"),'\.hpp\(.*\)','\.cpp\1',"")
    let s:flipname = substitute(s:flipname,'Include','Source',"")
    exe ":e " . s:flipname
  endif
endfun

function! OpenTest()
  if match(expand("%:p"),'\.hpp\|\.cpp') > 0
    let s:flipname = substitute(expand("%:p"),'\(.*\)\.cpp\|\.hpp\(.*\)','\1TestSuite\.cpp\2',"")
    let s:flipname = substitute(s:flipname,'Include\|Source','Test_modules',"")
    exe ":e " . s:flipname
  endif
endfun

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

function CreateTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R --languages=php -f ' . curNodePath . '/tags ' . curNodePath
endfunction
