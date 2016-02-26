nnoremap <buffer> <Enter> ^f/gf
nnoremap <buffer> <Down> j^l
nnoremap <buffer> <Up> k^l
nmap <buffer> j <Down>
nmap <buffer> k <Up>
nnoremap <buffer> D :call BookmarkerRemoveBookmark()<CR>
nnoremap <buffer> <Right> :call LoadNextBookmarksGroup()<CR>
nnoremap <buffer> <Left> :call LoadPreviousBookmarksGroup()<CR>
nmap <buffer> l <Right>
nmap <buffer> h <Left>
au BufEnter <buffer> call ReloadBookmarks()
