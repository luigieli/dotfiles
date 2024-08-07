call plug#begin()
    " Plugins
    Plug 'dense-analysis/ale'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'vim-airline/vim-airline'
    " Themes
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Disable backups
set nobackup
set noswapfile
set nowritebackup

" Replace tabs for spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Indentantion and syntax
filetype plugin indent on
set autoindent
syntax on

" Fuzzy Finder
set path+=**

" Viewing options
set ruler
set linebreak
set number
set wildmenu
set cursorline

" Search options
set hlsearch
set ignorecase
set incsearch
set smartcase

" Clear search results highlits
nmap <silent> <C-C> :silent noh<CR>

" Fix ESC delay
set ttimeoutlen=0

" Disable mouse
set mouse=

" Disable viminfo
set viminfo=

" Setting per plugin/theme
if isdirectory(expand($HOME . '/.vim/plugged/'))
    if isdirectory(expand($HOME . '/.vim/plugged/vim-colors-solarized/'))
        if has('gui_running')
            set background=light
        else
            set background=dark
        endif
        let g:solarized_termcolors=256
        set t_Co=256
        colorscheme solarized
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/vim-airline/'))
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'powerlineish'
        set laststatus=2
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/vim-lsp/'))
        " Disable vim-lsp default error/warning message
        let g:lsp_diagnostics_enable = 0

        nmap gd <plug>(lsp-definition)
        nmap gr <plug>(lsp-reference)
    endif

    if isdirectory(expand($HOME . '/.vim/plugged/asyncomplete.vim/'))
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
    endif
endif
