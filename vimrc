runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
end

set nocompatible
set autoindent
set copyindent
set number
set smartindent
set shiftround
syntax on
filetype on
filetype indent on
filetype plugin on
set hlsearch
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=indent,eol,start
set vb t_vb=
set ruler
set history=1000
set undolevels=1000

let g:GetLatestVimScripts_allowautoinstall= 1

colorscheme desert

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
set ttyfast
set laststatus=2
"set relativenumber
"set undofile

" Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	color desert
	colorscheme desert
	set hlsearch
"	set guifont=Consolas:h10
endi

set backspace=indent,eol,start " make backspace a more flexible
" Ruby {
" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 
" }

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

" Remove any text (like the '#') before BUNDLE to enable a plugin.
" Generally Useful:
" Bundle: https://github.com/scrooloose/nerdtree.git
" Bundle: https://github.com/vim-scripts/bufexplorer.zip.git
" Bundle: https://github.com/bronson/vim-closebuffer.git
" Bundle: https://github.com/vim-scripts/IndexedSearch.git
" Bundle: https://github.com/bronson/vim-trailing-whitespace.git
" Bundle: https://github.com/Raimondi/YAIFA.git
" Bundle: https://github.com/tpope/vim-vividchalk.git
" Bundle: https://github.com/vim-scripts/desert.vim.git
" Bundle: https://github.com/vim-scripts/FuzzyFinder.git
" Need the L-9 plugin fro FuzzyFinder
" Bundle: https://github.com/vim-scripts/L9.git

" # BUNDLE: git://git.wincent.com/command-t.git
" #   If rvm is installed, make sure we compile command-t with the system ruby
" # BUNDLE-COMMAND: if which rvm >/dev/null 2>&1; then rvm system exec rake make; else rake make; fi

" Programming:
" Bundle: https://github.com/scrooloose/nerdcommenter.git
" Bundle: https://github.com/tpope/vim-surround.git
" # Bundle: https://github.com/vim-scripts/taglist.vim " Doesn't work for some reason.
" Bundle: https://github.com/msanders/snipmate.vim.git
" Bundle: https://github.com/scrooloose/snipmate-snippets.git
" Bundle: https://github.com/vim-scripts/Align.git
" Bundle: https://github.com/tpope/vim-endwise.git
" Bundle: https://github.com/tpope/vim-repeat.git
" Bundle: https://github.com/tpope/vim-fugitive.git
" Bundle: https://github.com/ervandew/supertab.git
" Bundle: https://github.com/vim-scripts/jQuery.git
" Bundle: https://github.com/tpope/vim-git.git
" Bundle: https://github.com/tpope/vim-markdown.git
" Bundle: https://github.com/timcharper/textile.vim.git
" Bundle: https://github.com/kchmck/vim-coffee-script.git
" Bundle: https://github.com/tpope/vim-abolish.git
" Bundle: https://github.com/pangloss/vim-javascript.git
" Bundle: https://github.com/tpope/vim-unimpaired.git

" Ruby/Rails Programming:
" Bundle: https://github.com/vim-ruby/vim-ruby.git
" Bundle: https://github.com/tpope/vim-rails.git
" Bundle: https://github.com/tpope/vim-rake.git
" # Bundle: https://github.com/janx/vim-rubytest.git
" Bundle: https://github.com/tsaleh/vim-shoulda.git
" Bundle: https://github.com/tpope/vim-cucumber.git
" Bundle: https://github.com/tpope/vim-haml.git
" Bundle: https://github.com/astashov/vim-ruby-debugger.git
" Bundle: https://github.com/hallison/vim-rdoc.git
