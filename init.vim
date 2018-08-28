let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}"-------EDITOR SETTINGS-------

" Smarter pasting
" nnoremap <Leader>p :set invpaste paste?<CR>

" Section: Autocommands
" --------------------------
if has("autocmd")
  filetype plugin indent on

  autocmd BufReadPost * " {{{2
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif "}}}2

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd VimEnter * colorscheme solarized8_dark
  autocmd VimEnter * RainbowToggle

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

  au! BufRead,BufNewFile *.tsx       setfiletype typescript
endif
"

" -- Smart indent when entering insert mode with i on empty lines --------------
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

let g:indentLine_enabled=0
let g:python_highlight_all=1 "Highlight Option for Python Syntax Plugin
" let g:python_host_prog='usr/bin/python'
" let g:python3_host_prog='usr/bin/python3'
set nocompatible
filetype on
filetype plugin indent on
au CursorHold,CursorHoldI * checktime
set shell=zsh " Set zsh as prompt for Vim
set list listchars=tab:»·,trail:· " Display extra whitespace characters
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set ruler
set showcmd
set laststatus=2
set noshowmode
set completeopt-=preview
set clipboard=unnamed,unnamedplus
set hidden
set encoding=utf-8
set splitbelow
set splitright
set inccommand=nosplit
" Spacing and Tabs
set colorcolumn=120
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set softtabstop=3
set textwidth=79
"Absolute numbers in Insert mode, relative numbers everywhere else
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set scrolloff=10
" whitestrip on save
autocmd BufWritePre * StripWhitespace

"-------PLUGINS--------------
call plug#begin()
" UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/limelight.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'

" Project Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/ctags.vim'
Plug 'majutsushi/tagbar'        " ctags related stuff
Plug 'rbgrouleff/bclose.vim'    " Required by ranger.vim
Plug 'francoiscabrol/ranger.vim'

" File Navigation
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'easymotion/vim-easymotion'
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'wellle/targets.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'jasonlong/vim-textobj-css'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'fourjay/vim-keeper'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/vim-expand-region'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/indentpython'
Plug 'vim-scripts/Auto-Pairs'
Plug 'Valloric/MatchTagAlways'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'Chiel92/vim-autoformat'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim', {'on': 'GV'}
Plug 'roxma/ncm-github' " Autocompletion source for NCM

" Task Running
Plug 'w0rp/ale'

" Auto Complete
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

" LANGUAGE SUPPORT
" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/npm-debug-log.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/ncm-flow'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': ':UpdateRemotePlugins'}

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'ap/vim-css-color'
Plug 'calebeby/ncm-css'

" Sass
Plug 'cakebaker/scss-syntax.vim'

" Python
Plug 'python-mode/python-mode', {'for':'python', 'branch':'develop'}
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'vim-python/python-syntax'
Plug 'alfredodeza/pytest.vim'
Plug 'nvie/vim-flake8'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Markdown
Plug 'reedes/vim-pencil'    " Markdown, Writing
Plug 'godlygeek/tabular', { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
"Plug 'jsfaint/gen_tags.vim'
call plug#end()

"-------PLUGIN SETTINGS-------
"-------ALE-------
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

"-------Prettier-------
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'es5'
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

"-------Limelight-------
let g:limelight_default_coefficient = 0.7
let g:limelight_conceal_ctermfg = 238
nmap <silent> gl :Limelight!!<CR>
xmap gl <Plug>(Limelight)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"-------FZF-------
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

"-------Emmet-------
" let g:user_emmet_install_global = 0
" autocmd Filetype html,css EmmetInstall
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings = {
      \   'javascript.jsx' : {
        \  'extends' : 'jsx',
        \},
\}

"-------Ranger-------
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

"-------Ultisnips-------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsListSnippets = '<nop>'
" let g:UltiSnipsExpandTrigger = '<c-l>'
" let g:UltiSnipsJumpForwardTrigger = '<c-l>'
" let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
let g:ulti_expand_or_jump_res = 0
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set Ultisnip to use Python3
" let g:UltiSnipsUsePythonVersion = 3

"-------vim-indent-guides-------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"-------SimpylFold Settings-------
let g:SimpylFold_docstring_preview = 1

"-------Supertab-------
"let g:SuperTabDefaultCompletionType = "<c-n>"

"-------Deoplete NCM-------
" force init deoplete then hack deoplete's mapping
call deoplete#enable()

" register as ncm source
au User CmSetup call cm#register_source({'name' : 'deoplete',
      \ 'priority': 7,
      \ 'abbreviation': '',
      \ })

" hack deoplete's mapping
inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>

func! g:Deoplete_ncm()
  " forward to ncm
  let g:deoplete#ignore_sources._ = {}
  let g:deoplete#ignore_sources._ = [
        \   'buffer',
        \   'member',
        \   'tag',
        \   'file',
        \   'around',
        \ ]
  call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
  return ''
endfunc

"-------NCM General Settings-------
" imap <expr> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")

"-------Incsearch Settings-------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

"-------Pydoc Settings-------
let g:pydoc_window_lines=0.5

"-------Lightline Settings-------
let g:lightline = {
      \ 'colorscheme': 'solarized',
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

"--------Rainbow Brackets------
let g:rainbow_conf = {
      \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \   '*': {},
      \   'tex': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \   },
      \   'lisp': {
      \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \   },
      \   'vim': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \   },
      \   'html': {
      \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \   },
      \   'css': 0,
      \ }
      \}
"-------Git Gutter-------
set updatetime=250

"-------Vim-Autoformat-------
nnoremap <F4> :PrettierAsync<CR>
" nnoremap <F4> :Autoformat<CR>
" au BufWrite * :Autoformat

"-------KEY MAP-------
let mapleader = ","
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap td :tabClose<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader>l :Limelight!!<CR>

"Preview HTML in browser
nnoremap <F6> :silent update<Bar>silent !google-chrome-stable %:p &<CR>

"Disable Arrow Keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>

"prevent ESC from moving cursor left
inoremap <Esc> <ESC>`^

"terminal keymap
tnoremap <ESC> <C-\><C-n>
tnoremap <A-]> <ESC>
tnoremap <A-h> <C-\><C-N><C-W>h
tnoremap <A-J> <C-\><C-N><C-W>j
tnoremap <A-K> <C-\><C-N><C-W>k
tnoremap <A-L> <C-\><C-N><C-W>l

nnoremap <A-H> <C-W>h
nnoremap <A-J> <C-W>j
nnoremap <A-K> <C-W>k
nnoremap <A-L> <C-W>l

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" HLSearch toggle
set hlsearch
"nnoremap <F3> :noh<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Theming
set termguicolors
syntax enable
set background=dark
colorscheme solarized8
