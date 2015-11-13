"create include statement from full path
nnoremap <buffer> <leader>pi pV:s/.*\///g<CR>i#include "<ESC>$a"<ESC>:noh<CR>
nnoremap <buffer> <C-h> :GenerateStlManPage<CR>
