" Current Vim Plugins
" 	1. NERD Tree
" 	2. Airline
" 	3. CSS Colors
" 	4. C/C++ Highlighting
" 	5. Comments

call plug#begin()
" NERD Tree
Plug 'preservim/NERDTree' |
            \ Plug 'ryanoasis/vim-devicons' |
			\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Vim Airline (Status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" CSS Colors
Plug 'https://github.com/ap/vim-css-color'
" C/C++ Code highlighting
Plug 'https://github.com/bfrg/vim-cpp-modern'
" Commentary
Plug 'tpope/vim-commentary'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

" Theme
set termguicolors
" packadd! catpuccin.vim
colorscheme catppuccin_mocha
let g:airline_theme = 'catppuccin_mocha'

" Airline Config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" NERDTree
" --------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" sorts the content
let g:NERDTreeNaturalSort = 1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" ---
" For changing cursor types in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

augroup myCmds
    au!
    autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" FORTRAN settings
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" General Settings
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set wrap linebreak                      " Soft wrap
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set iskeyword+=-                        " treat dash separated words as a word text object
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number relativenumber                      " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
" set autochdir                           " Your working directory will always be the same as your working directory

" Write with sudo priviledges without openning with sudo nvim
cmap w!! w !sudo tee %


" General Keymaps
" ----------------
noremap <Up> :echoerr "Stop being a peasant"<CR>
imap <Up> <C-o>:echoerr "Hah! What a loser"<CR>
noremap <Right> :echoerr "Seriously, again?"<CR>
imap <Right> <C-o>:echoerr "Why don't you drink your piss tea, you little pissboy"<CR>
noremap <Down> :echoerr "When would you ever learn..."<CR>
imap <Down> <C-o>:echoerr "You should just go back to VSCode"<CR>
noremap <Left> :echoerr "ERROR: Too much stupid"<CR>
imap <Left> <C-o>:echoerr "Good day! You still suck"<CR>
" Switch between split buffers
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" Key Bindings
map <F5> :NERDTreeToggle<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>
" inoremap ii <Esc>
inoremap jk <Esc>
nmap <C-_> gcc
vmap <C-_> gcc

map <leader>g :!comp <c-r>%<CR><CR>
map <leader>o :!pdfout <c-r>%<CR><CR>
