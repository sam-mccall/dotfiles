" Basic settings {{{1
set nocompatible
execute pathogen#infect()
colorscheme monokai
set mouse=a
if &term =~ "^screen"
  set ttymouse=xterm2 " mouse drag in tmux
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
end
set colorcolumn=80,100 cursorline
set textwidth=80
set number
set timeoutlen=1000 ttimeoutlen=10
set autoindent
set backspace=indent,eol,start
set complete-=i
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 smarttab
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set formatoptions+=j
set nowrap
set directory=/dev/shm

set ignorecase smartcase
set incsearch hlsearch
nnoremap <C-_> :nohlsearch<CR>

let wildmode="longest:full,full"
set wildmenu wildignorecase

" Buffers {{{1
set switchbuf=useopen hidden
autocmd FileType qf setlocal nobuflisted
set completeopt-=preview

nnoremap <C-C> :Bd<CR>
nnoremap <C-S-C> :Bd!<CR>
nnoremap <leader>f :find 

noremap <C-Left> :bp<CR>
noremap <C-Right> :bn<CR>

" Highlighting {{{1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
filetype plugin indent on
syntax on
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\v\s+$/

" Folding {{{1
set foldmethod=syntax
autocmd BufWinEnter * normal zR
let &fillchars = "vert:│,fold: "
function! Strip(str)
  return substitute(a:str, '\v^\s*(.{-})\s*$', '\1', '')
endfunction
function! MyFoldText()
  let i = 2 * (v:foldlevel - 1)
  return repeat(' ', i) . Strip(getline(v:foldstart)) . ' … ' . Strip(getline(v:foldend))
endfunction
let &foldtext = "MyFoldText()"
highlight folded ctermfg=252 ctermbg=238 guibg=green

" Airline {{{1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

" nerdtree {{{1
nnoremap \ :NERDTreeToggle<CR>
augroup nerdtree
autocmd!
" Save original root.
let $R = $PWD
" When starting vim, NERDtree depends on args.
if argc() == 1
  " vim $DIR: open NERDTree at that dir, and suppress main buffer.
  if isdirectory(argv(0))
    exe 'autocmd' 'vimenter' '*' 'NERDTree' argv(0)
    autocmd vimenter * wincmd p
    autocmd vimenter * Bd
  else
    autocmd vimenter * NERDTreeFind
    autocmd vimenter * wincmd l
  endif
else
  " vim: open NERDTree at CWD.
  autocmd vimenter * NERDTree
  autocmd vimenter * wincmd p
endif
" Quit if only NERDtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
let NERDTreeMinimalUI = 1
let NERDTreeAutoCenter = 1
let NERDTreeChDirMode = 2

" Custom binds {{{1
let mapleader=","
autocmd FileType vim setlocal foldmethod=marker
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Per-machine customizations
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
