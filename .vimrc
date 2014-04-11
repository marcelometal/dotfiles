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
Bundle 'Colour-Sampler-Pack'
Bundle 'ScrollColors'
Bundle 'snipMate'
Bundle 'rodjek/vim-puppet.git'
Bundle 'jnwhiteh/vim-golang'
Bundle 'rstacruz/sparkup'
Bundle 'vim-indent-object'
Bundle 'darkspectrum'
Bundle 'aldmeris'
Bundle 'pyflakes.vim'
Bundle 'vim-flake8'
Bundle 'DetectIndent'
Bundle 'Git-Branch-Info'

filetype plugin indent on     " required!


"colorscheme darkspectrum
"colorscheme jellybeans
colorscheme aldmeris

syntax on
set bg=dark


highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set guifont=monofur:h15

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

set statusline=%{GitBranchInfoString()}%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)


"set nobackup
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
