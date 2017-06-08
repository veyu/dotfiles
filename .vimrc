" FILE SPECIFIC OPTIONS
set encoding=utf-8
syntax enable
filetype plugin on

set listchars=tab:>-,trail:~,extends:>,precedes:<
set backspace=indent,eol,start
set display+=lastline

set history=1000

" INDENT OPTIONS
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4

" SEARCH OPTIONS
set incsearch
set ignorecase " ignore case when searching
set smartcase " switch to case-sensitive when typing uppercase

" navigation options
set scrolloff=1
set sidescrolloff=5

" INTERFACE OPTIONS
colorscheme monokai
" set cursorline
set number
" set relativenuber
set laststatus=2 " always display statusbar
set wildmenu " command <tab> autocompletition enhancement
set title
set tabpagemax=50

" remap C-u to start new change before deleting line
inoremap <c-u> <c-g>u<c-u>

