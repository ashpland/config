let b:ale_linters = ['swiftpm']
let b:ale_fixers = ['swiftformat']

map <LocalLeader><CR> :wa \| ! clear; swift build; .build/debug/Flag<CR>
