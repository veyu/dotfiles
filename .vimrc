" FILE SPECIFIC OPTIONS
set encoding=utf-8
syntax enable
filetype plugin on

set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set backspace=indent,eol,start
set display+=lastline

set history=1000

" INDENT OPTIONS
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4

" SEARCH OPTIONS
set hlsearch
set incsearch
set ignorecase " ignore case when searching
set smartcase " switch to case-sensitive when typing uppercase

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" navigation options
set scrolloff=1
set sidescrolloff=5

" INTERFACE OPTIONS
colorscheme monokai
" set cursorline
set colorcolumn=80
set number
" set relativenuber
set laststatus=2 " always display statusbar
set wildmenu " command <tab> autocompletition enhancement
set title
set tabpagemax=50
set splitright
set splitbelow

" remap C-u to start new change before deleting line
inoremap <c-u> <c-g>u<c-u>

" DON'T USE ARROWS NEVER AGAIN
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

" navigate between splits with Ctrl + h-j-k-l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

