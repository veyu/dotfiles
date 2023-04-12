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
      \   'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['fileencoding', 'fileformat'],
      \             ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"X":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
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

" vim-ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_disable_lsp = 1


" vim-lsp
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'erlang_ls',
        \ 'cmd': {server_info->['erlang_ls']},
        \ 'allowlist': ['erlang'],
        \ })
endif
autocmd FileType erl setlocal omnifunc=lsp#complete
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " refer to doc to add more commands
endfunction

augroup lsp_install
   au!
   " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
