set number

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
