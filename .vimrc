" TO RELOAD THIS FILE
" :so %

" TIPS -----------------------------------------------
" open project folders with "mvim" not "mvim ." because it does that stupid nerdtree thing

" VUNDLE
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'uggedal/go-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'wlangstroth/vim-haskell'
Bundle 'leafgarland/typescript-vim'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'nanotech/jellybeans.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/gitignore'
Bundle 'pangloss/vim-javascript'

" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'guns/vim-clojure-highlight'

" Bundle 'ervandew/supertab'
" Bundle 'ton/vim-bufsurf'
" Bundle 'shemerey/vim-peepopen'
" Bundle 'spolu/dwm.vim'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'vim-scripts/Conque-Shell'

:colorscheme jellybeans 

" YouCompleteMe
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<S-Enter>']




" SETTINGS
let mapleader = "\<Space>"
syntax on
filetype plugin indent on
filetype plugin on

" set autoindent
" set copyindent
" set smartindent
set backspace=indent,eol,start
set hlsearch
set incsearch                   "will move to your search match immediately
set scrolloff=5                 "start scrolling 5 from the bottom"
set expandtab
set tabstop=2
set shiftwidth=2
"set showmatch
hi MatchParen ctermbg=blue guibg=blue
set number
set nolist
set visualbell
set noerrorbells
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,*.hi,*.o,cabal-dev/,dist/,.xcodeproj,.xcworkspace,Pods,.DS_Store,*.git

set shiftround " multiple tabbing with '>'
set title "changes terminal's title
set nofoldenable " disable folding
set clipboard=unnamed "copy to the system clipboard"
set mouse=niv "mouse stuff

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
fu! local:disableBr()
  set wrap
  set linebreak
  set nolist  " list disables linebreak
  set textwidth=0
  set wrapmargin=0
  set fo-=t
endfu

" Disable line breaks for all file types
:au BufNewFile,BufRead *.* call local:disableBr()

" automatically reload files when they've been changed
:set autoread

" run node files
" makeprg
au filetype javascript setlocal mp=node\ %
" au filetype coffee-script setlocal mp=coffee\ %
" au filetype coffee setlocal mp=echo\ "not support"

" disable auto-insertion of comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" CoffeeScript
au filetype coffee setlocal tabstop=2
au filetype coffee setlocal shiftwidth=2


" ignore files



" Disable Ex Mode
:map Q <Nop>



" QuickFix Window Stuff?
" https://github.com/raytracer/typescript-vim
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

" awesome command to compile typescript stuff
" :silent make % | cwindow


" NERDTree ----------------------------------------------
let NERDTreeIgnore = ['\.hi$', '\.o$', 'dist', 'cabal-dev', 'node_modules', '\.xcodeproj', '\.xcworkspace', 'Pods', '\.DS_Store$', '\.git']
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1    "don't ask to delete buffer after move
let NERDTreeQuitOnOpen=1


" SPLITS --------------------------------------------
set splitbelow
set splitright

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
nmap <leader>q :bd<cr>

" new buffer
nmap <leader>n :enew<cr>


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

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>


" CLOJURE ---------------------------------------------

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


" BINDINGS --------------------------------------------
" see .gvimrc for macvim bindings



" CURSOR ---------------------------------------------

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

