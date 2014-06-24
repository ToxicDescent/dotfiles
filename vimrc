"""""""""""""""""""
" Vundle Settings "
"""""""""""""""""""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'zeis/vim-kolor'

call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"""""""""""""""""""
" Editor Settings "
"""""""""""""""""""

set t_Co=256                " use 256 colors

colorscheme kolor           " set the color scheme
set background=dark         " set the dark theme

syntax on                   " turn on syntax highlighting

set laststatus=2            " always display status line
set showcmd                 " always display the command line
set cmdheight=1             " set the height of the command line

set shortmess=aoOw          " reduces how often you see the 'Hit ENTER to continue' promt

set backup                  " always create backup files
set backupdir=~/.vim/backup " set the path for backup files
set swapfile                " always create swap files
set directory=~/.vim/swap   " set the path for swap files

set undolevels=1000         " the number of changes that can be undone
set undofile                " always save undo history to a file
set undodir=~/.vim/undo     " set the path for the undo files

set number                  " show line numbers
set relativenumber          " show relative line numbers

set ruler                   " show the ruler in the status bar

set cursorline              " highlight the current line

set showmatch               " show matching parenthesis
set matchpairs+=<:>         " show matches for angle brackets

set incsearch               " turn on incremental searches
set ignorecase              " ignore case when searching
set smartcase               " when searching be smart about cases

set autoread                " auto updates a file if changed

set magic                   " turn on reqular expressions

set autoindent              " use the indent oft he previous line
set smartindent             " use intelligent identation for C

set expandtab               " expand tabs to spaces
set tabstop=4               " set tab width to 4 spaces
set softtabstop=4           " set unindent width to 4 spaces
set shiftwidth=4            " set indent width to 4 spaces
set pastetoggle=<F12>       " toggle whether to autoindent pasted lines

set wildignore+=*.o         " ignore all object files
set wildignore+=*.meta      " ignore all meta files

set scrolloff=5             " start scrolling 5 lines before the horizontal window border

let mapleader=','           " set the leader character

""""""""""""""""""
" Keyboard Binds "
""""""""""""""""""

" save the current file
nmap <F2> :w<CR>
" exit insert mode and save the current file
imap <F2> <ESC>:w<CR>

" toggle the NERDTree window pane
nmap <F3> :NERDTreeToggle<CR>

" clear the search string
nmap <F11> :let @/=""<CR>
" exit insert mode and clear the search string
imap <F11> <ESC>:let @/=""<CR>

"""""""""""""""""
" Auto Commands "
"""""""""""""""""

" if NERDTree is the only window open then quit vim
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
