" Tab width
set tabstop=4
set shiftwidth=4
set expandtab

" Line highlighting
hi LineNr ctermfg=grey ctermbg=016
set number

" Current Vim Plugins
" 	1. NERD Tree
" 	2. Airline
" 	3. CSS Colors
" 	4. C/C++ Highlighting
" 	5. Comments

call plug#begin()
" NERD Tree
Plug 'preservim/NERDTree'
" Vim Airline (Status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" CSS Colors
Plug 'https://github.com/ap/vim-css-color'
" C/C++ Code highlighting
Plug 'https://github.com/bfrg/vim-cpp-modern'
" Commentary
Plug 'tpope/vim-commentary'
" Experimental
Plug 'dracula/vim'
call plug#end()

" Airline Config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Key Bindings
map <F5> :NERDTreeToggle<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>
inoremap ii <Esc>
nmap <C-@> gcc
vmap <C-@> gcc

