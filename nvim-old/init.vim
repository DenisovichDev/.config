" -------------------------------------------
" Neovim config file
" -------------------------------------------
"
"  DenisovichDev
"  (https://denisovichdev.github.io/link-tree)

"  gf to open sourced files


"  Plugins
call plug#begin("~/.vim/plugged")

" Dracula
Plug 'dracula/vim'
" Material
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" NERD Tree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
			\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" vim commentary
Plug 'tpope/vim-commentary'
" C/C++ Syntax Highlighting
Plug 'https://github.com/bfrg/vim-cpp-modern'
" Vim JavaScript
Plug 'pangloss/vim-javascript'
" CSS Colors
Plug 'https://github.com/ap/vim-css-color'
" Coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Tree Sitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Pandoc and its syntax highlighting
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Snippets
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" TreeSitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()


" Config Section
" --------------------

" True Colors
if (has("termguicolors"))
  set termguicolors
endif
syntax enable

" ------------------------------------------------------------------
" Plugin Related Configurations 
" ------------------------------------------------------------------

" Material
" -------
let g:material_terminal_italics = 1
" Set theme for material
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'ocean'
" Set airline theme to material
let g:airline_theme = 'material'

" Airline
" -------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

colorscheme material

" C/C++ 
" -----
" Enable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
" let g:cpp_simple_highlight = 1

" NERD Tree
" ---------
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
" Toggle
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" Disable automantic comment leader. Use o or O in normal mode instead
" :set formatoptions-=cr

" Intellisense
" ------------
source $HOME/.config/nvim/plug-config/coc.vim

" Markdown Preview
" ----------------
source $HOME/.config/nvim/plug-config/markdown-preview.vim

" Pandoc
" ------

set nofoldenable    " disable folding
let g:pandoc#folding#mode=1

" UltiSnip
" --------
" Default directory
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]
" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Some more variables
let g:snips_author="Bhaswar Chakraborty"

" Auto Correction
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" ------------------------------------------------------------------
" Integrated terminal
" ------------------------------------------------------------------

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" Set nonumber to terminal
autocmd TermOpen * setlocal nonumber norelativenumber

" ------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------

source $HOME/.config/nvim/general/settings.vim

" Automatically switch between relativenumber and norelativenumber.
" Absolute number is shown in insert mode and when the buffer is not in focus.
" Relative number is shown in normal mode.

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

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
" wrap a word in these characters
" double tap single quotes for double quotes since it's quicker
nnoremap <leader>" viwc""<Esc>P
vnoremap <leader>" c""<Esc>P
nnoremap <leader>'' viwc""<Esc>P
vnoremap <leader>'' c""<Esc>P
nnoremap <leader>' viwc''<Esc>P
vnoremap <leader>' c''<Esc>P
" latex, code, italics, do <leader>* twice for bold
nnoremap <leader>$ viwc$$<Esc>P
vnoremap <leader>$ c$$<Esc>P
nnoremap <leader>` viwc``<Esc>P
vnoremap <leader>` c``<Esc>P
nnoremap <leader>* viwc**<Esc>P
vnoremap <leader>* c**<Esc>P
" brackets p for parenths. It's closer.
nnoremap <leader>p viwc()<Esc>P
nnoremap <leader>{ viwc{}<Esc>P
nnoremap <leader>[ viwc[]<Esc>P
vnoremap <leader>p c()<Esc>P
vnoremap <leader>{ c{}<Esc>P
vnoremap <leader>[ c[]<Esc>P
" Shortcuts for switching panels
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" Switch between split buffers
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" switch tabs with Ctrl + j/k
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
" normal mode
" inoremap ii <Esc>
inoremap jk <Esc>
" Disable highlighting after search by Esc and /
nnoremap <Esc>/ :noh<CR>
nnoremap tc :tabclose<CR>
" Commenting Shortcuts
" Recursive maps
nmap <C-_> gcc
vmap <C-_> gc
" Opening/Closing markdown preview: mp return
nmap mp<CR> <Plug>MarkdownPreviewToggle
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>
" Quick compile scripts
map <leader>g :!comp <c-r>%<CR><CR>
" PDF preview
map <leader>o :!pdfout <c-r>%<CR><CR>

