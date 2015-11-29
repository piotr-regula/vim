nnoremap <buffer> <Enter> ^f/gf
nnoremap <buffer> <Down> j^l
nnoremap <buffer> <Up> k^l
nmap j <buffer> <Down>
nmap k <buffer> <Up>
nnoremap <buffer> D :call BookmarkerRemoveBookmark()<CR>
au BufEnter <buffer> call ReloadBookmarks()
