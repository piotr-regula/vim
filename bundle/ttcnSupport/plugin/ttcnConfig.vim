if !exists('g:ttcnMakeCmd')
    let g:ttcnMakeCmd='make -f remote-cplane/Makefile sct-clean-logs sct-run'
endif

if !exists('g:ttcnMakeOpts')
    let g:ttcnMakeOpts=''
endif

if !exists('g:ttcnComponentFlag')
    let g:ttcnComponentFlag='SC='
endif

if !exists('g:ttcnTestcaseFlag')
    let g:ttcnTestcaseFlag='TCS='
endif

if !exists('g:ttcnRootPath')
    let g:ttcnRootPath=''
endif
