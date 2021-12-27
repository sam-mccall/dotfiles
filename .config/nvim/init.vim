autocmd BufWritePost plugins.lua source <afile> | PackerSync
lua require('plugins')

color monokai
hi Comment ctermfg=179
hi NormalFloat ctermbg=236
hi LspReferenceText ctermbg=24
hi link LspReferenceRead LspReferenceText
hi link LspReferenceWrite LspReferenceText

set mouse=a
set nowrap
set colorcolumn=80,100 cursorline
set number
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 smarttab
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set ignorecase smartcase
set incsearch hlsearch
nnoremap <C-_> :nohlsearch<CR>
nnoremap <C-C> :bd<CR>

let wildmode="longest:full,full"

nnoremap ,sh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap ,sd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap ,sr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap ,sn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap ,sa <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap ,b :ls<CR>:b 
nnoremap \ :NvimTreeToggle<CR>

nnoremap ,ff <cmd>Telescope git_files theme=dropdown<cr>
nnoremap ,fg <cmd>Telescope live_grep theme=dropdown<cr>
nnoremap ,fb <cmd>Telescope buffers theme=dropdown<cr>
nnoremap ,fh <cmd>Telescope help_tags theme=dropdown<cr>
nnoremap ,fs <cmd>Telescope lsp_dynamic_workspace_symbols theme=dropdown<cr>
nnoremap ,fr <cmd>Telescope lsp_references theme=dropdown<cr>

set updatetime=200
autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)':'<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)':'<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)':'<Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)':'<Tab>'

nnoremap <C-PageUp> :bn<CR>
nnoremap <C-PageDown> :bp<CR>
