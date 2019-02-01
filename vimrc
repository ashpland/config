" Vim

" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'blueyed/vim-diminactive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'guns/vim-clojure-static'
Plug 'pangloss/vim-javascript'
Plug 'keith/swift.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-brackets'
Plug 'haya14busa/incsearch.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'Asheq/close-buffers.vim'
Plug 'tpope/vim-fugitive'

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
nmap <Leader>~ :%s/«»//g<cr>
imap <Leader>~ <Esc>:%s/«»//g<cr>
vmap <Leader>~ <Esc>:%s/«»//g<cr>:sleep 100m<Esc>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" close-buffers.vim
nnoremap <silent> <Leader>q :CloseBuffersMenu<CR>

hi StatusLineNC cterm=bold ctermfg=white ctermbg=black
hi LineNr ctermfg=10
hi CursorLineNr cterm=bold ctermfg=13
hi CursorLine cterm=none ctermbg=0

set number relativenumber

set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

set tm=300

set foldmethod=syntax
set foldlevel=20

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
set splitbelow
set splitright

" leader shortcuts
" puts word under cursor into find/replace
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:map <Leader>e :FZF!<return>
:map <Leader>E :FZF!<space>
:map <Leader>f :Lines<return>
:nnoremap <Leader>F :Lines <C-r><C-w><return>

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
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=cyan
highlight ALEWarningSign ctermbg=NONE ctermfg=NONE
highlight SignColumn ctermbg=NONE
let g:ale_linters = {'javascript': ['eslint']}
nmap <silent> gk <Plug>(ale_previous_wrap)
nmap <silent> gj <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1

" Change tabs
map <Tab> :tabnext<CR>
map <S-Tab> :tabprevious<CR>
