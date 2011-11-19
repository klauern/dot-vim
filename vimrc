filetype off
" The ^ is important, don't mess with it...
set runtimepath^=~/.vim
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible

" Basic options ----------------------------------------------------------- {{{
" General {{{
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1000
set undolevels=1000
" set undofile
set undoreload=10000
set cpoptions+=J
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set ttimeout
set notimeout
set nottimeout
set autowrite
set shiftround
set autoread
set title

" }}}
" Tabs, spaces, wrapping {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set smarttab
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1

" }}}
" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}
" Environments (GUI/Console ------------------------------------------------ {{{
if has("gui_running")
  set background=light
   "colorscheme solarized " A little too bright for me on Windows
  colorscheme zenburn
  " colorscheme Tomorrow-Night
  set guioptions=egmrt
  " set guioptions-=T " Turn off Toolbar http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
  
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11
    source $VIMRUNTIME/mswin.vim
    " colorscheme Tomorrow-Night
    colorscheme solarized
    set background=dark
    winp 0 0
    win 300 300 " It'll be too large but just maximize enough
  endif
else
  colorscheme Tomorrow-Night
endif
" }}}

nnoremap <silent> <Leader>r :set relativenumber<CR> " , r to use relative numbers
nnoremap <silent> <Leader>n :set number<CR>         " , n to use regular line numbers

set vb t_vb=
set ruler
set nobackup
set writebackup



set scrolloff=3
"set undofile

" can't do this unless I figure out a windows way of doing it
" Backup directories
" set undodir=~/.vim/tmp/undo//     " undo files
" set backupdir=~/.vim/tmp/backup// " backups
" set directory=~/.vim/tmp/swap//   " swap files
" set backup                        " enable backups


" nnoremap <silent> = :ZoomReset<CR>

" Cursor Color highlight
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set backspace=indent,eol,start " make backspace a more flexible
au FocusLost * :wa " save when tab is out of focus

" Leader Key customizations
nnoremap <leader>w <C-w>v<C-w>l  " Vertical split
nnoremap <leader>ff :FufFile<cr>


" Line bubbling {{{
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Down> ]egv
vmap <C-Up> [egv
" }}}
" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch  " jumps to search word as you type (annoying but excellent)
set showmatch
set hlsearch
set gdefault

"set scrolloff=3
"set sidescroll=1
"set sidescrolloff=10

set virtualedit+=block

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Made D behave
nnoremap D d$

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv:call PulseCursorLine()<cr>
nnoremap N Nzzzv:call PulseCursorLine()<cr>

" Don't move on *
nnoremap * *<c-o>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Error navigation {{{
"
"             Location List     QuickFix Window
"            (e.g. Syntastic)     (e.g. Ack)
"            ----------------------------------
" Next      |     M-k               M-Down     |
" Previous  |     M-l                M-Up      |
"            ----------------------------------
"
nnoremap ˚ :lnext<cr>zvzz
nnoremap ¬ :lprevious<cr>zvzz
inoremap ˚ <esc>:lnext<cr>zvzz
inoremap ¬ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz
" }}}

" Directional Keys {{{

" It's 2011.
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

" }}}

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
" }}}

" }}}
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
" Vim filetype {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}
" Folding ----------------------------------------------------------------- {{{
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
" Plugin Settings --------------------------------------------------------- {{{
"   Clojure {{{

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
"   NERDTree {{{
" create a shortcut such that Ctrl+n is equivalent to :NERDTreeToggle
nmap <silent> <c-n> :NERDTreeToggle<CR>
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"   }}}
"   Ruby {{{

" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 

augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
augroup END

" }}}
"   Vundle {{{
"       Setup: {{{
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()
"       }}}
"       Generally Useful:  {{{
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
"       Programming: {{{
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
"       Ruby/Rails/Web Dev Programming: {{{
Bundle "https://github.com/tpope/vim-rails.git"
Bundle "https://github.com/vim-ruby/vim-ruby.git"
"Bundle "https://github.com/tpope/vim-rake.git"
Bundle "https://github.com/tpope/vim-cucumber.git"
"Bundle "https://github.com/hallison/vim-rdoc.git"

Bundle "https://github.com/cakebaker/scss-syntax.vim.git"
" }}}
"   }}}
" }}}
" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" }}}


