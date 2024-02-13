""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""" Add all plugins here:

" NERDTree file explorer
Plugin 'scrooloose/nerdtree'

" Airline statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Powerline fonts
"let g:airline_powerline_fonts = 1

" Get molokai color scheme
Plugin 'tomasr/molokai'

"""""""""""""" NERDCommenter
" <leader>cc for line or selection, <leader>c<space> for comment toggle
Plugin 'scrooloose/nerdcommenter'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
""""""""""""""""""""""

" used to add stuff on each side of a word or selection 
" ci<char> to change ds<char> to delete, S<string> to surround
Plugin 'tpope/vim-surround'

" Ctrl-P is a fuzzy-finder
" hit ctrl-p and type away!
Plugin 'ctrlpvim/ctrlp.vim'


""""""""""""""""""""""
" all of your plugins must be added before the following line
call vundle#end()            " required
