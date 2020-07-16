nnoremap <LocalLeader>e :%Eval<CR>
nmap <LocalLeader>f 0f(cpp
nmap <LocalLeader>F (cpp
let g:clojure_align_subforms = 1
set fdm=syntax

" only works once (cljs-repl) has been called
nmap <LocalLeader>c :Piggieback (figwheel.main.api/repl-env "dev")<CR>
nmap <LocalLeader>C :Piggieback (figwheel-sidecar.system/repl-env (:figwheel-system reloaded.repl/system) nil)<CR>

" let b:ale_linters = ['clj-kondo', 'joker']
let b:ale_linters = ['clj-kondo']
let b:ale_fixers = ['trim_whitespace']
let b:ale_fix_on_save = 1

nmap gcf (i#_<Esc>

nmap <LocalLeader>r :RunTests<CR>
