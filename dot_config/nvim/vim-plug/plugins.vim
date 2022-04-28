call plug#begin('~/config/nvim/autoload/plugged')

" Vim Rainbow Brackets
Plug 'frazrepo/vim-rainbow'

" Lightline
Plug 'itchyny/lightline.vim'

" NERDTree
Plug 'preservim/nerdtree'

" Pear Tree (bracket pairing)
Plug 'tmsvg/pear-tree'

" FuzzyFind
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
