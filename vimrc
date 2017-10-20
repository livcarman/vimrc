" --------------------------------------------------------------------------
"  Vim Configuration
"
"  Maintainer:
"    Liv Carman <liv@livcarman.com> (https://www.livcarman.com/)
"
"  Repository:
"    https://github.com/livcarman/vimrc
"
" --------------------------------------------------------------------------

" Launch {{{

" On Windows, use '.vim' instead of 'vimfiles'
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
endif

" }}}

" Folding {{{

set foldenable         " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10     " maximum # of nested folds
set foldmethod=indent  " fold based on indent level

" Fold this file itself
augroup vimrcFold
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" }}}

" Plugins {{{

" Use vim-plug to manage plugins inside the specified directory
call plug#begin('~/.vim/bundle')

" Use :PlugInstall to install these plugins
Plug 'morhetz/gruvbox'                 " Gruvbox color scheme
Plug 'editorconfig/editorconfig-vim'   " Editorconfig support
Plug 'ntpeters/vim-better-whitespace'  " Highlight trailing whitespace
Plug 'sheerun/vim-polyglot'            " Extended language support

" End plugin definitions
call plug#end()

" }}}

" Colors & Fonts {{{

filetype plugin indent on  " Detect file types for syntax highlighting
syntax on                  " Enable syntax highlighting
set background=dark        " Assume a dark background color
set t_Co=256               " Set number of colors
let &colorcolumn='80'      " Highlight the 80th column

" Disable background color erase (BCE). This allows color schemes to
" render properly in tmux and GNU screen.
if &term =~ '256color'
  set t_ut=
endif

" Set the color scheme (but don't complain if it's not installed)
try
  colorscheme gruvbox
catch
endtry

" Set the font by OS
if has("mac") || has("macunix")
    set gfn=Hack:h12,Source\ Code\ Pro:h12,Menlo:h12
elseif has("win16") || has("win32")
    set gfn=Hack:h12,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h12
elseif has("gui_gtk2")
    set gfn=Hack\ 12,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 12
elseif has("linux")
    set gfn=Hack\ 12,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 12
elseif has("unix")
    set gfn=Monospace\ 12
endif

" }}}

" File Handling {{{

" Make en_US.UTF-8 the default locale (but don't complain if we're
" in neovim and re-sourcing this file)
try
  set encoding=utf8
catch
endtry

set ffs=unix,dos,mac  " Make Unix the default file format (for LF EOL)
set autoread          " Automatically re-read files edited outside of vim

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost *
    \ if line("'\'") > 0 && line("'\'") <= line("$") |
    \  exe "normal! g`\"" |
    \ endif
augroup end
set viminfo^=%

" }}}

" Tabs, Spaces, & Indentation {{{

set tabstop=2      " Number of visual spaces per tab
set softtabstop=2  " Number of visual spaces per tab when editing
set expandtab      " TAB key inserts spaces
set wrap           " Wrap lines
set shiftwidth=2   " Number of columns used by reindent & cindent
set smartindent    " Do smart indentation when inserting a new line

" }}}

" UI {{{

set number        " Show line numbers
set ruler         " Show current position
set showcmd       " Show last command entered
set lazyredraw    " Reduce number of screen redraws
set cursorline    " Highlight current line
set hid           " Hide abandoned buffers
set cmdheight=1   " Set height of command bar
set mouse=a       " Default to mouse mode on
set noerrorbells  " No annoying error sounds
set showmatch     " Highlight matching [{()}]
set mat=2         " How long to blink when matching [{()]}
set history=500   " How many lines of history to remember

" Use par for prettier line formatting
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'

" Enable visual autocomplete for command menu. Tab-complete searches up to
" the longest unambiguous prefix.
set wildmenu
set wildmode=list:longest,full

" Set extra options when running in a GUI
if has("gui_running")
  set guioptions-=T  " Don't show the toolbar
  set guioptions-=e  " Don't show tab pages
endif

" }}}

" Custom Keybindings {{{

" Save a file with elevated permissions (but don't complain if we already
" defined this command.
try
  command W w !sudo tee % > /dev/null
catch
endtry

" Type 'jk' instead of '<Esc>'
imap jk <Esc>

" }}}

" Searching {{{

set incsearch  " Search as characters are entered
set hlsearch   " Higlight matches
set ignorecase " Ignore case when searching
set smartcase  " Override ignore case if the search term is cased
set magic      " Use regular expressions

" }}}

" Haskell (neovimhaskell/haskell-vim) {{{

" Syntax highlighting
let g:haskell_enable_quantification = 1   " `forall`
let g:haskell_enable_recursivedo = 1      " `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " `proc`
let g:haskell_enable_pattern_synonyms = 1 " `pattern`
let g:haskell_enable_typeroles = 1        " type roles
let g:haskell_enable_static_pointers = 1  " `static`
let g:haskell_backpack = 1                " backpack keywords

" Indentation
let g:haskell_indent_if = 3                " if
let g:haskell_indent_case = 2              " case
let g:haskell_indent_let = 4               " let
let g:haskell_indent_where = 6             " where (after)
let g:haskell_indent_before_where = 2      " where (before)
let g:haskell_indent_after_bare_where = 2  " where (after, bare)
let g:haskell_indent_do = 3                " do
let g:haskell_indent_in = 1                " in
let g:haskell_indent_guard = 2             " guard

" }}}

