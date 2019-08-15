" Use vim, no vi defaults
set nocompatible
filetype off

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading

Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
" Plug 'kchmck/vim-coffee-script'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'bronson/vim-trailing-whitespace'
Plug 'fholgado/minibufexpl.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'

" Use Plugin 'ervandew/supertab' for servers (lightweight; no dependencies)
Plug 'Valloric/YouCompleteMe'

" Better status bar for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Adds support for '.' command for vim plugins
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'

" show indentation levels
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" sticky shift aliases
command W w
command WQ wq
" command Wq wq
" command Q q
"
"

" Use the Solarized Dark theme
"let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode; works in nvim no issue
"set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
" set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set fileencoding=utf-8
" Change mapleader to backslash, map (recursively) space to leader
let mapleader="\\"
map <Space> <leader>
map <Space><Space> <leader><leader>

" No swapfiles
set noswapfile

" maintain indentaion when adding a new line
set cindent
set cinkeys-=0#
set indentkeys-=0#
set autoindent
set copyindent            " copy previous indenting
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
let NERDTreeShowHidden=1           " show hidden files

" NERDCommenter
filetype plugin on

" faster ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden --ignore .git -g ""'"

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has("persistent_undo")
    set undodir=~/.vim/undo
    set undofile
endif
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

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
" Make tabs as wide as four spaces
set tabstop=4
" Makes tabs convert to spaces
set expandtab
" an autoindent (with <<) is four spaces
set shiftwidth=4
" don't wrap lines
" set nowrap

" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Show whitespace
" set list

" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Ignore case of searches
set ignorecase
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

" Vim reloads file on change
set autoread

" Strip trailing whitespace (<space>ss)
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

" Use the_silver_searcher if available
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Remap ctrl-c to delete buffer in current window without closing window (goes
" to previous buffer instead)
nnoremap <C-c> :bp\|bd #<CR>

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
"nnoremap <space>ge :Gedit<CR>
"nnoremap <space>gr :Gread<CR>
"nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Git push<CR>
nnoremap <space>gpl :Git pull<CR>

" Map Undotree to <space> ,
nnoremap <space>, :UndotreeToggle<cr>

" Map tagbar to ctrl-k
nmap <c-k> :TagbarToggle<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_confs/.c.py'

" Indent Guides Settings
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Remove 'Thanks for flying vim message'
set titleold=

" Put in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

augroup END

