" TO RELOAD THIS FILE
" :so %

" REDESIGN
" 1. No leader key, use command or control for everything
" 2. Disable command mode
" 3. No buffer management. Just re-open the file you want. If you want two, make a
"     new iterm window. This ensures that you don't get mixed up pressing q and other
"     nonsense.
" 4. Figure out how to make files in the current directory
" 5. Minimal?
" 6. Anything you can do in a terminal window, do that
"
"
"
" Open new editors in a new split

" vim-plug -----------------------------------------------
call plug#begin('~/.vim/plugged')


Plug 'mileszs/ack.vim'           " Search in project
Plug 'junegunn/fzf'              " Find/Open file
Plug 'nanotech/jellybeans.vim'   " Color theme
Plug 'dense-analysis/ale'        " Linting Engine
Plug 'tpope/vim-surround'        " Surround style commands
Plug 'tpope/vim-commentary'      " Command things out
Plug 'bfredl/nvim-miniyank'      " Fixes clipboard issues
Plug 'bling/vim-airline'         " Status line
Plug 'tpope/vim-vinegar'         " File Browser
" Plug 'valloric/youcompleteme'    " Tab Completion
"
"



" -- Language Support --------------
Plug 'ElmCast/elm-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" Plug 'tpope/vim-eunuch'
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'justinmk/vim-dirvish'
" Plug 'kchmck/vim-coffee-script'
" Plug 'plasticboy/vim-markdown'
" Plug 'wavded/vim-stylus'
" Plug 'mattn/webapi-vim'
" Plug 'mattn/gist-vim'
" Plug 'vim-scripts/gitignore'
" Plug 'pangloss/vim-javascript'
" Plug 'godlygeek/tabular'
" Plug 'leafgarland/typescript-vim'
" Plug 'facebook/vim-flow'
" Plug 'sjl/vitality.vim'
" Plug 'sbdchd/neoformat'


" " Themes
" Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" " Autocomplete
" Plug 'ervandew/supertab'

" " Haskell
" Plug 'cohama/vim-hier'
" Plug 'lnl7/vim-nix'

" " Purescript
" Plug 'raichoo/purescript-vim'

" " Clojure
" Plug 'guns/vim-clojure-static'
" Plug 'tpope/vim-fireplace'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'guns/vim-clojure-highlight'
" Plug 'kovisoft/paredit'
" Plug 'venantius/vim-cljfmt'









" " Charts

" " Plug 'tpope/vim-unimpaired'

" " Plug 'ervandew/supertab'
" " Plug 'ton/vim-bufsurf'
" " Plug 'shemerey/vim-peepopen'
" " Plug 'spolu/dwm.vim'
" " Plug 'vim-scripts/Conque-Shell'

" " Plug 'vimwiki/vimwiki'


call plug#end()


set nocompatible                  " https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
:colorscheme jellybeans
syntax on                         " syntax highlighting
filetype plugin indent on         " turns on filetype and plugin and indent
set backspace=indent,eol,start    " you can backspace over all of these
set incsearch                      "search in-file incrementally
set hlsearch                      " search in-file highlights all matches
set scrolloff=5                 " start scrolling 5 from the bottom"
set expandtab                   " tabs - spaces
set tabstop=2                   " tabs - 2
set softtabstop=2               " you get the ideak
set shiftwidth=2
set autowriteall                " save when lots of things happen, especially edit. Allows you to switch buffers and ignore the current file



" highlight matching paren
hi MatchParen ctermfg=white ctermbg=black guifg=white guibg=#171717
set number    " line numbers
set nolist    " turns off inserting werid characters for tabs
set visualbell
set noerrorbells
set shiftround " multiple tabbing with '>'
set title "changes terminal's title
set nofoldenable " disable folding
set mouse=a "enable mouse in all modes

" ignore settings for a lot of plugins
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,*.hi,*.o,cabal-dev/,dist/,.xcodeproj,.xcworkspace,Pods,.DS_Store,*.git,.stack-work

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
set cmdheight=1
" set shortmess=a  # abbreviations for message I think? - https://vim.fandom.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts

set clipboard=unnamedplus "copy to the system clipboard. This setting messes up column pasting


" Keyboard Bindings
" --------------------------

" miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" Ack
nmap <C-F> :Ack!<space>
map <C-F> :Ack!<space>
" nmap <C-G> :cnext<CR>
" map <leader>f :Ack!<space>
" nmap Ï :Ack!<space>
" map <leader>g :cnext<CR>


" Disable Ex Mode
map Q <Nop>

" Save with C-s
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" Comments
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>
inoremap <C-_> <Esc>:Commentary<CR>

" FZF - file finder
noremap <C-p> :<C-U> FZF<CR>

" Open file in finder
" Mapped to CMD-O using terminal
" C-o is move to last position
" nnoremap <C-o> :!open %:h<CR><CR>

" Close window
" " <CR>:close<CR>
nmap <C-w> :bd<CR>

" Navigate between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" disable the Q-based opening of command line windows. THAT's why I was always lost
nnoremap q: <nop>
nnoremap Q <nop>

" Basic tab completion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Vim-vinegar / netrw guide: https://github.com/tpope/vim-vinegar
" I - toggles instructions
" D - delete file
" R - rename file
" % - create file
" . - populate it at the end of a : command-line: ie:
" y. - yank an absolute path for the file
" C-^ - switch back to buffer from netrw

" Custom Netrw commands ---- These aren't working
" augroup netrw_mapping
"     autocmd!
"     autocmd filetype netrw call NetrwMapping()
" augroup END

" function! NetrwMapping()
"     noremap <buffer> N %
" endfunction
"
" autocmd filetype netrw nnoremap <buffer> N %


" Plugin Settings
" ---------------

" FZF use silver searcher so it ignores things (ag command)
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Airline
let g:airline#extensions#ale#enabled = 1

" ALE
" uncomment these to only lint on save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0

" Use the quickfix window instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" open the window automatically with errors
let g:ale_open_list = 1

let g:ale_linters = {
  \  'haskell': []
  \}

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ElmCast/elm-vim

let g:elm_format_autosave = 0


" -- YouCompleteMe -----------------------------------------

" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python3'




" SETTINGS
" let mapleader = "\<Space>"
" syntax on:he
" filetype plugin indent on
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" -- ascii drawing
" https://til.hashrocket.com/posts/f80t2w1or5-making-virtualedit-a-local-option
" autocmd BufNewFile,BufRead,BufEnter *.md setlocal virtualedit+=all
" autocmd BufLeave *.md setlocal virtualedit-=all


" set nopaste "http://stackoverflow.com/questions/4828819/vim-insert-mode-problem-remaps-imap-and-abbreviations-ab-in-vimrc-dont
" set backspace=indent,eol,start
" set hlsearch
" set incsearch                   "will move to your search match immediately
" set scrolloff=5                 "start scrolling 5 from the bottom"
"set showmatch
"hi MatchParen ctermbg=blue guibg=blue
" hi MatchParen ctermfg=white ctermbg=black guifg=white guibg=#171717
"set relativenumber
" set number
" set nolist
" set visualbell
" set noerrorbells
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,*.hi,*.o,cabal-dev/,dist/,.xcodeproj,.xcworkspace,Pods,.DS_Store,*.git

" set shiftround " multiple tabbing with '>'
" set title "changes terminal's title
" set nofoldenable " disable folding
" set mouse=a "enable mouse in all modes

" load local .vimrc files from directory. Disable insecure stuff"
" set exrc
" set secure



"clipboard


" nnoremap c "_c
" vnoremap c "_c
" nnoremap C "_C
" vnoremap C "_C

"noremap <leader>w :hide<CR>
" noremap <leader>w <C-w>c<CR>
" noremap <leader>l :lfirst<CR>

" noremap <leader>w <C-w>c<CR>

" nmap <C-F> :Ack!<space>
" map <leader>f :Ack!<space>
" nmap Ï :Ack!<space>
" map <leader>g :cnext<CR>

" " Disable Ex Mode
" map Q <Nop>

" Save with C-S

" Comments
"nmap <leader>/ <plug>NERDCommenterToggle
"vmap <leader>/ <plug>NERDCommenterToggle

"nmap ÷ <plug>NERDCommenterToggle
"vmap ÷ <plug>NERDCommenterToggle

" nmap <leader>/ :Commentary<CR>
" vmap <leader>/ :Commentary<CR>

" nmap ÷ :Commentary<CR>
" vmap ÷ :Commentary<CR>


" -- language client --------------------------------------

"let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
"let g:LanguageClient_serverCommands = {
"    \ 'rust': ['rls'],
"    \ 'haskell': ['ghcide', '--lsp'],
"    \ }


"" -- neoformat --------------------------------------------
"let g:ormolu_ghc_opt=["TypeApplications", "RankNTypes"]
"let g:neoformat_enabled_haskell = ['sortimports', 'stylishhaskell']
"let g:neoformat_verbose = 1
"let g:buffergator_suppress_keymaps=1
"nnoremap <leader>t :Neoformat<CR>
"" unmap <leader>t 
"" augroup fmt
""   autocmd!
""   autocmd BufWritePre * undojoin | Neoformat
"" augroup END

"" -- ale --------------------------------------------------
"" \   'haskell': ['hdevtools', 'hlint']
"let g:ale_linters = {
"\   'haskell': []
"\}

"let g:airline#extensions#ale#enabled = 1

"" let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
"" let g:LanguageClient_serverCommands = {
""     \ 'haskell': ['ghcide', '--lsp'],
""     \ }

"" ----------------------------------------------------------

"" Ack / Project Search --------------------------------------------------

"" Note: this will ignore .gitignore and .agignore
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif


"" Random stuff ------------------------------------------------------------

"" run node files
"" makeprg
"au filetype javascript setlocal mp=node\ %

"" disable auto-insertion of comments
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" CoffeeScript
"au filetype coffee setlocal tabstop=2
"au filetype coffee setlocal shiftwidth=2

"" Haskell -----------------------------------------------------------------
""au filetype haskell setlocal omnifunc=necoghc#omnifunc
""let g:haddock_browser="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

"" autocmd FileType haskell nnoremap <silent> <C-e> :cc<CR>
"" let g:haskell_indent_disable=1
"" au FileType haskell noremap <silent> <leader>e :cfile .quickfix<CR>

"" ErrorFormat for GHC errors
"" au FileType haskell setlocal efm=%E%f:%l:%c:\ error:
"" au FileType haskell setlocal efm+=%E%f:%l:%c-%*[0-9]:\ error:
"" au FileType haskell setlocal efm+=%E%f:%l:%c-%*[0-9]:\ error:%m
"" au FileType haskell setlocal efm+=%C\ \ \ \ •%m
"" au FileType haskell setlocal efm+=%C\ \ \ \ \ \ %m
"" au FileType haskell setlocal efm+=%C%.%#
"" let g:hdevtools_options = '-g-Wall'

""let g:haskellmode_completion_ghc = 0
""autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
""let g:ycm_semantic_triggers = {'haskell' : ['.']}
""let g:necoghc_debug = 1
""let g:necoghc_enable_detailed_browse = 1
"hi clear Conceal
""let g:haskell_conceal_wide = 1
"" let g:haskell_conceal_enumerations = 0
"" https://vimawesome.com/plugin/vim-haskellconcealplus
"" let hscoptions="𝐒𝐓𝐄𝐌BQZNDCt"




"" ignore files




"" Elm ----------------------------------------------
"" let g:elm_jump_to_error = 0
"" let g:elm_make_output_file = "elm.js"
"" let g:elm_make_show_warnings = 0
"" let g:elm_browser_command = ""
"" let g:elm_detailed_complete = 0
"" let g:elm_format_autosave = 1

"" au FileType elm nmap <C-b> <Plug>(elm-make)

""au FileType elm map <C-s> :w<CR> <Plug>(elm-make)
""au FileType elm vmap <C-s> :w<CR> <Plug>(elm-make)
""au FileType elm imap <C-s> <Esc>:w<CR> <Plug>(elm-make)
"" au FileType elm noremap <silent> <leader>e :ElmErrorDetail<CR>
"au FileType elm noremap <silent> <leader>e :ALENext<CR>


""au BufWritePost *.elm ElmMakeMain
"":au! BufWritePost *.elm


""noremap <silent> <leader>e :Errors<CR>

"" QuickFix Window Stuff?

"" https://github.com/raytracer/typescript-vim
"" autocmd QuickFixCmdPost [^l]* nested cwindow
"" autocmd QuickFixCmdPost    l* nested lwindow

"" awesome command to compile typescript stuff
" autocmd FileType typescript :set makeprg=tsc
"" :silent make % | cwindow

""let g:flow#autoclose = 1
""let g:flow#enable = 0

"" Whitespace -----------------------------------------------

"autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
"autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
"highlight EOLWS ctermbg=red guibg=red




"" NERDTree ----------------------------------------------
""let NERDTreeIgnore = ['\.hi$', '\.o$', 'dist', 'cabal-dev', 'node_modules', ' \.xcodeproj', '\.xcworkspace', 'Pods', '\.DS_Store$', '\.git']
""let NERDTreeShowHidden=1
""let NERDTreeAutoDeleteBuffer = 1    "don't ask to delete buffer after move
""let NERDTreeRespectWildIgnore=1
"""let NERDTreeSortOrder=[]
"""let NERDTreeQuitOnOpen=1
""let NERDTreeHijackNetrw=1

"" SPLITS --------------------------------------------
"set splitbelow
"set splitright

"" Easy window navigation
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l
"" noremap <C-j> :join<CR>

"" <C-w>s horizontal split
"" <C-w>v vertical split
"" <C-w>c close
"" <C-w>o close others



"" BUFFERS -------------------------------------------
"" This allows buffers to be hidden if you've modified a buffer.
"" This is almost a must if you wish to use buffers in this way.
"set hidden

"" To open a new empty buffer
"" This replaces :tabnew which I used to bind to this mapping
"" nmap <leader>T :enew<cr>

"" Move to the next buffer
"" nmap <leader>l :bnext<CR>

"" Move to the previous buffer
"" nmap <leader>h :bprevious<CR>

"" Close the current buffer and move to the previous one
"" This replicates the idea of closing a tab
"" nmap <leader>bq :bp <BAR> bd #<CR>

"" Show all open buffers and their status
"" nmap <leader>bl :ls<CR>

"" quit buffer
"noremap <leader>w :<C-U>bd!<cr>

"" new buffer
"noremap <leader>n :<C-U>enew<cr>


"" VIM-AIRLINE ---------------------------------------

"" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

"" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'



"" CTRLP -----------------------------------------------
"" to ignore folders, use standard vim wildignore
"" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_use_caching = 0
""let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|cabal-dev\|Pods\|\.(hi\|o\|xcodeproj)$|'

"let g:ctrlp_working_path_mode = 0
"" let g:ctrlp_mruf_relative = 1
"" let g:ctrlp_match_window_bottom = 0     " top of screen
"" let g:ctrlp_match_window_reversed = 0   " top first
""let g:ctrlp_cmd = 'CtrlPMRU'
""let g:ctrlp_cmd = 'CtrlPMixed'
"" let g:ctrlp_cmd = 'CtrlPMixed'
""let g:ctrlp_cmd = 'CtrlPMRUFiles'
"" let g:ctrlp_cmd = 'CtrlP'
"" map refresh to Cmd-R
""let g:ctrlp_prompt_mappings = {
"    "\ 'PrtClearCache()':      ['<D-r>'],
"    "\ 'AcceptSelection("e")': ['<c-o>'],
"    "\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"    "\ }
""let g:ctrlp_dont_split = 'NERD_tree_2'

"" noremap ø :<C-U> CtrlP<CR>
"" noremap <Leader>o :<C-U> CtrlP<CR>
"" noremap <Leader>p :<C-U> CtrlP<CR>
"" noremap <Leader>b :<C-U> CtrlPBuffer<CR>
"" noremap <Leader>m :<C-U> CtrlPMRU<CR>


"" FZF ---------------------------------------------

"" let g:fzf_action = {
""       \ 'enter': 'split',
""       \ 'ctrl-b': 'edit',
""       \ 'ctrl-x': 'split',
""       \ 'ctrl-v': 'vsplit' }

"" Use silver searcher for fzf, which then ignores .gitignore, etc
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"noremap <Leader>p :<C-U> FZF<CR>

"" nnoremap <Leader>b :sba<CR>
"" nnoremap <Leader>B :only<CR>
"nnoremap <Leader>o :!open %:h<CR><CR>
"" nnoremap { :BuffergatorMruCyclePrev<CR>
"" nnoremap } :BuffergatorMruCycleNext<CR>

"noremap { :bprev<CR>
"noremap } :bnext<CR>

"" noremap <Leader>o :<C-U> FZF<CR>
"" nnoremap <Leader>o :only<CR>


"" CLOJURE ---------------------------------------------

"" rainbow parentheses
"au VimEnter * RainbowParenthesesActivate
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"let g:rbpt_max = 15
"let g:rbpt_loadcmd_toggle = 0
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]

"    " can't see black!
"    " \ ['black',       'SeaGreen3'],

"let g:clj_fmt_autosave = 0


"" BINDINGS --------------------------------------------
"" see .gvimrc for macvim bindings



"" CURSOR ---------------------------------------------
"" Change cursor shape between insert and normal mode in iTerm2.app
"if $TERM_PROGRAM =~ "iTerm"
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif

"" for neovim:
":let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


"" Comments ----------------------------------------

"let g:NERDCustomDelimiters = {
"    \ 'haskell': { 'left': '-- ' },
"    \ 'elm': { 'left': '-- ' },
"    \ 'purescript': { 'left': '-- ' },
"    \ }

"autocmd FileType haskell setlocal commentstring=--\ %s
"autocmd FileType elm setlocal commentstring=--\ %s


"" Tabularize -------------------------------------------

"if exists(":Tabularize")
"  nmap <Leader>a= :Tabularize /=<CR>
"  vmap <Leader>a= :Tabularize /=<CR>
"  nmap <Leader>a: :Tabularize /:\zs<CR>
"  vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

"" Update Search Highlighting"
"":hi Search guibg='#61404D' guifg='NONE' gui='NONE'
""call s:X("Search","f0a0c0","302028","underline","Magenta","")


"" VimWiki ------------------------------------------------

"  let g:vimwiki_list = [{ 'path': '~/vimwiki/',
"                        \ 'syntax': 'markdown', 'ext': '.md',
"                        \ 'nested_syntaxes': {
"                        \   'ruby': 'ruby',
"                        \   'elixir': 'elixir',
"                        \   'javascript': 'javascript',
"                        \   'bash': 'sh'
"                        \  }}]


"let g:vimwiki_url_maxsave=10000

"" Markdown -----------------------------------------------

"" let g:vim_markdown_conceal=0
"" set conceallevel=0



"" Ligatures ----------------------
"syntax match pipe1 contained "%" conceal cchar=| containedin=pipe
"syntax match pipe2 contained ">%" conceal cchar=> containedin=pipe
"syntax match pipe "%>%" contains=pipe1,pipe2


