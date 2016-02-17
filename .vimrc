syntax on
set term=xterm-256color
set mouse=a
set ttymouse=xterm2
colo distinguished

" Tabs
set list
set listchars=tab:>\
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Indent/dedent (`>`/`<`) without losing selection (not working)
vnoremap > >gv
vnoremap < <gv

" Search options
set ignorecase
set smartcase
set incsearch

" Toggle paste mode (no auto-indent) with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
