" File: scratch5.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 1.0
" Last Modified: June 3, 2003
"
" Overview
" --------
" You can use the scratch5 plugin to create a temporary scratch5 buffer to store
" and edit text that will be discarded when you quit/exit vim. The contents
" of the scratch5 buffer are not saved/stored in a file.
"
" Installation
" ------------
" 1. Copy the scratch5.vim plugin to the $HOME/.vim/plugin directory. Refer to
"    the following Vim help topics for more information about Vim plugins:
"
"       :help add-plugin
"       :help add-global-plugin
"       :help runtimepath
"
" 2. Restart Vim.
"
" Usage
" -----
" You can use the following command to open/edit the scratch5 buffer:
"
"       :Scratch5
"
" To open the scratch5 buffer in a new split window, use the following command:
"
"       :Sscratch5
"
" When you close the scratch5 buffer window, the buffer will retain the
" contents. You can again edit the scratch5 buffer by openeing it using one of
" the above commands. There is no need to save the scatch buffer.
"
" When you quit/exit Vim, the contents of the scratch5 buffer will be lost.
" You will not be prompted to save the contents of the modified scratch5
" buffer.
"
" You can have only one scratch5 buffer open in a single Vim instance. If the
" current buffer has unsaved modifications, then the scratch5 buffer will be
" opened in a new window
"
" ****************** Do not modify after this line ************************
if exists('loaded_scratch5') || &cp
    finish
endif
let loaded_scratch5=1

" Scratch5 buffer name
let Scratch5BufferName = "__Scratch5__"

" Scratch5BufferOpen
" Open the scratch5 buffer
function! s:Scratch5BufferOpen(new_win)
    let split_win = a:new_win

    " If the current buffer is modified then open the scratch5 buffer in a new
    " window
    if !split_win && &modified
        let split_win = 1
    endif

    " Check whether the scratch5 buffer is already created
    let scr_bufnum = bufnr(g:Scratch5BufferName)
    if scr_bufnum == -1
        " open a new scratch5 buffer
        if split_win
            exe "new " . g:Scratch5BufferName
        else
            exe "edit " . g:Scratch5BufferName
        endif
    else
        " Scratch5 buffer is already created. Check whether it is open
        " in one of the windows
        let scr_winnum = bufwinnr(scr_bufnum)
        if scr_winnum != -1
            " Jump to the window which has the scratch5 buffer if we are not
            " already in that window
            if winnr() != scr_winnum
                exe scr_winnum . "wincmd w"
            endif
        else
            " Create a new scratch5 buffer
            if split_win
                exe "split +buffer" . scr_bufnum
            else
                exe "buffer " . scr_bufnum
            endif
        endif
    endif
endfunction

" Scratch5MarkBuffer
" Mark a buffer as scratch5
function! s:Scratch5MarkBuffer()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfunction

autocmd BufNewFile __Scratch5__ call s:Scratch5MarkBuffer()

" Command to edit the scratch5 buffer in the current window
command! -nargs=0 Scratch5 call s:Scratch5BufferOpen(0)
" Command to open the scratch5 buffer in a new split window
command! -nargs=0 Sscratch5 call s:Scratch5BufferOpen(1)

