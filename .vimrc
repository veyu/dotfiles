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

" remap C-r in visual mode to search selected text and replace
" press Esc to only search for selected
vnoremap <C-r> "gy/\V<C-r>g<CR>:%s/<C-r>g//gc<left><left><left>

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

" PLUGINS
execute pathogen#infect()

" LIGHTLINE CONFIG
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"X":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" JEDI-VIM CONFIG
let g:jedi#use_splits_not_buffers = "right"

" change vim search enging to rg
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'LineNumber'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['bg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" fzf.vim mappings
nnoremap <C-p> :Files<CR>
nnoremap <C-@> :Find<CR>
nnoremap <C-I> :Findvisual<CR>

let g:fzf_layout = { 'down': '~20%' }

command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   {'options': '--delimiter : --nth 4..'},
  \   <bang>0)

command! -bang -nargs=* Findvisual
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1,
  \   <bang>0)

" VIM-POLYGLOT
let g:polyglot_disabled = ['markdown']
