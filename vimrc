" Vim

let maplocalleader= " "

" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'haya14busa/incsearch.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-unimpaired'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Swift
Plug 'bumaociyuan/vim-swift'
Plug 'keith/swift.vim'
" Plug 'gfontenot/vim-xcode'

" TypeScript
Plug 'pangloss/vim-javascript'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Shougo/unite.vim'
Plug 'Quramy/vim-dtsm'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'

" Markdown
Plug 'plasticboy/vim-markdown'

call plug#end()

" lh-brackets
imap <Leader><Tab> <Plug>MarkersJumpF
vmap <Leader><Tab> <Plug>MarkersJumpF
nmap <Leader><Tab> <Plug>MarkersJumpF
imap <Leader><S-tab> <Plug>MarkersJumpB
vmap <Leader><S-tab> <Plug>MarkersJumpB
nmap <Leader><S-tab> <Plug>MarkersJumpB
imap <Leader>` <Plug>MarkersCloseAllAndJumpToLast
vmap <Leader>` <Plug>MarkersCloseAllAndJumpToLast
nmap <Leader>` <Plug>MarkersCloseAllAndJumpToLast
nmap <Plug>MarkersMark <Plug>MarkersMark
nmap <Plug>MarkersJumpOutside <Plug>MarkersJumpOutside

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set ignorecase
set smartcase

" close-buffers.vim
nnoremap <silent> <Leader>q :CloseBuffersMenu<CR>

hi StatusLineNC cterm=bold ctermfg=white ctermbg=black
hi LineNr ctermfg=10
hi CursorLineNr cterm=bold ctermfg=13
hi CursorLine cterm=none ctermbg=0
hi Statement ctermfg=6
hi SpellCap ctermbg=7
hi SpellBad ctermbg=0

set number relativenumber

set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

set tm=300

set foldmethod=indent
set foldlevel=20
map \| za

augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-J> <Esc><C-W><C-J>
inoremap <C-K> <Esc><C-W><C-K>
inoremap <C-L> <Esc><C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>
set splitbelow
set splitright
map ≥ <C-W>>
map ≤ <C-W><
map ≠ <C-W>+
map – <C-W>-
map ± <C-W>=
" window
nmap <leader>swh  :topleft  vsp<CR>
nmap <leader>swl :botright vsp<CR>
nmap <leader>swk    :topleft  sp<CR>
nmap <leader>swj  :botright sp<CR>
" buffer
nmap <leader>sh   :leftabove  vsp<CR>
nmap <leader>sl  :rightbelow vsp<CR>
nmap <leader>sk     :leftabove  sp<CR>
nmap <leader>sj   :rightbelow sp<CR>


" leader shortcuts
" puts word under cursor into find/replace
" :nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:map <Leader>e :FZF!<return>
:map <Leader>E :FZF!<space>
:map <Leader>f :BLines<return>
:nnoremap <Leader>F :BLines <C-r><C-w><return>
:map <Leader>g :Lines<return>
:nnoremap <Leader>G :Lines <C-r><C-w><return>
:map <Leader>o :only<CR>

" Rg settings
:map <Leader>r :Rg<return>
:nnoremap <Leader>R :Rg <C-r><C-w><return>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)|")

" searches Dash for word under cursor
:nnoremap <Leader>d :silent exec '! ashp-open dash://<C-r><C-w>' \| :redraw!<return>
:nnoremap <Leader>v :tabe ~/.vimrc<return>

" status bar
set laststatus=2

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f
"set statusline+=%#CursorColumn#
set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
"set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

autocmd BufNewFile,BufRead *.mustache set syntax=javascript

" Ale Settings
" https://github.com/w0rp/ale/issues/44#issuecomment-283252535
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
highlight ALEErrorSign ctermbg=NONE ctermfg=cyan
highlight ALEWarningSign ctermbg=NONE ctermfg=NONE
highlight SignColumn ctermbg=NONE
nmap <silent> gk <Plug>(ale_previous_wrap)
nmap <silent> gj <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1


" Change tabs
nnoremap tj  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tk  :tablast<CR>
nnoremap tn  :tabnew<CR>

" Supertab
let g:SuperTabCrMapping=1
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


map oo o<Esc>
map OO O<Esc>
map ooo ooO

set autoread "gets rid of file change [O] [L] thing
map <Leader>m :wall \|! clear; make cur<CR>
imap <Leader>m <Esc><Leader>m
map <Leader>yy yygccp
map <Leader>rr :redraw!<CR>

" Option delete (actually \)
map db dbx
inoremap « <C-O>db<Backspace>OC

set showcmd

hi CursorLine ctermbg=16
hi DiffText cterm=bold ctermfg=none ctermbg=153
hi DiffChange cterm=none ctermbg=255
hi DiffAdd cterm=none ctermbg=157
hi DiffDelete ctermbg=174
hi Comment ctermfg=14
hi Constant ctermfg=4
hi MatchParen cterm=reverse ctermbg=none ctermfg=none
hi Folded ctermfg=0

set diffopt+=vertical,filler,iwhite

command! Outside hi CursorLine ctermbg=7 | RainbowToggleOff
command! Inside hi CursorLine ctermbg=16 | RainbowToggleOn

set bs=2

"insert single character
nnoremap <Leader>i i_<Esc>r

set breakindent
set linebreak
set conceallevel=2
  
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}
