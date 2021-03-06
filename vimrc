" TO RELOAD THIS FILE
" :so %

" TIPS -----------------------------------------------
" open project folders with "mvim" not "mvim ." because it does that stupid nerdtree thing

" vim-plug -----------------------------------------------
call plug#begin('~/.vim/plugged')

" Search
Plug 'mileszs/ack.vim'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf'
" Plug 'scrooloose/nerdtree'
" Plug 'dhruvasagar/vim-vinegar'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'justinmk/vim-dirvish'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'bling/vim-airline'
Plug 'vim-scripts/gitignore'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
Plug 'leafgarland/typescript-vim'
Plug 'facebook/vim-flow'
Plug 'ElmCast/elm-vim'
Plug 'sjl/vitality.vim'
" Plug 'Chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'

" miniyank, fixes clipboard issues
Plug 'bfredl/nvim-miniyank'

" Themes
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'nanotech/jellybeans.vim'

" Autocomplete
Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'Shougo/neocomplete.vim'

" Haskell
" The following weren't really doing anything
" Plug 'dag/vim2hs'
" Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'bitc/vim-hdevtools'

" Purescript
Plug 'raichoo/purescript-vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'kovisoft/paredit'
Plug 'venantius/vim-cljfmt'









" Charts

" Plug 'tpope/vim-unimpaired'

" Plug 'ervandew/supertab'
" Plug 'ton/vim-bufsurf'
" Plug 'shemerey/vim-peepopen'
" Plug 'spolu/dwm.vim'
" Plug 'vim-scripts/Conque-Shell'

" Plug 'vimwiki/vimwiki'


call plug#end()

set nocompatible





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

" -- ascii drawing
" https://til.hashrocket.com/posts/f80t2w1or5-making-virtualedit-a-local-option
autocmd BufNewFile,BufRead,BufEnter *.md setlocal virtualedit+=all
autocmd BufLeave *.md setlocal virtualedit-=all


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

" make status line higher so it never does that annoying prompt thing
set cmdheight=2
" set shortmess=a


"clipboard
set clipboard=unnamedplus "copy to the system clipboard. This setting messes up column pasting
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" Key bindings ------------------------------------------------------------
" when you paste, reyank any text that is pasted
" xnoremap p pgvy

" nnoremap y "xy
" vnoremap y "xy
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

"noremap <leader>w :hide<CR>
" noremap <leader>w <C-w>c<CR>
" noremap <leader>l :lfirst<CR>

" noremap <leader>w <C-w>c<CR>


nmap <C-F> :Ack!<space>
map <leader>f :Ack!<space>
nmap Ï :Ack!<space>
map <leader>g :cnext<CR>

" Disable Ex Mode
map Q <Nop>

" Save with C-S
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
map <F6> :w<CR>
imap <F6> <Esc>:w<CR>

" Save with Cmd-S
map ß :w<CR>
imap ß <Esc>:w<CR>

" Comments
"nmap <leader>/ <plug>NERDCommenterToggle
"vmap <leader>/ <plug>NERDCommenterToggle

"nmap ÷ <plug>NERDCommenterToggle
"vmap ÷ <plug>NERDCommenterToggle

nmap <leader>/ :Commentary<CR>
vmap <leader>/ :Commentary<CR>

nmap ÷ :Commentary<CR>
vmap ÷ :Commentary<CR>


" -- neoformat --------------------------------------------
let g:neoformat_enabled_haskell = ['stylishhaskell']
let g:neoformat_verbose = 0
let g:buffergator_suppress_keymaps=1
nnoremap <leader>t :Neoformat<CR>
" unmap <leader>t 
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" -- ale --------------------------------------------------
" \   'haskell': ['hdevtools', 'hlint']
let g:ale_linters = {
\   'haskell': []
\}

let g:airline#extensions#ale#enabled = 1

" let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
" let g:LanguageClient_serverCommands = {
"     \ 'haskell': ['ghcide', '--lsp'],
"     \ }

" ----------------------------------------------------------

" Ack / Project Search --------------------------------------------------

" Note: this will ignore .gitignore and .agignore
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


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

" autocmd FileType haskell nnoremap <leader>t :SyntasticCheck<CR>
" autocmd FileType haskell nnoremap <C-t> :SyntasticCheck<CR>
" autocmd FileType haskell nnoremap <silent> <C-e> :cc<CR>
let g:haskell_indent_disable=1
au FileType haskell noremap <silent> <leader>e :cc<CR>
" autocmd FileType haskell :Syntastic

let g:hdevtools_options = '-g-Wall'

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
" let g:elm_jump_to_error = 0
" let g:elm_make_output_file = "elm.js"
" let g:elm_make_show_warnings = 0
" let g:elm_browser_command = ""
" let g:elm_detailed_complete = 0
" let g:elm_format_autosave = 1
" let g:elm_syntastic_show_warnings = 1

" au FileType elm nmap <C-b> <Plug>(elm-make)

"au FileType elm map <C-s> :w<CR> <Plug>(elm-make)
"au FileType elm vmap <C-s> :w<CR> <Plug>(elm-make)
"au FileType elm imap <C-s> <Esc>:w<CR> <Plug>(elm-make)
" au FileType elm noremap <silent> <leader>e :ElmErrorDetail<CR>
au FileType elm noremap <silent> <leader>e :ALENext<CR>

"au BufWritePost *.elm ElmMakeMain
":au! BufWritePost *.elm

" Syntastic ------------------------------------------

" Recommended default settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_mode_map = { "mode":"active", "active_filetypes": [], "passive_filetypes": [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" put the error under the cursor in the command window
" let g:syntastic_echo_current_error = 0
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
" let g:syntastic_haskell_checkers = []
" let g:syntastic_haskell_hdevtools_args = '-g -Wall -g -fno-warn-missing-signatures'
let g:syntastic_haskell_hdevtools_args = '-g -Wall'
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
 autocmd FileType typescript :set makeprg=tsc
" :silent make % | cwindow

"let g:flow#autoclose = 1
"let g:flow#enable = 0

" Whitespace -----------------------------------------------

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red




" NERDTree ----------------------------------------------
"let NERDTreeIgnore = ['\.hi$', '\.o$', 'dist', 'cabal-dev', 'node_modules', ' \.xcodeproj', '\.xcworkspace', 'Pods', '\.DS_Store$', '\.git']
"let NERDTreeShowHidden=1
"let NERDTreeAutoDeleteBuffer = 1    "don't ask to delete buffer after move
"let NERDTreeRespectWildIgnore=1
""let NERDTreeSortOrder=[]
""let NERDTreeQuitOnOpen=1
"let NERDTreeHijackNetrw=1

" SPLITS --------------------------------------------
set splitbelow
set splitright

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" noremap <C-j> :join<CR>

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
noremap <leader>w :<C-U>bd!<cr>

" new buffer
noremap <leader>n :<C-U>enew<cr>


" VIM-AIRLINE ---------------------------------------

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" CTRLP -----------------------------------------------
" to ignore folders, use standard vim wildignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|cabal-dev\|Pods\|\.(hi\|o\|xcodeproj)$|'

let g:ctrlp_working_path_mode = 0
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

" noremap ø :<C-U> CtrlP<CR>
" noremap <Leader>o :<C-U> CtrlP<CR>
" noremap <Leader>p :<C-U> CtrlP<CR>
" noremap <Leader>b :<C-U> CtrlPBuffer<CR>
" noremap <Leader>m :<C-U> CtrlPMRU<CR>


" FZF ---------------------------------------------

" let g:fzf_action = {
"       \ 'enter': 'split',
"       \ 'ctrl-b': 'edit',
"       \ 'ctrl-x': 'split',
"       \ 'ctrl-v': 'vsplit' }

noremap <Leader>p :<C-U> FZF<CR>

" nnoremap <Leader>b :sba<CR>
" nnoremap <Leader>B :only<CR>
nnoremap <Leader>o :!open %:h<CR><CR>
nnoremap { :BuffergatorMruCyclePrev<CR>
nnoremap } :BuffergatorMruCycleNext<CR>

" noremap { :bprev<CR>
" noremap } :bnext<CR>

" noremap <Leader>o :<C-U> FZF<CR>
" nnoremap <Leader>o :only<CR>


" CLOJURE ---------------------------------------------

" rainbow parentheses
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_max = 15
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

    " can't see black!
    " \ ['black',       'SeaGreen3'],

let g:clj_fmt_autosave = 0


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


" Comments ----------------------------------------

let g:NERDCustomDelimiters = {
    \ 'haskell': { 'left': '-- ' },
    \ 'elm': { 'left': '-- ' },
    \ 'purescript': { 'left': '-- ' },
    \ }

autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType elm setlocal commentstring=--\ %s


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


" VimWiki ------------------------------------------------

  let g:vimwiki_list = [{ 'path': '~/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md',
                        \ 'nested_syntaxes': {
                        \   'ruby': 'ruby',
                        \   'elixir': 'elixir',
                        \   'javascript': 'javascript',
                        \   'bash': 'sh'
                        \  }}]


let g:vimwiki_url_maxsave=10000

" Markdown -----------------------------------------------

" let g:vim_markdown_conceal=0
" set conceallevel=0



" Ligatures ----------------------
syntax match pipe1 contained "%" conceal cchar=| containedin=pipe
syntax match pipe2 contained ">%" conceal cchar=> containedin=pipe
syntax match pipe "%>%" contains=pipe1,pipe2


