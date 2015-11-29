"create include statement from full path
nnoremap <buffer> <leader>pi pV:s/.*\///g<CR>i#include "<ESC>$a"<ESC>:noh<CR>
"create man page in new buffer for std::word under cursor
nnoremap <buffer> <C-h> :GenerateStlManPage<CR>
"start highlighting word under cursor
autocmd CursorMoved * silent! exe 
\       exists("g:enableWordUnderCursorHighlighting") && g:enableWordUnderCursorHighlighting?
\           printf('match IncSearch /\<%s\>/', expand('<cword>'))
\           : ""
