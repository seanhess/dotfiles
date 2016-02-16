" TO RELOAD THIS FILE
" :so %

" TIPS -----------------------------------------------
" open project folders with "mvim" not "mvim ." because it does that stupid nerdtree thing

" vim-plug -----------------------------------------------
call plug#begin('~/.vim/plugged')

" Search
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'

Plug 'kien/ctrlp.vim'
"Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'dhruvasagar/vim-vinegar'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'bling/vim-airline'
Plug 'vim-scripts/gitignore'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
Plug 'leafgarland/typescript-vim'
Plug 'facebook/vim-flow'
" Plug 'lambdatoast/elm.vim'
Plug 'ElmCast/elm-vim'
Plug 'sjl/vitality.vim'
" Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'nanotech/jellybeans.vim'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'Shougo/neocomplete.vim'

" Haskell
Plug 'dag/vim2hs'
Plug 'eagletmt/neco-ghc'
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"Plug 'eagletmt/ghcmod-vim'

Plug 'bitc/vim-hdevtools'

" Purescript
Plug 'raichoo/purescript-vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-unimpaired'

" Plug 'ervandew/supertab'
" Plug 'ton/vim-bufsurf'
" Plug 'shemerey/vim-peepopen'
" Plug 'spolu/dwm.vim'
" Plug 'vim-scripts/Conque-Shell'

call plug#end()

set nocompatible

" ----------------------------------------------------------

:colorscheme jellybeans
" call s:X("Search","f0a0c0","302028","underline","Magenta","")

" -- YouCompleteMe -----------------------------------------

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'




" SETTINGS
let mapleader = "\<Space>"
syntax on
filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" set autoindent
" set copyindent
" set smartindent

set nopaste "http://stackoverflow.com/questions/4828819/vim-insert-mode-problem-remaps-imap-and-abbreviations-ab-in-vimrc-dont
set backspace=indent,eol,start
set hlsearch
set incsearch                   "will move to your search match immediately
set scrolloff=5                 "start scrolling 5 from the bottom"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set showmatch
"hi MatchParen ctermbg=blue guibg=blue
hi MatchParen ctermfg=white ctermbg=black guifg=white guibg=#171717
"set relativenumber
set number
set nolist
set visualbell
set noerrorbells
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,*.hi,*.o,cabal-dev/,dist/,.xcodeproj,.xcworkspace,Pods,.DS_Store,*.git

set shiftround " multiple tabbing with '>'
set title "changes terminal's title
set nofoldenable " disable folding
set clipboard=unnamed "copy to the system clipboard"
set mouse=a "enable mouse in all modes

" load local .vimrc files from directory. Disable insecure stuff"
set exrc
set secure

" Case insensitive
set smartcase
set ignorecase

" disable swp files
set nobackup
set noswapfile

" Disable annoying auto line break
set textwidth=0
set wrapmargin=0

" automatically reload files when they've been changed
set autoread

" Key bindings ------------------------------------------------------------
"noremap <leader>w :hide<CR>
noremap <leader>w <C-w>c<CR>
noremap <leader>l :lfirst<CR>

nmap <C-F> :Ag<space>

" Disable Ex Mode
map Q <Nop>

" Save with C-S
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

nmap <leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle


" Random stuff ------------------------------------------------------------

" run node files
" makeprg
au filetype javascript setlocal mp=node\ %

" disable auto-insertion of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" CoffeeScript
au filetype coffee setlocal tabstop=2
au filetype coffee setlocal shiftwidth=2

" Haskell -----------------------------------------------------------------
"au filetype haskell setlocal omnifunc=necoghc#omnifunc
"let g:haddock_browser="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

autocmd FileType haskell map <leader>t :HdevtoolsType<CR>
autocmd FileType haskell map <leader>T :HdevtoolsClear<CR>

"let g:haskellmode_completion_ghc = 0
"autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"let g:ycm_semantic_triggers = {'haskell' : ['.']}
"let g:necoghc_debug = 1
"let g:necoghc_enable_detailed_browse = 1
hi clear Conceal
"let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 0


" ignore files




" Elm ----------------------------------------------
let g:elm_detailed_complete = 1
"let g:elm_make_show_warnings = 1
let g:elm_make_output_file = "elm.js"
let g:elm_jump_to_error = 0
au FileType elm nmap <C-b> <Plug>(elm-make)

"au FileType elm map <C-s> :w<CR> <Plug>(elm-make)
"au FileType elm vmap <C-s> :w<CR> <Plug>(elm-make)
"au FileType elm imap <C-s> <Esc>:w<CR> <Plug>(elm-make)
au FileType elm noremap <silent> <leader>e :ElmErrorDetail<CR>

"au BufWritePost *.elm ElmMakeMain
":au! BufWritePost *.elm

" Syntastic ------------------------------------------

" Recommended default settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"let g:syntastic_debug = 3
let g:syntastic_javascript_flow_exe = 'flow'
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_signs = 1
" put this in a .vimrc file in your project folder
let g:syntastic_javascript_checkers = ['flow']
let g:flow#enable = 0

let g:syntastic_aggregate_errors = 1
" check syntax on file open
let g:syntastic_haskell_ghc_mod_args = '-g -fno-warn-missing-signatures'
let g:syntastic_haskell_checkers = ['hdevtools']
let g:syntastic_haskell_hdevtools_args = '-g-Wall -g-fno-warn-missing-signatures'
"let g:syntastic_haskell_checkers = ['ghc_mod', 'hlint'] 
" Jump to the first error
"let g:syntastic_auto_jump = 3

"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "B"

let g:syntastic_purescript_checkers = ['pulp']

"noremap <silent> <leader>e :Errors<CR>

" QuickFix Window Stuff?
" https://github.com/raytracer/typescript-vim
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

" awesome command to compile typescript stuff
" :silent make % | cwindow

"let g:flow#autoclose = 1
"let g:flow#enable = 0

" Whitespace -----------------------------------------------

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red


" NERDTree ----------------------------------------------
"let NERDTreeIgnore = ['\.hi$', '\.o$', 'dist', 'cabal-dev', 'node_modules', '\.xcodeproj', '\.xcworkspace', 'Pods', '\.DS_Store$', '\.git']
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1    "don't ask to delete buffer after move
"let NERDTreeQuitOnOpen=1
"let NERDTreeHijackNetrw=1

" VINEGAR -----------------------------------------------

  
" SPLITS --------------------------------------------
set splitbelow
set splitright

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"noremap <leader>o :only<CR>

" <C-w>s horizontal split
" <C-w>v vertical split
" <C-w>c close
" <C-w>o close others



" BUFFERS -------------------------------------------
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <leader>T :enew<cr>

" Move to the next buffer
" nmap <leader>l :bnext<CR>

" Move to the previous buffer
" nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
" nmap <leader>bl :ls<CR>

" quit buffer
noremap <leader>q :<C-U>bd<cr>

" new buffer
noremap <leader>n :<C-U>enew<cr>


" VIM-AIRLINE ---------------------------------------

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" CTRLP -----------------------------------------------
" to ignore folders, use standard vim wildignore
" let g:ctrlp_use_caching = 0     " disable caching. Default is 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|cabal-dev\|Pods\|\.(hi\|o\|xcodeproj)$|'

" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_mruf_relative = 1
" let g:ctrlp_match_window_bottom = 0     " top of screen
" let g:ctrlp_match_window_reversed = 0   " top first
"let g:ctrlp_cmd = 'CtrlPMRU'
"let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_cmd = 'CtrlPMRUFiles'
" let g:ctrlp_cmd = 'CtrlP'
" map refresh to Cmd-R
"let g:ctrlp_prompt_mappings = {
    "\ 'PrtClearCache()':      ['<D-r>'],
    "\ 'AcceptSelection("e")': ['<c-o>'],
    "\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    "\ }
"let g:ctrlp_dont_split = 'NERD_tree_2'

noremap <Leader>o :<C-U> CtrlP<CR>
noremap <Leader>p :<C-U> CtrlP<CR>
noremap <Leader>b :<C-U> CtrlPBuffer<CR>
noremap <Leader>m :<C-U> CtrlPMRU<CR>


" CLOJURE ---------------------------------------------

" rainbow parentheses
if exists(":RainbowParenthesesToggle")
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


" BINDINGS --------------------------------------------
" see .gvimrc for macvim bindings



" CURSOR ---------------------------------------------
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" for neovim:
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


" NERDCOmmenter ----------------------------------------

let g:NERDCustomDelimiters = {
    \ 'haskell': { 'left': '-- ' },
    \ 'elm': { 'left': '-- ' },
    \ 'purescript': { 'left': '-- ' },
    \ }


" Tabularize -------------------------------------------

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Update Search Highlighting"
":hi Search guibg='#61404D' guifg='NONE' gui='NONE'
"call s:X("Search","f0a0c0","302028","underline","Magenta","")
