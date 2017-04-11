if exists('b:robotSupportLoaded')
    finish
endif
let b:robotSupportLoaded = 1

"grep -rn --include=\*.robot --include=\*.txt "^[A-Z][a-z0-9]" ./testsuite/WMP/DevWro1/ >tee list.txt
vnoremap <buffer> <c-]> "zy:OpenKeyword <C-r>z<CR>
nmap <buffer> <c-]> v$ <c-]>
