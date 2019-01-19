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

call plug#end()

" lh-brackets
imap ;; <Plug>MarkersJumpF
vmap ;; <Plug>MarkersJumpF
nmap ;; <Plug>MarkersJumpF
imap :: <Plug>MarkersJumpB
vmap :: <Plug>MarkersJumpB
nmap :: <Plug>MarkersJumpB
imap ;;; <Plug>MarkersCloseAllAndJumpToLast
vmap ;;; <Plug>MarkersCloseAllAndJumpToLast
nmap ;;; <Plug>MarkersCloseAllAndJumpToLast
nmap <Plug>MarkersMark <Plug>MarkersMark
nmap <Plug>MarkersJumpOutside <Plug>MarkersJumpOutside


" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

hi StatusLineNC cterm=bold ctermfg=white ctermbg=black
hi LineNr ctermfg=10
hi CursorLineNr cterm=bold ctermfg=13
hi CursorLine cterm=none ctermbg=0

set number relativenumber

set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

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
:map <Leader>E :FZF!
:map <Leader>f :Lines<return>

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
