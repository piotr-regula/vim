let s:currentBookmarkGroupFileName = "0"

fun FileExists(file)
    return !empty(glob(a:file))
endfun

fun GetCurrentFilePath()
    return expand("%:p")
endfun

fun GetCurrentBookmarksFilePath()
    let l:bookmarksFilePath = g:bookmarkerBookmarksDirPath . "/" . s:currentBookmarkGroupFileName . ".bookmarker"
    return l:bookmarksFilePath
endfun

fun GetBookmarkName()
    let l:bookmarkName = expand("%:t:r")
    if g:bookmarkerEnableCustomBookmarkName == 1
        let l:bookmarkName = input("Bookmark name: ", l:bookmarkName)
    endif
    return l:bookmarkName
endfun

fun WriteNewBookmarkEntryToFile(bookmarkName)
    let l:bookmarksFilePath = GetCurrentBookmarksFilePath()
    let l:bookmarks = readfile(l:bookmarksFilePath)
    let l:bookmarkEntry = GetCurrentFilePath() . " =>> " . a:bookmarkName
    let l:bookmarks = l:bookmarks + [l:bookmarkEntry]
    call writefile(l:bookmarks, l:bookmarksFilePath)
endfun

function AddNewBookmark()
    let l:bookmarkName = GetBookmarkName()
    if l:bookmarkName == ""
        return
    endif
    call WriteNewBookmarkEntryToFile(l:bookmarkName)
endfun

fun InitBookmarkDataIfItDoesntExist()
    if !isdirectory(g:bookmarkerBookmarksDirPath)
        call mkdir(g:bookmarkerBookmarksDirPath, "p")
    endif
    let l:bookmarksFilePath = GetCurrentBookmarksFilePath()
    if !FileExists(l:bookmarksFilePath)
        call writefile([], l:bookmarksFilePath)
    endif
endfun

fun BookmarkerAddBookmark()
    if  GetCurrentFilePath() ==''
        echom 'BookmarkerAddBookmark error: no file to add'
    else
        call InitBookmarkDataIfItDoesntExist()
        call AddNewBookmark()
    endif
endfun

fun GetBookmarkGroupList()
    let l:bookmarkGroupList = split(globpath(g:bookmarkerBookmarksDirPath, '*.bookmarker'), '\n')
    return l:bookmarkGroupList
endfun

fun ExtractBookmarkGroupNameFromPath(bookmarkGroupPath)
    let l:bookmarkGroup = substitute(a:bookmarkGroupPath, '.*\/\(.*\)\.bookmarker', '\1','')
    return l:bookmarkGroup
endfun

fun WriteBookmarkGroupListToBuffer()
    let l:bookmarkGroupList = GetBookmarkGroupList()
    let l:output = ' '
    for l:bookmarkGroup in l:bookmarkGroupList
        let l:bookmarkGroup = ExtractBookmarkGroupNameFromPath(l:bookmarkGroup)
        let l:output = l:output . '[#' . l:bookmarkGroup . '] '
    endfor
    put =l:output
    exec 'center'
    put =''
endfun

fun HighlightActiveGroup()
    exec "match String '\\[\\zs#" . s:currentBookmarkGroupFileName . "\\ze]'"
endfun

fun WriteBookmarksToBuffer()
    let l:bookmarksFilePath = GetCurrentBookmarksFilePath()
    let l:bookmarks = readfile(l:bookmarksFilePath)
    let l:index=0
    for l:bookmark in l:bookmarks
        let l:bookmark=" [" . l:index . "] " . l:bookmark
        put =l:bookmark
        let l:index=l:index+1
    endfor
endfun

fun WriteHelp()
    let l:helpLine = "|HELP| D - delete currently selected bookmark"
    put =l:helpLine
    put =''
endfun

fun ReloadBookmarks()
    call InitBookmarkDataIfItDoesntExist()
    exec 'setlocal modifiable'
    exec 'normal ggVG"_d'
    call WriteBookmarkGroupListToBuffer()
    call HighlightActiveGroup()
    call WriteHelp()
    call WriteBookmarksToBuffer()
    exec 'setlocal nomodifiable'
endfun

fun BookmarkerOpenBookmarks()
    exec "split " . g:bookmarkerBufferName
    call ReloadBookmarks()
    exec 'set filetype=bookmarker'
    exec 'setlocal buftype=nofile'
endfun

fun ShouldRemoveBookmark(bookmarkToRemove)
    let l:bookmarkName = substitute(a:bookmarkToRemove,'.* =>> \(.*\)','\1',"")
    let l:confirm = input("Are you sure you want to remove " . l:bookmarkName . "? (y/n): ")
    if l:confirm != "y"
        return 0
    endif
    return 1
endfun

fun RemoveBookmark(bookmarkToRemove)
    let l:bookmarksFilePath = GetCurrentBookmarksFilePath()
    let l:bookmarks = readfile(l:bookmarksFilePath)
    let l:index = 0
    for l:bookmark in l:bookmarks
        if l:bookmark == a:bookmarkToRemove
            call remove(l:bookmarks, l:index)
            break
        endif
        let l:index=l:index+1
    endfor
    call writefile(l:bookmarks, l:bookmarksFilePath)
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

fun GetIndexOfCurrentBookmarkGroupInGroupList(bookmarkGroupList)
    let l:index = 0
    for l:bookmarkGroup in a:bookmarkGroupList
        if ExtractBookmarkGroupNameFromPath(l:bookmarkGroup) ==# s:currentBookmarkGroupFileName
            return l:index
        endif
        let l:index = l:index + 1
    endfor
    return -1
endfun

fun ChangeBookmarkGroup(jumpOffset)
    let l:bookmarkGroupList = GetBookmarkGroupList()
    let l:currBookmarkGroupIndex = GetIndexOfCurrentBookmarkGroupInGroupList(l:bookmarkGroupList)
    if l:currBookmarkGroupIndex == -1
        echom "LoadNextBookmarksGroup error: current Bookmark group doesn't exist"
        return
    endif
    let l:currBookmarkGroupIndex = (l:currBookmarkGroupIndex + a:jumpOffset) % len(l:bookmarkGroupList)
    let s:currentBookmarkGroupFileName = ExtractBookmarkGroupNameFromPath(l:bookmarkGroupList[l:currBookmarkGroupIndex])
endfun

fun ChangeBookmarkGroupAndReloadBookmarks(jumpOffset)
    call ChangeBookmarkGroup(a:jumpOffset)
    call ReloadBookmarks()
endfun

fun LoadNextBookmarksGroup()
    call ChangeBookmarkGroupAndReloadBookmarks(1)
endfun

fun LoadPreviousBookmarksGroup()
    call ChangeBookmarkGroupAndReloadBookmarks(-1)
endfun

fun AddNewBookmarkGroupInteractive()
    let l:newBookmarkGroupName = input("Type the name of your new bookmark group: ")
    call AddNewBookmarkGroup(l:newBookmarkGroupName)
endfun

fun AddNewBookmarkGroup(newBookmarkGroupName)
    if a:newBookmarkGroupName == ""
        echom 'AddNewBookmarkGroup error: no group to add'
        return
    endif
    let l:newBookmarkGroupFilePath = g:bookmarkerBookmarksDirPath . "/" . a:newBookmarkGroupName . ".bookmarker"
    if !FileExists(l:newBookmarkGroupFilePath)
        call writefile([], l:newBookmarkGroupFilePath)
    endif
endfun

fun RemoveBookmarkGroupInteractive()
    let l:bookmarkGroupNameToRemove = input("Type the name of the bookmark group you wish to remove: ")
    call RemoveBookmarkGroup(l:bookmarkGroupNameToRemove)
endfun

fun RemoveBookmarkGroup(bookmarkGroupNameToRemove)
    if a:bookmarkGroupNameToRemove == ""
        echom "RemoveBookmarkGroup error: no group to remove"
        return
    endif
    let l:bookmarkGroupPathToRemove = g:bookmarkerBookmarksDirPath . "/" . a:bookmarkGroupNameToRemove . ".bookmarker"
    if a:bookmarkGroupNameToRemove ==# s:currentBookmarkGroupFileName
        call ChangeBookmarkGroup(1)
    endif
    if FileExists(l:bookmarkGroupPathToRemove)
        silent! exec "!rm " . l:bookmarkGroupPathToRemove
    endif
endfun

fun RemoveCurrentBookmarkGroup()
    let l:confirm = input("Are you sure you want to remove current bookmark tab - [#" . s:currentBookmarkGroupFileName . "] ? (y/n): ") 
    if l:confirm != "y"
        return
    endif
    call RemoveBookmarkGroup(s:currentBookmarkGroupFileName)
endfun

command! -nargs=0 BookmarkerAddBookmark call BookmarkerAddBookmark()
command! -nargs=0 BookmarkerOpenBookmarks call BookmarkerOpenBookmarks()
command! -nargs=0 BookmarkerAddNewBookmarkTab call AddNewBookmarkGroupInteractive()
command! -nargs=0 BookmarkerRemoveBookmarkTab call RemoveBookmarkGroupInteractive()

