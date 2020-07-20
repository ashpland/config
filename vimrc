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
Plug 'majutsushi/tagbar'
Plug 'jalvesaq/vimcmdline'
Plug 'vim-scripts/vim-auto-save'
Plug 'kana/vim-arpeggio'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lifepillar/vim-solarized8'
Plug 'easymotion/vim-easymotion'

" Swift
Plug 'bumaociyuan/vim-swift'
Plug 'keith/swift.vim'
" Plug 'gfontenot/vim-xcode'
Plug 'xavierd/clang_complete'


" TypeScript
Plug 'pangloss/vim-javascript'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Shougo/unite.vim'
Plug 'Quramy/vim-dtsm'

" Clojure
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-salve'
Plug 'Olical/conjure', {'tag': 'v4.1.0'}

" Markdown
Plug 'plasticboy/vim-markdown'

call plug#end()


" Colours
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
colorscheme solarized8_flat

" from https://github.com/junegunn/dotfiles/blob/9545174d0e34075d16c1d6a01eed820bce9d6cc0/vimrc#L1657-L1686
" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu nornu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=20

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }


    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)

  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set ignorecase
set smartcase
map <Leader>n :noh<CR>

" EasyMotion
map ff <Plug>(easymotion-f)
map FF <Plug>(easymotion-F)
map tt <Plug>(easymotion-t)
map TT <Plug>(easymotion-T)
map ww <Plug>(easymotion-w)
map WW <Plug>(easymotion-W)
map bb <Plug>(easymotion-b)
map BB <Plug>(easymotion-B)
map ee <Plug>(easymotion-e)
map EE <Plug>(easymotion-E)
map gee <Plug>(easymotion-ge)
map gEE <Plug>(easymotion-gE)

map <Leader>w :set nowrap<CR>

" close-buffers.vim
nnoremap <silent> <Leader>q :Bdelete menu<CR>

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
set shiftwidth=0
set expandtab

set tm=400

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
let g:ale_lint_on_insert_leave = 1
nmap <Leader> = <Plug>(ale_fix)


" Change tabs
nnoremap tj  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tk  :tablast<CR>
nnoremap tn  :tabnew<CR>

map oo o<Esc>
map OO O<Esc>
map ooo ooO

set autoread "gets rid of file change [O] [L] thing
au CursorHold * checktime
map <Leader>yy yygccp
map <Leader>rr :redraw!<CR>

" Option delete (actually \)
inoremap « <ESC>dF xa
noremap « dF xa

set showcmd

" Disable macro recording
map q <Nop>

" QuickFix commands
" noremap [q :cprevious<CR>
" noremap ]q :cnext<CR>
" noremap <Leader>q :cclose<CR>
" noremap <Leader>Q :copen<CR>

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

" to manual line wrap: gww
  
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

nnoremap <silent> <Leader>t :TagbarToggle<CR>

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

nnoremap ∆ :m .+1<CR>==
nnoremap ô :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ô <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ô :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"UltiSnips Snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"
let g:UltiSnipsListSnippets="<c-g>"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
map <leader>s :UltiSnipsEdit<CR>

"cmdline
let cmdline_in_buffer = 0

call arpeggio#load()
let g:arpeggio_timeoutlen=80
let g:arpeggio_timeoutlens={'i':500, 'a':500, 'f': 500, 'F':500}

Arpeggio noremap ijk i(
Arpeggio noremap ajk a(
Arpeggio noremap fjk f(
Arpeggio noremap Fjk F(
Arpeggio noremap tjk t(
Arpeggio noremap Tjk T(
Arpeggio noremap  jk  (
Arpeggio imap     jk  (

Arpeggio noremap ihk i)
Arpeggio noremap ahk a)
Arpeggio noremap fhk f)
Arpeggio noremap Fhk F)
Arpeggio noremap thk t)
Arpeggio noremap Thk T)
Arpeggio noremap  hk  )
Arpeggio imap     hk  )

Arpeggio noremap ikl i[
Arpeggio noremap akl a[
Arpeggio noremap fkl f[
Arpeggio noremap Fkl F[
Arpeggio noremap tkl t[
Arpeggio noremap Tkl T[
Arpeggio noremap  kl  [
Arpeggio imap     kl  [

Arpeggio noremap ijl i]
Arpeggio noremap ajl a]
Arpeggio noremap fjl f]
Arpeggio noremap Fjl F]
Arpeggio noremap tjl t]
Arpeggio noremap Tjl T]
Arpeggio noremap  jl  ]
Arpeggio imap     jl  ]

Arpeggio noremap il; i{
Arpeggio noremap al; a{
Arpeggio noremap fl; f{
Arpeggio noremap Fl; F{
Arpeggio noremap tl; t{
Arpeggio noremap Tl; T{
Arpeggio noremap  l;  {
Arpeggio imap     l;  {

Arpeggio noremap ik; i}
Arpeggio noremap ak; a}
Arpeggio noremap fk; f}
Arpeggio noremap Fk; F}
Arpeggio noremap tk; t}
Arpeggio noremap Tk; T}
Arpeggio noremap  k;  }
Arpeggio imap     k;  }

Arpeggio noremap i;' i<
Arpeggio noremap a;' a<
Arpeggio noremap f;' f<
Arpeggio noremap F;' F<
Arpeggio noremap t;' t<
Arpeggio noremap T;' T<
Arpeggio noremap  ;'  <
Arpeggio imap     ;'  <

Arpeggio noremap il' i>
Arpeggio noremap al' a>
Arpeggio noremap fl' f>
Arpeggio noremap Fl' F>
Arpeggio noremap tl' t>
Arpeggio noremap Tl' T>
Arpeggio noremap  l'  >
Arpeggio imap     l'  >
