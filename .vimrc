" Basic settings {{{1
set nocompatible
execute pathogen#infect()
colorscheme monokai
set mouse=a
if &term =~ "^screen"
  set ttymouse=sgr " mouse drag in tmux. Not urxvt-compatible...
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
end
" Change cursor shape based on mode.
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
set colorcolumn=80,100 cursorline
set textwidth=0
set number
set scrolloff=10
set timeoutlen=1000 ttimeoutlen=10
set autoindent
set backspace=indent,eol,start
set complete-=i
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 smarttab
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set formatoptions+=j
set nowrap
set directory=/dev/shm
set nosol
let mapleader=','

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

" Prior/Next in tmux
noremap [5;5~ :bp<CR>
noremap [6;5~ :bn<CR>
" Prior/Next outside tmux
noremap [5^ :bp<CR>
noremap [6^ :bn<CR>
noremap <C-Left> :bp<CR>
noremap <C-Right> :bn<CR>

noremap [1;2D <C-O>
noremap [1;2C <C-I>
noremap <S-Left> <C-O>
noremap <S-Right> <C-I>
noremap <M-Left> <C-O>
noremap <M-Right> <C-I>

" Highlighting {{{1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
filetype plugin indent on
syntax on
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\v\s+$/
highlight NoAbort ctermbg=52
autocmd FileType vim call matchadd("NoAbort", '^\s*function.*(.*)\(.*abort\)\@!')

highlight CocErrorLine ctermbg=52

" Folding {{{1
set foldmethod=indent
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
let g:airline_highlighting_cache = 1
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
    exe 'autocmd' 'vimenter' '*' 'NERDTree' fnamemodify(argv(0), ':h')
    autocmd vimenter * NERDTreeFind
    autocmd vimenter * wincmd l
  endif
else
  " vim: open NERDTree at CWD.
  autocmd vimenter * NERDTree
  autocmd vimenter * wincmd p
endif
" Quit if only NERDtree is open
autocmd bufenter * nested if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
let NERDTreeMinimalUI = 1
let NERDTreeAutoCenter = 1
let NERDTreeChDirMode = 2

" Signify {{{1
let g:signify_sign_show_count = 0
let g:signify_sign_add = '＋'
let g:signify_sign_delete = '－'
let g:signify_sign_delete_first_line = '－'
let g:signify_sign_change = '～'
let g:signify_sign_changedelete = '＊'

" Custom binds {{{1
let mapleader=","
autocmd FileType vim setlocal foldmethod=marker
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sf :ClangFormat<CR>

nnoremap <Leader>sd <Plug>(coc-definition)
nnoremap <Leader>sr <Plug>(coc-references)
nnoremap <Leader>sn <Plug>(coc-rename)
nnoremap <Leader>sa <Plug>(coc-codeaction)
nnoremap <silent> <Leader>sh :call CocAction('doHover')<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')

" Custom colors {{{1
hi Comment ctermfg=179
hi CocFloating ctermbg=236
hi CocErrorFloat ctermfg=210
hi CocWarningFloat ctermfg=11
hi LspCxxHlGroupNamespace ctermfg=1;
hi LspCxxHlGroupMemberVariable ctermfg=6;

" Per-machine customizations
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

