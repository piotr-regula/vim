fun! FindFiles(p_searchQuery)
    let searchQuery = a:p_searchQuery
    let findQueryCmd = "find . -iname \"*" . searchQuery . "*\" "
    let initialMsg = "Searching for " . searchQuery
    let showInitialMsg = ":cgete system('echo \"" . initialMsg . "\"')"

    let efmToRestore = &errorformat
    set errorformat=%f

    exec showInitialMsg
    exec ":caddexpr system('" . findQueryCmd . "') | copen"
    exec "normal! :match String /\\c" . searchQuery . "/\<cr>"

    let &errorformat = efmToRestore
endfun
command! -nargs=1 Find call FindFiles(<f-args>)

