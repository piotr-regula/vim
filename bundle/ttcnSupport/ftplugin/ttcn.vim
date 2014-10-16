setlocal iskeyword+==
iabbrev <buffer> = :=

nmap <buffer> <leader>pi pV:s/.*\///g<CR>iimport from <ESC>A all;<ESC>F.dt :noh<CR>

