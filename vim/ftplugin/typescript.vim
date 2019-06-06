" Fix files with prettier, and then ESLint.
let b:ale_linters = ['tsserver']
let b:ale_fixers = ['prettier', 'tslint']

set shiftwidth=2
set autoindent
set smartindent

" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript nmap <buffer> <LocalLeader>i : <C-u>echo tsuquyomi#hint()<CR>
nnoremap <LocalLeader>r :TsuRenameSymbol<CR>
nnoremap <LocalLeader>f :TsuReferences<CR>
nnoremap <LocalLeader>d :TsuTypeDefinition<CR>
nnoremap <LocalLeader>dd <C-O>
