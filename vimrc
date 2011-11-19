filetype off
" The ^ is important, don't mess with it...
set runtimepath^=~/.vim
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible

" set fileformats=unix,dos,mac
" set modelines=0

if has('relativenumber')
  set relativenumber
endif

if has("gui_running")
  set background=light
   "colorscheme solarized " A little too bright for me on Windows
  colorscheme zenburn
  " colorscheme Tomorrow-Night
  set guioptions=egmrt
  " set guioptions-=T " Turn off Toolbar http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11
    source $VIMRUNTIME/mswin.vim
    colorscheme Tomorrow-Night
    winp 0 0
    win 300 300 " It'll be too large but just maximize enough

  endif
else
  colorscheme Tomorrow-Night
endif

set autoindent
set copyindent
set smartindent
set shiftround
syntax on
filetype on
filetype indent on


filetype plugin indent on
set tabstop=8 " Leave this 8 for legacy reasons; should also make it easier
" to spot the hated hard-tab.
" set softtabstop=4 " Real men use 4-space indents
" set shiftwidth=4 " Now we can use < and > in visual (marking) mode to block
" indent/unindent regions; also used at the beginning of lines thanks to
" smarttab

set hlsearch
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
set nobackup
set writebackup

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
set visualbell
set ttyfast
set laststatus=2
"set undofile

" Backup directories
" set undodir=~/.vim/tmp/undo//     " undo files
" set backupdir=~/.vim/tmp/backup// " backups
" set directory=~/.vim/tmp/swap//   " swap files
" set backup                        " enable backups

" comma better than \
let mapleader = ","

nnoremap <silent> <Leader>r :set relativenumber<CR> " backslash r to use relative numbers
nnoremap <silent> <Leader>n :set number<CR>         " backslash n to use regular line numbers

" nnoremap <silent> = :ZoomReset<CR>

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
if has("colorcolumn")
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

" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}

" Clojure {{{

" VimClojure {{{
" To run, make sure you follow some instructions here: https://bitbucket.org/kotarak/vimclojure
" you need to make a plugin dependency
let vimclojure#WantNailgun = 0
let vimclojure#NailgunClient = "C:\\mydocs\\Clojure\\vimclojure-nailgun-client\\ng.exe"
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1
" }}}
" SLIMV {{{
let g:slimv_leader = '\'
let g:slimv_keybindings = 2
" }}}

" filetype clojure {{{
augroup ft_clojure
    au!

    au FileType clojure call TurnOnClojureFolding()
    au FileType clojure compiler clojure
    au FileType clojure setlocal report=100000
    au FileType clojure nnoremap <buffer> o jI<cr><esc>kA
    au FileType clojure nnoremap <buffer> O I<cr><esc>kA

    au BufWinEnter        Slimv.REPL.clj setlocal winfixwidth
    au BufNewFile,BufRead Slimv.REPL.clj setlocal nowrap
    au BufNewFile,BufRead Slimv.REPL.clj setlocal foldlevel=99
    au BufNewFile,BufRead Slimv.REPL.clj nnoremap <buffer> A GA
    au BufNewFile,BufRead Slimv.REPL.clj nnoremap <buffer> <localleader>R :emenu REPL.<Tab>

    " Fix the eval mapping.
    au FileType clojure nmap <buffer> \ee \ed

    " Indent top-level form.
    au FileType clojure nmap <buffer> <localleader>= v((((((((((((=%

    " Use a swank command that works, and doesn't require new app windows.
    au FileType clojure let g:slimv_swank_cmd='!dtach -n /tmp/dtach-swank.sock -r winch lein swank'
augroup END
" }}}
" }}}
" Vim filetype {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}
" Ruby {{{

augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
augroup END

" }}}
" Folding ------------------------------------------------------------------ {{{
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Vundle {{{
" Vundle is different from the vim-update-bundles script, but does about the
" same thing
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
" Generally Useful:  {{{
Bundle "https://github.com/scrooloose/nerdtree.git"
" Need the L-9 plugin fro FuzzyFinder
Bundle "https://github.com/vim-scripts/L9.git"
Bundle "https://github.com/vim-scripts/FuzzyFinder.git"
" Colorscheme that isn't supposed to suck
Bundle "https://github.com/vim-scripts/Zenburn.git"
Bundle "https://github.com/altercation/vim-colors-solarized.git"

Bundle "Command-T"
Bundle "Tabular"
Bundle "VimClojure"
Bundle "Solarized"
Bundle "groovy.vim"
Bundle "xml.vim"
" }}}

" Programming: {{{
Bundle "https://github.com/scrooloose/nerdcommenter.git"
Bundle "https://github.com/tpope/vim-surround.git"
Bundle "https://github.com/vim-scripts/Align.git"
"Bundle "https://github.com/vim-scripts/taglist.vim" " Doesn't work for some reason.
Bundle "https://github.com/tpope/vim-fugitive.git"
Bundle "https://github.com/vim-scripts/jQuery.git"
Bundle "https://github.com/tpope/vim-git.git"
Bundle "Markdown"
Bundle "zoom.vim"
Bundle "https://github.com/kchmck/vim-coffee-script.git"
Bundle "https://github.com/pangloss/vim-javascript.git"
Bundle "https://github.com/tpope/vim-unimpaired.git"
" }}}

" Ruby/Rails/Web Dev Programming: {{{
Bundle "https://github.com/tpope/vim-rails.git"
Bundle "https://github.com/vim-ruby/vim-ruby.git"
"Bundle "https://github.com/tpope/vim-rake.git"
Bundle "https://github.com/tpope/vim-cucumber.git"
"Bundle "https://github.com/hallison/vim-rdoc.git"

Bundle "https://github.com/cakebaker/scss-syntax.vim.git"
" }}}
" }}}


