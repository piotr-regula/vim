if !exists('g:bookmarkerBookmarksDirName')
    let g:bookmarkerBookmarksDirName = '.bookmarkerBookmarks'
endif

if !exists('g:bookmarkerBookmarksDirPath')
    let g:bookmarkerBookmarksDirPath = expand('$HOME') . '/' . g:bookmarkerBookmarksDirName
endif

if !exists('g:bookmarkerEnableCustomBookmarkName')
    let g:bookmarkerEnableCustomBookmarkName = 1
endif

let g:bookmarkerBufferName = '__bookmarker__'
