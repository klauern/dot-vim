set runtimepath^=~/.vim
set fileformats=unix,dos,mac
filetype off
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
end

set rtp+=~/.vim/vundle.git/ 

set nocompatible
set modelines=0

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11
  endif
endif

"colorscheme zenburn

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
set softtabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=indent,eol,start
set vb t_vb=
set ruler
set history=1000
set undolevels=1000

" let g:GetLatestVimScripts_allowautoinstall= 1


set incsearch  " jumps to search word as you type (annoying but excellent)

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
set ttyfast
set laststatus=2
set relativenumber
set undofile

nnoremap <silent> <Leader>r :set relativenumber<CR> " backslash r to use relative numbers
nnoremap <silent> <Leader>n :set number<CR>         " backslash n to use regular line numbers

" Cursor Color highlight
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"	syntax on
"	set hlsearch
"	set guifont=Consolas:h10
"endi

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


" Leader Key customizations
nnoremap <leader>w <C-w>v<C-w>l  " Vertical split
nnoremap <leader>ff :FufFile<cr>


" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Vundle is different from the vim-update-bundles script, but does about the
" same thing
call vundle#rc()
" Generally Useful:
Bundle "https://github.com/scrooloose/nerdtree.git"
" Need the L-9 plugin fro FuzzyFinder
Bundle "https://github.com/vim-scripts/L9.git"
Bundle "https://github.com/vim-scripts/FuzzyFinder.git"
" Bundle "https://github.com/vim-scripts/bufexplorer.zip.git"
" Bundle "https://github.com/bronson/vim-closebuffer.git"
" Bundle "https://github.com/vim-scripts/IndexedSearch.git"
" Bundle "https://github.com/bronson/vim-trailing-whitespace.git"
" Bundle "https://github.com/Raimondi/YAIFA.git"
" Bundle "https://github.com/tpope/vim-vividchalk.git"

" Colorscheme that isn't supposed to suck
Bundle "https://github.com/vim-scripts/Zenburn.git"

" Programming:
Bundle "https://github.com/scrooloose/nerdcommenter.git"
Bundle "https://github.com/tpope/vim-surround.git"
Bundle "https://github.com/vim-scripts/Align.git"
" Bundle "https://github.com/vim-scripts/taglist.vim" " Doesn't work for some reason.
" Bundle "https://github.com/msanders/snipmate.vim.git"
" Bundle "https://github.com/scrooloose/snipmate-snippets.git"
" Bundle "https://github.com/tpope/vim-endwise.git"
" Bundle "https://github.com/tpope/vim-repeat.git"
" Bundle "https://github.com/tpope/vim-fugitive.git"
" Bundle "https://github.com/ervandew/supertab.git"
Bundle "https://github.com/vim-scripts/jQuery.git"
Bundle "https://github.com/tpope/vim-git.git"
Bundle "https://github.com/tpope/vim-markdown.git"
Bundle "https://github.com/kchmck/vim-coffee-script.git"
" Bundle "https://github.com/timcharper/textile.vim.git"
Bundle "https://github.com/pangloss/vim-javascript.git"
Bundle "https://github.com/tpope/vim-unimpaired.git"
" Bundle "https://github.com/tpope/vim-abolish.git"

" Ruby/Rails Programming:
Bundle "https://github.com/vim-ruby/vim-ruby.git"
Bundle "https://github.com/tpope/vim-rails.git"
Bundle "https://github.com/tpope/vim-rake.git"
Bundle "https://github.com/tpope/vim-cucumber.git"
Bundle "https://github.com/hallison/vim-rdoc.git"
" Bundle "https://github.com/janx/vim-rubytest.git"
" Bundle "https://github.com/tsaleh/vim-shoulda.git"
" Bundle "https://github.com/tpope/vim-haml.git"
" Bundle "https://github.com/astashov/vim-ruby-debugger.git"
