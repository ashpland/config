let b:ale_linters = ['swiftpm']
let b:ale_fixers = ['swiftformat']
let b:ale_swift_swiftformat_options = '--indent 2'
let b:ale_fix_on_save_ignore = 1

map <LocalLeader><CR> :wa \| ! clear; swift build; .build/debug/Balance<CR>

let g:auto_save = 1  " enable AutoSave on Vim startup to get error checking

set tabstop=4
set shiftwidth=0
set expandtab

let b:cmdline_app           = {}
let b:cmdline_app['swift'] = 'swift -I .build/debug'

map <LocalLeader>c :Commentary \| call VimCmdLineSendLineAndStay() \| Commentary<CR>
