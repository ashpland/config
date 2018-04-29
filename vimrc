" Vim
syntax enable
set background=light
set tabstop=4
set expandtab
set shiftwidth=4
set updatetime=1000


" Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'gfontenot/vim-xcode'
Plug 'christoomey/vim-tmux-runner'
Plug 'keith/swift.vim'
Plug 'keith/sourcekittendaemon.vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'vim-scripts/vim-auto-save'

call plug#end()


" Omnifunc
filetype plugin on
set omnifunc=syntaxcomplete#Complete


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Colours
:highlight QuickFixLine ctermbg=7
:highlight SpellCap ctermbg=5
:highlight MatchParen cterm=reverse ctermbg=White


" Auto-Save
let g:auto_save = 1
let g:auto_save_no_updatetime = 1