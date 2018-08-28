"-------PLUGINS--------------
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'nvie/vim-flake8'
Plug 'tmhedberg/SimpylFold'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'Townk/vim-autoclose'
Plug 'Valloric/MatchTagAlways'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-python/python-syntax'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neco-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'vim-scripts/indentpython'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/Auto-Pairs'
Plug 'fourjay/vim-keeper'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'w0rp/ale'
Plug 'joshdick/onedark.vim'
"Plug 'junegunn/fzf'
"Plug 'https://github.com/jiangmiao/auto-pairs.git'
"Plug 'vim-syntastic/syntastic'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()
"
"-------PLUGIN SETTINGS-------
"-------SimpylFold Settings-------
let g:SimpylFold_docstring_preview = 1
"-------Omnicomplete/Neocomplete Settings-------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
 "  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"-------FZF Settings-------
" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }
"
"" Default fzf layout
"" - down / up / left / right
"let g:fzf_layout = { 'down': '~40%' }
"
"" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }
"
"" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }
"
"" Enable per-command history.
"" CTRL-N and CTRL-P will be automatically bound to next-history and
"" previous-history instead of down and up. If you don't like the change,
"" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"let g:fzf_history_dir = '~/.local/share/fzf-history'
""--Command-Local Options--
"" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1
"
"" [[B]Commits] Customize the options used by 'git log':
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
"" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R'
"
"" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"" Command for git grep
"" - fzf#vim#grep(command, with_column, [options], [fullscreen])
"command! -bang -nargs=* GGrep
"  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
"
"" Override Colors command. You can safely do this in your .vimrc as fzf.vim
"" will not override existing commands.
"command! -bang Colors
"  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
"
"" Augmenting Ag command using fzf#vim#with_preview function
""   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
""     * For syntax-highlighting, Ruby and any of the following tools are required:
""       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
""       - CodeRay: http://coderay.rubychan.de/
""       - Rouge: https://github.com/jneen/rouge
""
""   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
""   :Ag! - Start fzf in fullscreen and display the preview window above
"command! -bang -nargs=* Ag
"  \ call fzf#vim#ag(<q-args>,
"  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \                 <bang>0)
"
"" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
"
"" Likewise, Files command with preview window
"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"
"" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"
"" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)
"
"" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"nnoremap <C-p> :<C-u>FZF<CR>

"-------Neosnippet Settings-------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"-------Syntastic Settings-------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers = ['flake8']

"-------Incsearch Settings-------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
"-------Pydoc Settings-------
let g:pydoc_window_lines=0.5
"-------Airline Settings-------
"let g:airline_theme='onedark'
"-------Lightline Settings-------
let g:lightline = {
     \ 'colorscheme': 'onedark',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
     \             [ 'linter_errors', 'linter_warnings', 'linter_ok'  ] ],
     \   'right': [[ 'lineinfo' ],
     \             [ 'percent' ],
     \             [ 'fileformat', 'fileencoding', 'filetype' ]]
     \ },
     \ 'component': {
     \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
     \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
     \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
     \ },
     \ 'component_visible_condition': {
     \   'readonly': '(&filetype!="help"&& &readonly)',
     \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
     \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
     \ },
     \ 'component_expand': {
     \   'linter_warnings': 'lightline#ale#warnings',
     \   'linter_errors': 'lightline#ale#errors',
     \   'linter_ok': 'lightline#ale#ok',
     \ },
     \ 'component_type': {
     \   'linter_warnings': 'warning',
     \   'linter_errors': 'error',
     \ }
     \ }

"-------KEY MAP-------
let mapleader = ","
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <Leader>s :update<CR>

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
"-------EDITOR SETTINGS-------
let g:indentLine_enabled=0
let g:python_highlight_all=1 "Highlight Option for Python Syntax Plugin
set nocompatible
filetype on
filetype plugin indent on
syntax on
set background=dark
au CursorHold,CursorHoldI * checktime
set clipboard=unnamed,unnamedplus
set showcmd
set autoindent
set autoread
set hidden
set laststatus=2
set encoding=utf-8
set splitbelow
set splitright
set nobackup
set nowritebackup
set noswapfile
set nrformats=
" Spacing and Tabs
set tabstop=4
set shiftround
set colorcolumn=80
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
" HLSearch toggle
set hlsearch
nnoremap <F3> :noh<CR>
"Absolute numbers in Insert mode, relative numbers everywhere else
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
" whitestrip on save
autocmd BufWritePre * StripWhitespace
let g:onedark_termcolors=256
colorscheme onedark
