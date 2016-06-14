"   vim-plug
" On windows, this plugin makes some assumptions about where it expects the .vim dir to be
" since I use ~/.vim everywhere, it's not ~/vimfiles, but .vim, so the next two lines are
" modified a bit from the norm to make this work...
set rtp+=~/.vim/
call plug#begin('$HOME/.vim/plugged')
"       Generally Useful:  {{{
Plug 'gmarik/Vundle.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'twilight' " Colorscheme that isn't supposed to suck
Plug 'https://github.com/vim-scripts/Zenburn.git'
Plug 'https://github.com/chriskempson/vim-tomorrow-theme.git'
"Plug 'tpope/vim-speeddating'
Plug 'https://github.com/sukima/xmledit.git'
"Plug 'https://github.com/powerline/powerline' " Needs Python, hence
Plug 'bling/vim-airline' " Why I prefer vim-airline
Plug 'chase/vim-ansible-yaml'
Plug 'jlanzarotta/bufexplorer'

" Tim Pope's Session management tool :Obsess (record session) and :Obsess! (delete)
"Plug 'https://github.com/tpope/vim-obsession.git'
"Plug 'Tabular' " Maybe use junegunn/vim-easy-align instead
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'othree/xml.vim'
Plug 'https://github.com/wincent/Command-T'
"Plug 'zoom.vim'
Plug 'https://github.com/Lokaltog/vim-easymotion.git'
" }}}
"       Programming: {{{
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-surround.git'
"Plug 'https://github.com/vim-scripts/Align.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
"Plug 'https://github.com/vim-scripts/jQuery.git'
Plug 'https://github.com/tpope/vim-git.git'
Plug 'https://github.com/thinca/vim-fontzoom.git'
"Plug 'https://github.com/kchmck/vim-coffee-script.git'
"Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'
" Clojure
Plug 'https://github.com/tpope/vim-fireplace.git'
Plug 'https://github.com/tpope/vim-classpath.git'
Plug 'https://github.com/guns/vim-clojure-static.git'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kovisoft/slimv'
Plug 'https://github.com/vim-scripts/paredit.vim'
Plug 'https://github.com/venantius/vim-eastwood'
Plug 'https://github.com/venantius/vim-cljfmt'
Plug 'https://github.com/tpope/vim-salve'


" Go Programming
Plug 'fatih/vim-go'
" Godoc Explorer
Plug 'garyburd/go-explorer'
"Plug 'Blackrush/vim-gocode' " This is a Vundle-friendly port of the below repo
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim', { 'build' : { 'windows' : 'toolsupdate-dll-mingw', 'cygwin' : 'make -f make_cygwin.mak', 'mac' : 'make -f make_mac.mak', 'linux' : 'make', 'unix' : 'gmake' } }
Plug 'https://github.com/plasticboy/vim-markdown.git'
" Rust Programming
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'

" Javscript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ternjs/tern_for_vim'
Plug 'posva/vim-vue'
" }}}
call plug#end()

"   Vundle {{{
"       Setup: {{{
"set nocompatible
"filetype off

" set the runtime path to include Vundle and initialize
"set rtp+=$HOME/.vim/bundle/Vundle.vim/
"call vundle#begin()
"       }}}
"call vundle#end()
"filetype plugin indent on
"   }}}
"syntax on
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
    set background=light
    colorscheme zenburn
    " See Adobe blog on Source Code Pro:
    " https://blogs.adobe.com/typblography/2012/09/source-code-pro.html
    "set guifont=Source\ Code\ Pro:h14
    set guifont=Hack:h10
    set guioptions=egmrt
    set guioptions-=T " Turn off Toolbar http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
    " Remove all the UI cruft
    "set go-=T
    "set go-=l
    "set go-=L
    "set go-=r
    "set go-=R

    if has("gui_gtk2")
        "set guifont=Inconsolata\ 12
        " See blog post on the font
        " https://blogs.adobe.com/typblography/2012/09/source-code-pro.html
        set guifont="Source Code Pro"
    elseif has("gui_win32")
        "set guifont=Consolas:h11
        set guifont=Hack:h10
        source $VIMRUNTIME/mswin.vim
        set background=light
        "colorscheme zenburn
        winp 0 0
        win 300 300 " It'll be too large but just maximize enough
        au GUIEnter * simalt ~x
    endif
else
    if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
        set t_Co=256
    endif
    try
        let g:solarized_termtrans=1
        let g:solarized_termcolors=256
        " for some reason, setting it dark then light again shows a different color
        " scheme entirely than just setting it light to begin with...
        set background=dark
        colorscheme solarized
    catch /^Vim\%((\a\+)\)\=:E185/
        set background=dark
        " colorscheme zenburn
    endtry
endif
if has("win32") || has("win64")
    colorscheme Tomorrow-Night
    " We want to use Windows Powershell in windows
    set shell=cmd.exe
    "set shellcmdflag=/c\ powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
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
"   Wildmenu completion --------------------------------------------------- {{{

set wildmenu
set wildmode=list:longest

set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

" Clojure/Leiningen
set wildignore+=classes

" }}}
"   Everything Else ------------------------------------------------------- {{{
set vb t_vb=
set ruler
set backup
set writebackup


set scrolloff=3

" TODO: Add settings for Windows support
" can't do this unless I figure out a windows way of doing it
" Backup directories
set undofile
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

nnoremap <silent> <Leader>= :ZoomReset<CR>

" Ctrl-S to save
inoremap <c-s> <Esc>:Update<CR>

nnoremap <leader>E :edit $MYVIMRC<cr>
nnoremap <leader>S :source $MYVIMRC<cr>

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

"nnoremap <silent> <Leader>r :set relativenumber<CR> " , r to use relative numbers
"nnoremap <silent> <Leader>n :set number<CR>         " , n to use regular line numbers

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
    return line . 'â€¦' . repeat(" ",fillcharcount) . foldedlinecount . 'â€¦' . ' '
endfunction " }}}

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

"set foldtext=MyFoldText()
set foldtext=CustomFoldText()

" }}}
" Plugin and Filetype Settings -------------------------------------------- {{{
"   Clojure {{{
"       VimClojure {{{
" To run, make sure you follow some instructions here: https://bitbucket.org/kotarak/vimclojure
" you need to make a plugin dependency
" Automatically determine indenting using fuzzy matching. e.g. the a line starting "(with-"
" will be indented two spaces.
let vimclojure#FuzzyIndent=1

" Highlight built-in functions from clojure.core and friends
let vimclojure#HighlightBuiltins=1

" Highlight functions from contrib
let vimclojure#HighlightContrib=1

" As new symbols are identified using VimClojure's dynamic features, automatically
" highlight them.
let vimclojure#DynamicHighlighting=1

" Color parens so they're easier to match visually
let vimclojure#ParenRainbow=1
if has("macunix")
    " Yes, I want nailgun support
    let vimclojure#WantNailgun = 1

    " Full path to the nailgun client
    let vimclojure#NailgunClient = "/usr/local/bin/ng"
endif
" }}}
"       SLIMV {{{
let g:slimv_leader = '\'
let g:slimv_keybindings = 2
" }}}
"       Rainbow Parentheses {{{
"       Enable rainbow parentheses for all buffers
"augroup rainbow_parentheses
"au!
"au VimEnter * RainbowParenthesesActivate
"au BufEnter * RainbowParenthesesLoadRound
"au BufEnter * RainbowParenthesesLoadSquare
"au BufEnter * RainbowParenthesesLoadBraces
"augroup END
"       }}}
"       filetype clojure {{{
augroup ft_clojure
    au!

    au FileType clojure call TurnOnClojureFolding()
    "au FileType clojure compiler clojure
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
"       paredit {{{
" when inside a (), <Enter> will open a newline.  Closing ) completes
" form either way
let g:paredit_electric_return = 1
"       }}}
" }}}
"   NERDTree {{{
" create a shortcut such that Ctrl+n is equivalent to :NERDTreeToggle
map <silent> <c-n> :NERDTreeToggle<cr>
"au Filetype nerdtree setlocal nolist

" auto-open NERDTree if file wasn't specified from vim call
autocmd StdinReadPre * let s:sd_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close Vim when NERDTree is only thing still open:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


let NERDTreeHighlightCursorline=1
"let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

"let NERDTreeMinimalUI = 1
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

" }}}
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
" }}}
"   Go {{{

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
"   Nim/NimRod {{{

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
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
" Automagic Clojure folding on defn's and defmacro's ---------------------- {{{
function GetClojureFold()
    if getline(v:lnum) =~ '^\s*(defn.*\s'
        return ">1"
    elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
        return ">1"
    elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
        return ">1"
    elseif getline(v:lnum) =~ '^\s*$'
        let my_cljnum = v:lnum
        let my_cljmax = line("$")

        while (1)
            let my_cljnum = my_cljnum + 1
            if my_cljnum > my_cljmax
                return "<1"
            endif

            let my_cljdata = getline(my_cljnum)

            " If we match an empty line, stop folding
            if my_cljdata =~ '^$'
                return "<1"
            else
                return "="
            endif
        endwhile
    else
        return "="
    endif
endfunction

function TurnOnClojureFolding()
    setlocal foldexpr=GetClojureFold()
    setlocal foldmethod=expr
endfunction
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
