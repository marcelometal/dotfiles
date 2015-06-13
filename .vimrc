set nocompatible              " be iMproved
filetype off                  " required!

"autocmd! bufwritepost .vimrc source %

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'
Bundle 'tpope/vim-markdown'
Bundle 'Colour-Sampler-Pack'
Bundle 'ScrollColors'
Bundle 'snipMate'
"Bundle 'rodjek/vim-puppet.git'
"Bundle 'jnwhiteh/vim-golang'
"Bundle 'fatih/vim-go'
Bundle 'rstacruz/sparkup'
Bundle 'vim-indent-object'
Bundle 'darkspectrum'
Bundle 'aldmeris'
Bundle 'pyflakes.vim'
Bundle 'vim-flake8'
Bundle 'DetectIndent'
"Bundle 'Git-Branch-Info'
Bundle 'pep8'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

filetype plugin indent on     " required!


"colorscheme darkspectrum
"colorscheme jellybeans
colorscheme aldmeris

execute pathogen#infect()

syntax on
set bg=dark


highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"set guifont=monofur:h15

if has("gui_running")
  if has("gui_gtk2")
    set guifont=monofur\ for\ Powerline\ 12
  elseif has("gui_photon")
    set guifont=monofur\ for\ Powerline:s12
    set fuopt=maxvert,maxhorz
  elseif has("gui_kde")
    set guifont=monofur\ for\ Powerline/12/-1/5/50/0/0/0/1/0
    set fuopt=maxvert,maxhorz
  elseif has("x11")
    set guifont=-*-monofur-medium-r-normal-*-*-170-*-*-m-*-*
    set fuopt=maxvert,maxhorz
  else
    set guifont=monofur\ for\ Powerline:h12
    set fuopt=maxvert,maxhorz
  endif
endif

set modelines=0

set clipboard=unnamed

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent

set hlsearch
set incsearch
set showmatch

set number

let mapleader = ","

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set wildignore=*.swp,*.bak,*.pyc,*/.git/*
set wildignore+=*/tmp/*,*.so,*.zip   " Linux/MacOSX

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
"set noswapfile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  execute "set colorcolumn=" . join(range(81,335), ',')
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


source ~/.vim/includes/ctrlp

" DetectIdent
:autocmd BufReadPost * DetectIndent
:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 2


map <Leader>b :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

"autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:pyflakes_use_quickfix = 0

map <Leader> <Plug>(easymotion-prefix)

let g:airline_powerline_fonts = 1

"set statusline=%{GitBranchInfoString()}%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
"let g:airline_section_b = '%{GitBranchInfoString()}'
"

let g:go_fmt_command = "gofmt"

"tab mappings
"map <D-1> 1gt
"map <D-2> 2gt
"map <D-3> 3gt
"map <D-4> 4gt
"map <D-5> 5gt
"map <D-6> 6gt
"map <D-7> 7gt
"map <D-8> 8gt
"map <D-9> 9gt

:nnoremap <C-S-t> :tabnew<CR>
:inoremap <C-S-t> <Esc>:tabnew<CR>
:inoremap <C-S-w> <Esc>:tabclose<CR>

nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <M-0> 10gt

nnoremap <S-h> gT
nnoremap <S-l> gt

nmap <silent> <Leader>y :CtrlPMRU<CR>
nmap <silent> <Leader>t :CtrlPMixed<CR>
nmap <silent> <Leader>r :CtrlPClearCache<CR>
let g:ctrlp_open_new_file = 't'
let g:ctrlp_lazy_update = 100
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_default_input = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|.egg-info|exty\/firefox\/.*|exty\/chrome\/.*|node_modules)$',
    \ 'file': '\.DS_Store$\|\.so$\|\.jpg|\.gif|\.png|\.psd$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

"set guioptions-=e

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

set guitablabel=%M%f

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
