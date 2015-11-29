fun FileExists(file)
    return !empty(glob(a:file))
endfun

fun GetCurrentFilePath()
    return expand("%:p")
endfun

function AddNewBookmark()
    let l:bookmarkName = expand("%:t:r")
    if g:bookmarkerEnableCustomBookmarkName == 1
        let l:bookmarkName = input("Bookmark name: ", l:bookmarkName)
    endif
    if l:bookmarkName == ""
        return
    endif
    let l:bookmarks = readfile(g:bookmarkerBookmarksPath)
    let l:bookmarkEntry = GetCurrentFilePath() . " =>> " . l:bookmarkName
    let l:bookmarks = l:bookmarks + [l:bookmarkEntry]

    call writefile(l:bookmarks, g:bookmarkerBookmarksPath)
endfun

function CreateEmptyFileIfItDoesntExist()
    if !FileExists(g:bookmarkerBookmarksPath)
        call writefile([], g:bookmarkerBookmarksPath)
    endif
endfun

fun BookmarkerAddBookmark()
    if  GetCurrentFilePath() ==''
        echom 'no file to add'
    else
        call CreateEmptyFileIfItDoesntExist()
        call AddNewBookmark()
    endif
endfun

fun ReloadBookmarks()
    exec 'setlocal modifiable'
    exec 'normal ggVG"_d'
    let l:bookmarks = readfile(g:bookmarkerBookmarksPath)
    let l:index=0
    for l:bookmark in l:bookmarks
      let l:bookmark=" [" . l:index . "] " . l:bookmark
      put =l:bookmark
      let l:index=l:index+1
    endfor
    exec 'setlocal nomodifiable'
endfun

fun BookmarkerOpenBookmarks()
    exec "split " . "def"
    call ReloadBookmarks()
    exec 'set filetype=bookmarker'
    exec 'setlocal buftype=nofile'
endfun

function ShouldRemoveBookmark(bookmarkToRemove)
    let l:bookmarkName = substitute(a:bookmarkToRemove,'.* =>> \(.*\)','\1',"")
    let l:confirm = input("Are you sure you want to remove " . l:bookmarkName . "? (y/n): ")
    if l:confirm != "y"
        return 0
    endif
    return 1
endfunction

fun RemoveBookmark(bookmarkToRemove)
    let l:bookmarks = readfile(g:bookmarkerBookmarksPath)
    let l:index = 0
    for l:bookmark in l:bookmarks
        if l:bookmark == a:bookmarkToRemove
            call remove(l:bookmarks, l:index)
            break
        endif
        let l:index=l:index+1
    endfor
    call writefile(l:bookmarks, g:bookmarkerBookmarksPath)
endfun
fun GetBookmarkToRemove()
    let l:bookmarkToRemove = getline('.')
    let l:bookmarkToRemove = substitute(l:bookmarkToRemove,'^ [\d\+\] \(.*\)','\1',"")
    return l:bookmarkToRemove
endfun
fun BookmarkerRemoveBookmark()
    let l:bookmarkToRemove = GetBookmarkToRemove()
    if ShouldRemoveBookmark(l:bookmarkToRemove) == 0
        return
    endif
    call RemoveBookmark(l:bookmarkToRemove)
    call ReloadBookmarks()
endfun


command! -nargs=0 BookmarkerAddBookmark call BookmarkerAddBookmark()
command! -nargs=0 BookmarkerOpenBookmarks call BookmarkerOpenBookmarks()

