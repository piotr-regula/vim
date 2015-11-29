if !exists('g:bookmarkerBookmarksFileName')
    let g:bookmarkerBookmarksFileName = '.bookmarkerBookmarks'
endif

if !exists('g:bookmarkerBookmarksPath')
    let g:bookmarkerBookmarksPath = expand('$HOME') . '/' . g:bookmarkerBookmarksFileName
endif

"if !exists('g:bookmarkerEnableModify')
"    let g:bookmarkerEnableModify = 0
"endif

if !exists('g:bookmarkerEnableCustomBookmarkName')
    let g:bookmarkerEnableCustomBookmarkName = 1
endif
