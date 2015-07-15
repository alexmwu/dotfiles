" Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
"Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'matze/vim-move'
Plug 'bronson/vim-trailing-whitespace'
call plug#end()

" sticky shift aliases
command W w
command WQ wq
" command Wq wq
" command Q q

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Use vim, no vi defaults
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
" set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader to backslash, map (recursively) space to leader
let mapleader="\\"
map <Space> <leader>

" No swapfiles
set noswapfile

" maintain indentaion when adding a new line
set smartindent
set autoindent
filetype indent on

" Tell CtrlP to ignore certain files and directories
let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules$\|\.git$\|\_site$',
    \ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\jpeg.gif$\|\.svg$'
    \ }

" ESC should clear highlighted search terms
nnoremap <CR> :noh<CR><CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vim-move
let g:move_key_modifier = 'C'

" NERDCommenter
filetype plugin on

" vim-move prevent indentation of blocks from getting lost
let g:move_auto_indent = 0

" faster ctrlp
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git -g ""'"

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
" if exists("&undodir")
"	set undodir=~/.vim/undo
" endif

" Don’t create backups when editing files in certain directories
" set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
" security reasons?
set modelines=4


" Enable per-directory .vimrc files and disable unsafe commands in them
" set exrc
" set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Makes tabs convert to spaces
set expandtab
" an autoindent (with <<) is two spaces
set shiftwidth=2
" don't wrap lines
" set nowrap

" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Show whitespace
" set list

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" ... unless they contain at least one capital letter
set smartcase
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
" set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
" set shortmess=atI

" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
" if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
" endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (<leader>W)
"noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
" if has("autocmd")
" 	" Enable file type detection
" 	filetype on
" 	" Treat .json files as .js
" 	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" 	" Treat .md files as Markdown
" 	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
" endif

" Map NERDTree toggling to ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Start vim on NERDTree if no arguments specified for vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
endif
