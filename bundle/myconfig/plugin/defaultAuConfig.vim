"remove trailing spaces
autocmd BufWritePre *.{cpp,hpp,ttcn3} :%s/\s\+$//e
"clear neosnippet placeholders when cancelling
autocmd InsertLeave * NeoSnippetClearMarkers

autocmd FileType qf wincmd J
