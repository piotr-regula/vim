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

fun BookmarkerRemoveBookmark()
    let l:bookmarkToRemove = getline('.')
    let l:bookmarkToRemove = substitute(l:bookmarkToRemove,'^ [\d\+\] \(.*\)','\1',"")
    let l:bookmarkName = substitute(l:bookmarkToRemove,'==>','\1',"")
    let l:bookmarks = readfile(g:bookmarkerBookmarksPath)
    let l:index = 0
    for l:bookmark in l:bookmarks
        if l:bookmark == l:bookmarkToRemove
            call remove(l:bookmarks, l:index)
            break
        endif
        let l:index=l:index+1
    endfor
    call writefile(l:bookmarks, g:bookmarkerBookmarksPath)
    call ReloadBookmarks()
endfun


command! -nargs=0 BookmarkerAddBookmark call BookmarkerAddBookmark()
command! -nargs=0 BookmarkerOpenBookmarks call BookmarkerOpenBookmarks()

