let b:ale_linters = ['swiftpm']
let b:ale_fixers = ['swiftformat']
let b:ale_swift_swiftformat_options = '--indent 2'
let b:ale_fix_on_save_ignore = 1

map <LocalLeader><CR> :wa \| ! clear; swift build; .build/debug/mapbuddy<CR>

let g:auto_save = 1  " enable AutoSave on Vim startup to get error checking

set tabstop=4
set shiftwidth=0
set expandtab

let cmdline_app = {}
let cmdline_app["swift"] = "swift -I.build/debug -I/Users/andrew/Documents/code/lib/Soiree/.build/x86_64-apple-macosx/debug -L/Users/andrew/Documents/code/lib/Soiree/.build/x86_64-apple-macosx/debug -lSoiree__REPL"

map <LocalLeader>c :Commentary \| call VimCmdLineSendLineAndStay() \| Commentary<CR>
