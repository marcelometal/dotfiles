filetype off                  " required!


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'aldmeris'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'ap/vim-css-color'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fugitive.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'prettier/vim-prettier'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chrisbra/csv.vim'
Plugin 'fatih/vim-go'
Plugin 'psf/black'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


colorscheme aldmeris
set bg=dark

let python_highlight_all=1
syntax on

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 sts=0 expandtab

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" GO
" let g:go_def_mapping_enabled=0
"let g:go_fmt_command = "goimports"

let g:go_autodetect_gopath = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_gocode_propose_source = 0
let g:go_list_type = "quickfix"

let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_types = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'golangci-lint']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" JSX
let g:jsx_ext_required = 0


" CSS Color

let g:cssColorVimDoNotMessMyUpdatetime = 1


" Ctrl+p

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


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
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|.egg-info|exty\/firefox\/.*|exty\/chrome\/.*|node_modules|vendor)$',
    \ 'file': '\.DS_Store$\|\.so$\|\.jpg|\.gif|\.png|\.psd$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }


" Syntastic

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_python_flake8_exec = "python3"
let g:syntastic_python_flake8_exec = 'flake8-py3'


" Airline

let g:airline_powerline_fonts = 1
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'


" Black

let g:black_linelength = 80


" GUI

if has("gui_running")
  if has("gui_gtk2")
    set guifont=monofur\ for\ Powerline\ 14
  elseif has("gui_gtk3")
    set guifont=monofur\ for\ Powerline\ 16
  elseif has("gui_photon")
    set guifont=monofur\ for\ Powerline:s14
    set fuopt=maxvert,maxhorz
  elseif has("gui_kde")
    set guifont=monofur\ for\ Powerline/14/-1/5/50/0/0/0/1/0
    set fuopt=maxvert,maxhorz
  elseif has("x11")
    set guifont=-*-monofur-medium-r-normal-*-*-170-*-*-m-*-*
    set fuopt=maxvert,maxhorz
  else
    set guifont=monofur\ for\ Powerline:h15
    " set guifont=Inconsolata\ for\ Powerline:h15
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

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  execute "set colorcolumn=" . join(range(81,335), ',')
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

map <Leader>b :call InsertLine()<CR>
function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

map <Leader>m :call InsertLineFocus()<CR>
function! InsertLineFocus()
  let trace = expand("\n# FIXME\nfrom nose_focus import focus\n@focus")
  execute "normal o".trace
endfunction

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

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

set guitablabel=%M%f

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
