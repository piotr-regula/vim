"================================================================
"                           Various
"================================================================

function! OpenHeader()
  if match(expand("%"),'\.cpp') > 0
    let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','\.hpp\1',"")
    let s:flipname = substitute(s:flipname,'Source','Include',"")
    exe ":e " . s:flipname
  endif
endfun

function! OpenSource()
  if match(expand("%"),'\.hpp') > 0
    let s:flipname = substitute(expand("%"),'\.hpp\(.*\)','\.cpp\1',"")
    let s:flipname = substitute(s:flipname,'Include','Source',"")
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

fun! s:lolfun()
    echo "LOLOLOLOLOL"
endfun

command! -nargs=0 LOL call s:lolfun()

