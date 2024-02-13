" auto center common commands
nmap G Gzz
nmap n nzz
nmap N Nzz

" Ctrl-Tab to switch between buffers (ctrl-shift-tab for backwards)
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" gO to create line above cursor
nmap gO O<ESC>j

" g<ctrl-O> create line below cursor
map g<C-O> o<ESC>k


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv








" set <leader> key to comma
let mapleader = ","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
