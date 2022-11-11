" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

Plug 'dracula/vim'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()

:silent! colorscheme dracula
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

nnoremap <C-\> :NERDTreeToggle<CR>
