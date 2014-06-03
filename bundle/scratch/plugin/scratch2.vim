" File: scratch2.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 1.0
" Last Modified: June 3, 2003
"
" Overview
" --------
" You can use the scratch2 plugin to create a temporary scratch2 buffer to store
" and edit text that will be discarded when you quit/exit vim. The contents
" of the scratch2 buffer are not saved/stored in a file.
"
" Installation
" ------------
" 1. Copy the scratch2.vim plugin to the $HOME/.vim/plugin directory. Refer to
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
" You can use the following command to open/edit the scratch2 buffer:
"
"       :Scratch2
"
" To open the scratch2 buffer in a new split window, use the following command:
"
"       :Sscratch2
"
" When you close the scratch2 buffer window, the buffer will retain the
" contents. You can again edit the scratch2 buffer by openeing it using one of
" the above commands. There is no need to save the scatch buffer.
"
" When you quit/exit Vim, the contents of the scratch2 buffer will be lost.
" You will not be prompted to save the contents of the modified scratch2
" buffer.
"
" You can have only one scratch2 buffer open in a single Vim instance. If the
" current buffer has unsaved modifications, then the scratch2 buffer will be
" opened in a new window
"
" ****************** Do not modify after this line ************************
if exists('loaded_scratch2') || &cp
    finish
endif
let loaded_scratch2=1

" Scratch2 buffer name
let Scratch2BufferName = "__Scratch2__"

" Scratch2BufferOpen
" Open the scratch2 buffer
function! s:Scratch2BufferOpen(new_win)
    let split_win = a:new_win

    " If the current buffer is modified then open the scratch2 buffer in a new
    " window
    if !split_win && &modified
        let split_win = 1
    endif

    " Check whether the scratch2 buffer is already created
    let scr_bufnum = bufnr(g:Scratch2BufferName)
    if scr_bufnum == -1
        " open a new scratch2 buffer
        if split_win
            exe "vnew " . g:Scratch2BufferName
        else
            exe "edit " . g:Scratch2BufferName
        endif
    else
        " Scratch2 buffer is already created. Check whether it is open
        " in one of the windows
        let scr_winnum = bufwinnr(scr_bufnum)
        if scr_winnum != -1
            " Jump to the window which has the scratch2 buffer if we are not
            " already in that window
            if winnr() != scr_winnum
                exe scr_winnum . "wincmd w"
            endif
        else
            " Create a new scratch2 buffer
            if split_win
                exe "vsplit +buffer" . scr_bufnum
            else
                exe "buffer " . scr_bufnum
            endif
        endif
    endif
endfunction

" Scratch2MarkBuffer
" Mark a buffer as scratch2
function! s:Scratch2MarkBuffer()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfunction

autocmd BufNewFile __Scratch2__ call s:Scratch2MarkBuffer()

" Command to edit the scratch2 buffer in the current window
command! -nargs=0 Scratch2 call s:Scratch2BufferOpen(0)
" Command to open the scratch2 buffer in a new split window
command! -nargs=0 Sscratch2 call s:Scratch2BufferOpen(1)

