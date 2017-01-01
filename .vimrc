" Basic settings {{{1
set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme monokai
set mouse=a
set colorcolumn=80,100 cursorline
set textwidth=80
set number
set ttimeoutlen=10
set autoindent
set backspace=indent,eol,start
set complete-=i
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 smarttab
set hidden
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set formatoptions+=j
set nowrap
autocmd FileType qf setlocal nobuflisted
set directory=/dev/shm

set ignorecase smartcase
set incsearch hlsearch

let wildmode="longest:full"
set wildmenu

let mapleader=","
set laststatus=2

" Airline {{{1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" nerdtree {{{1
nnoremap \ :NERDTreeToggle<CR>
nnoremap <C-C> :Bd<CR>
augroup nerdtree
autocmd!
if argc() == 1
  if isdirectory(argv(0))
    autocmd vimenter * Bd
    autocmd vimenter * exe 'NERDTree' argv(0)
    autocmd vimenter * wincmd l
  else
    autocmd vimenter * NERDTreeFind
    autocmd vimenter * wincmd l
  endif
endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
let NERDTreeMinimalUI = 1
let NERDTreeAutoCenter = 1
let NERDTreeChDirMode = 2
" Custom binds {{{1
autocmd FileType vim setlocal foldmethod=marker
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
noremap <C-left> :bp<cr>
noremap <C-right> :bn<cr>
noremap <C-c> :Bd<cr>
