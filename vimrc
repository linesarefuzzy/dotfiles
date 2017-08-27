""" Vundle package manager """

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'sjl/gundo.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"------------------------------------------------------------

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Search as you type
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a
set ttymouse=xterm2

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Toggle paste mode (no auto-indent) with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Miscellaneous

" Colors
set term=xterm-256color
colo distinguished

" Show hard tabs
set list
set listchars=tab:>\

" Indent/dedent (`>`/`<`) without losing selection
vnoremap > >gv
vnoremap < <gv

" Tree style file list
let g:netrw_liststyle=3
" Vertical split right instead of left
"let g:netrw_altv = 1

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Auto-reload vimrc on change
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | AirlineRefresh | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Option as meta key
let c='a'
while c <= 'z'
  exec "set <M-".tolower(c).">=\e".c
  exec "imap \e".c." <M-".tolower(c).">"
  let c = nr2char(1+char2nr(c))
endw


" -----------------------------------------------------------
" Plugins

""" NERDTree """

"autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-\>      :NERDTreeTabsToggle<CR>
map <leader>f  :NERDTreeFind<CR>

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""" NERDCommenter """

" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 2

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1


" """ Selecta """
" 
" " Find all files in all non-dot directories starting in the working directory.
" " Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>e :SelectaFile<cr>
" 
" " As above, but will open in a :split
" nnoremap <leader>s :SelectaSplit<cr>
" 
" " As above, but will open in a :vsplit
" nnoremap <leader>v :SelectaVsplit<cr>
" 
" " As above, but will open in a :tabedit
" nnoremap <leader>t :SelectaTabedit<cr>
" 
" " Find all buffers that have been opened.
" " Fuzzy select one of those. Open the selected file with :b.
" nnoremap <leader>b :SelectaBuffer<cr>
" 
" " Find previously run commands.
" " Fuzzy select one of those. Run that command with :
" nnoremap <leader>h :SelectaHistoryCommand<cr>


""" Airline status line """

let g:airline#extensions#tabline#enabled = 1


""" Multiple cursors """

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" Convert last find into multiple cursors
nnoremap <silent> <C-h> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <C-h> :MultipleCursorsFind <C-R>/<CR>


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Editor tab navigation
nnoremap <leader>t  :tabnew<CR>
nnoremap H          :tabprev<CR>
nnoremap L          :tabnext<CR>
nnoremap <leader>1  :tabfirst<CR>
nnoremap <leader>2  2gt
nnoremap <leader>3  3gt
nnoremap <leader>4  4gt
nnoremap <leader>5  5gt
nnoremap <leader>6  6gt
nnoremap <leader>7  7gt
nnoremap <leader>8  8gt
nnoremap <leader>9  :tablast<CR>
nnoremap <leader>w  :tabclose<CR>
"nnoremap te  :tabedit<Space>
"nnoremap tm  :tabmove<Space>

" Buffers
nnoremap <leader>d  :bd<CR>
nnoremap <leader>n  :bn<CR>
nnoremap <leader>p  :bp<CR>

" Scrolling
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>
inoremap <C-k> <Esc><C-y>a
inoremap <C-j> <Esc><C-e>a

" Home and end
nmap ^[OF $
nmap ^[OH 0
imap ^[OF ^[$i
imap ^[OH ^[0i
nnoremap <C-e> $
nnoremap <C-a> 0
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Gundo
nnoremap <F5> :GundoToggle<CR>
