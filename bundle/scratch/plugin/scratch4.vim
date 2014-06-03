" File: scratch4.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 1.0
" Last Modified: June 3, 2003
"
" Overview
" --------
" You can use the scratch4 plugin to create a temporary scratch4 buffer to store
" and edit text that will be discarded when you quit/exit vim. The contents
" of the scratch4 buffer are not saved/stored in a file.
"
" Installation
" ------------
" 1. Copy the scratch4.vim plugin to the $HOME/.vim/plugin directory. Refer to
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
" You can use the following command to open/edit the scratch4 buffer:
"
"       :Scratch4
"
" To open the scratch4 buffer in a new split window, use the following command:
"
"       :Sscratch4
"
" When you close the scratch4 buffer window, the buffer will retain the
" contents. You can again edit the scratch4 buffer by openeing it using one of
" the above commands. There is no need to save the scatch buffer.
"
" When you quit/exit Vim, the contents of the scratch4 buffer will be lost.
" You will not be prompted to save the contents of the modified scratch4
" buffer.
"
" You can have only one scratch4 buffer open in a single Vim instance. If the
" current buffer has unsaved modifications, then the scratch4 buffer will be
" opened in a new window
"
" ****************** Do not modify after this line ************************
if exists('loaded_scratch4') || &cp
    finish
endif
let loaded_scratch4=1

" Scratch4 buffer name
let Scratch4BufferName = "__Scratch4__"

" Scratch4BufferOpen
" Open the scratch4 buffer
function! s:Scratch4BufferOpen(new_win)
    let split_win = a:new_win

    " If the current buffer is modified then open the scratch4 buffer in a new
    " window
    if !split_win && &modified
        let split_win = 1
    endif

    " Check whether the scratch4 buffer is already created
    let scr_bufnum = bufnr(g:Scratch4BufferName)
    if scr_bufnum == -1
        " open a new scratch4 buffer
        if split_win
            exe "vnew " . g:Scratch4BufferName
        else
            exe "edit " . g:Scratch4BufferName
        endif
    else
        " Scratch4 buffer is already created. Check whether it is open
        " in one of the windows
        let scr_winnum = bufwinnr(scr_bufnum)
        if scr_winnum != -1
            " Jump to the window which has the scratch4 buffer if we are not
            " already in that window
            if winnr() != scr_winnum
                exe scr_winnum . "wincmd w"
            endif
        else
            " Create a new scratch4 buffer
            if split_win
                exe "vsplit +buffer" . scr_bufnum
            else
                exe "buffer " . scr_bufnum
            endif
        endif
    endif
endfunction

" Scratch4MarkBuffer
" Mark a buffer as scratch4
function! s:Scratch4MarkBuffer()
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal buflisted
endfunction

autocmd BufNewFile __Scratch4__ call s:Scratch4MarkBuffer()

" Command to edit the scratch4 buffer in the current window
command! -nargs=0 Scratch4 call s:Scratch4BufferOpen(0)
" Command to open the scratch4 buffer in a new split window
command! -nargs=0 Sscratch4 call s:Scratch4BufferOpen(1)

