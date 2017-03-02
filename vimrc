"   vim-plug
" On windows, this plugin makes some assumptions about where it expects the .vim dir to be
" since I use ~/.vim everywhere, it's not ~/vimfiles, but .vim, so the next two lines are
" modified a bit from the norm to make this work...
set rtp+=~/.vim/
call plug#begin('$HOME/.vim/plugged')
"       Generally Useful:  {{{
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'twilight' " Colorscheme that isn't supposed to suck
Plug 'https://github.com/vim-scripts/Zenburn.git'
Plug 'https://github.com/chriskempson/vim-tomorrow-theme.git'
Plug 'https://github.com/sukima/xmledit.git'
Plug 'bling/vim-airline' " I prefer vim-airline over powerline
Plug 'pearofducks/ansible-vim'
Plug 'jlanzarotta/bufexplorer'

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'antlypls/vim-colors-codeschool'
Plug 'nanotech/jellybeans.vim'
Plug 'othree/xml.vim'
Plug 'https://github.com/wincent/Command-T'
Plug 'https://github.com/Lokaltog/vim-easymotion.git'
" }}}
"       Programming: {{{
Plug 'vim-syntastic/syntastic'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-git.git'
Plug 'https://github.com/thinca/vim-fontzoom.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'

" Go Programming {{{
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/neocomplete.vim', { 'for': 'go' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'garyburd/go-explorer', { 'for': 'go' }
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim', { 'build' : { 'windows' : 'toolsupdate-dll-mingw', 'cygwin' : 'make -f make_cygwin.mak', 'mac' : 'make -f make_mac.mak', 'linux' : 'make', 'unix' : 'gmake' } }
" }}}
Plug 'https://github.com/plasticboy/vim-markdown.git'
" Rust Programming
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'rust' }

" }}}
call plug#end()

set nocompatible

" Basic options ----------------------------------------------------------- {{{
"   General --------------------------------------------------------------- {{{
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
set undoreload=10000
set cpoptions+=J
set list
set listchars=tab:¿\ ,eol:¬,extends:¿,precedes:¿
set lazyredraw
set matchtime=3
set showbreak=â†ª
set splitbelow
set splitright
set ttimeout
set notimeout
set nottimeout
set autowrite
set shiftround
set autoread
set title

set tags+=tags;$HOME

" }}}
"   Tabs, spaces, wrapping ------------------------------------------------ {{{
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
"   Leader ---------------------------------------------------------------- {{{
let mapleader = ","
let maplocalleader = "\\"
" }}}
"   Environments (GUI/Console --------------------------------------------- {{{
if has("gui_running")
    set background=dark
    colorscheme solarized
    " See Adobe blog on Source Code Pro:
    " https://blogs.adobe.com/typblography/2012/09/source-code-pro.html
    set guioptions=egmrt
    set guioptions-=T " Turn off Toolbar http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
    set guioptions-=r " Turn off right-side scroll bar
    set guioptions-=m " turn off menu bar

    if has("gui_gtk2")
        " See blog post on the font
        " https://blogs.adobe.com/typblography/2012/09/source-code-pro.html
        set anti enc=utf-8
        set guifont=Source\ Code\ Pro\ 12
        set lines=999 columns=999
    elseif has("gui_win32")
        set guifont=Hack:h10
        source $VIMRUNTIME/mswin.vim
        set background=light
        winp 0 0
        win 300 300 " It'll be too large but just maximize enough
        au GUIEnter * simalt ~x
    endif
else
    if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
        set t_Co=256
    endif
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    colorscheme jellybeans
endif
if has("win32") || has("win64")
    colorscheme Tomorrow-Night
    " We want to use Windows Powershell in windows
    set shell=cmd.exe
    set shellpipe=|
    set shellredir=>
endif
" }}}
"   Line bubbling --------------------------------------------------------- {{{
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Down> ]egv
vmap <C-Up> [egv
" }}}
"   Everything Else ------------------------------------------------------- {{{
set vb t_vb=
set ruler
set backup
set writebackup


set scrolloff=3

" Backup directories
set undofile
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

nnoremap <silent> <Leader>= :ZoomReset<CR>

" Cursor Color highlight
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set backspace=indent,eol,start " make backspace a more flexible
au FocusLost * :wa " save when tab is out of focus

" Leader Key customizations
nnoremap <leader>w <C-w>v<C-w>l  " Vertical split
"nnoremap <leader>ff :FufFile<cr>
"nnoremap <leader>fb :FufBuffer<cr>
nnoremap <silent> <Leader>r :call RelativeNumberToggle()<CR>
nnoremap <silent> <Leader>n :call AbsoluteNumberToggle()<CR>

" Settings for Ctrl-P plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|class|)$|(^|[/\\])\.(hg|git|svn)($|[/\\])|__init__\.py'

let g:ctrlp_use_caching = 0
"if executable('pt')
    "if has("win32") || has("win64")
        "set grepprg=pt\ /nogroup\ /nocolor
        "let g:ctrlp_user_command = 'pt %s /l /nocolor /g ""'
    "else
        "set grepprg=pt\ --nogroup\ --nocolor
        "let g:ctrlp_user_command = 'pt %s -l --nocolor -g ""'
    "endif
"endif

" }}}
" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase " ignore case-sensitive results when searching (/foo match /fOo)
set smartcase
set incsearch  " jumps to search word as you type (annoying but excellent)
set showmatch
set hlsearch
set gdefault

set virtualedit+=block

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Made D behave
nnoremap D d$

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
nnoremap Ëš :lnext<cr>zvzz
nnoremap Â¬ :lprevious<cr>zvzz
inoremap Ëš <esc>:lnext<cr>zvzz
inoremap Â¬ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

"Tagbar
nmap <F8> :TagbarToggle<CR>
" Tagbar for Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

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
" Folding ----------------------------------------------------------------- {{{
set foldlevelstart=99

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

set foldtext=CustomFoldText()

" }}}
" Plugin and Filetype Settings -------------------------------------------- {{{
"   NERDTree {{{
" create a shortcut such that Ctrl+n is equivalent to :NERDTreeToggle
map <silent> <c-n> :NERDTreeToggle<cr>

" auto-open NERDTree if file wasn't specified from vim call
autocmd StdinReadPre * let s:sd_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close Vim when NERDTree is only thing still open:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeHighlightCursorline=1
let NERDTreeDirArrows = 1
"   }}}
"   Ruby {{{

" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2

augroup ft_ruby
    au!
    "au Filetype ruby setlocal foldmethod=syntax
augroup END

"   }}}
"   Java {{{

augroup ft_java
    au!
    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
    au BufRead,BufNewFile *.java set shiftwidth=4
    au BufRead,BufNewFile *.java set softtabstop=4
augroup END

" }}}
"   Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
"   }}}
"   Go {{{

function! LoadGoPlugin()
    call plug#load('vim-go')
endfunction
command! PlugGo call LoadGoPlugin()

" Go keyboard mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

let g:neocomplete#enable_at_startup = 1
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable syntax highting on everything
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

"   }}}
"   Vim-Airline {{{
 let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
"   }}}
" }}}
" Relative and Absolute Line Number toggling {{{
function! AbsoluteNumberToggle()
    set norelativenumber
    if(&number == 1)
        set nonumber
    else
        set number
    endif
endfunc

function! RelativeNumberToggle()
    set nonumber
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" }}}
