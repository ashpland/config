nnoremap <LocalLeader>e :%Eval<CR>
nmap <LocalLeader>f 0f(cpp
nmap <LocalLeader>F (cpp
let g:clojure_align_subforms = 1
set fdm=syntax
nmap <LocalLeader>c :Piggieback (figwheel.main.api/repl-env "dev")<CR>
let b:ale_fixers = ['trim_whitespace']
nmap gcf (i#_<Esc>
