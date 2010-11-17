runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  "call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
end

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set number
set hlsearch
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=indent,eol,start

let g:GetLatestVimScripts_allowautoinstall= 1

colorscheme ir_black

set incsearch  " jumps to search word as you type (annoying but excellent)

" This is for vimClojure
let vimclojure#NailgunClient = "/Users/klauer/.vimbundles/vimclojure/ng"
let clj_want_gorilla = 1

let g:rsenseHome = "$RSENSE_HOME"

" create a shortcut such that Ctrl+n is equivalent to :NERDTreeToggle
nmap <silent> <c-n> :NERDTreeToggle<CR>

" from
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ruler
set ttyfast
set laststatus=2
"set relativenumber
"set undofile

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :let @/=''<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
if has('colorcolumn')
  set colorcolumn=85
endif

set list
set listchars=tab:▸\ ,eol:¬

au FocusLost * :wa " save when tab is out of focus

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv


