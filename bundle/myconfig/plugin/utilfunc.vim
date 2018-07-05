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

function! OpenSourceCode()
    let s:flipname = substitute(expand("%:p"),'\(.*\)TestSuite\(.*\)\|\(.*\)','\1\2\3',"")
    let s:flipname = substitute(s:flipname,'\.hpp\(.*\)','\.cpp\1',"")
    let s:flipname = substitute(s:flipname,'Include\|Test_modules','Source',"")
    exe ":e " . s:flipname
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
    exec ':!ctags -R -f ' . curNodePath . '/tags ' . curNodePath
endfunction

fun! HighlightWordUnderCursorToggle()
    if exists("g:enableWordUnderCursorHighlighting") && g:enableWordUnderCursorHighlighting
      let g:enableWordUnderCursorHighlighting = 0
      exe "match none"
    else
      let g:enableWordUnderCursorHighlighting = 1
    endif
endfun

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

command! -nargs=0 HighlightWordUnderCursorToggle call HighlightWordUnderCursorToggle()
command! -nargs=1 FontSizeIncrease call AdjustFontSize(<f-args>)
command! -nargs=1 FontSizeDecrease call AdjustFontSize(-<f-args>)
