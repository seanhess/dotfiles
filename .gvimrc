
set guioptions=egmrt
set guifont=Menlo:h13
" set guifont=Menlo:h15

" Command-O and Command-P all open fuzzy finder
map <D-O> :CtrlP<CR>
map <D-o> :CtrlP<CR>
map <D-p> <Nop>
map <D-P> <Nop>

" map <D-w> :<C-U>bd<CR>
" nmap <D-w> :hide<CR>

" Tree stuff
" use '-' instead. It focuses the file you are in
" nmap <D-J> :NERDTreeFind<CR>
nmap <D-E> :edit .<CR>

" ack
nmap <D-F> :Ag<space>

" run coffeescript
" nnoremap <D-r> :!coffee %<CR>
" command -nargs=1 C CoffeeCompile | :<args>

" forward and back buffers
" nmap <D-h> :BufSurfBack<CR>
" nmap <D-l> :BufSurfForward<CR>

" comments
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <Esc><plug>NERDCommenterToggle i

" building: check for errors
"map <D-e> :w<CR>:silent make %<CR>
"imap <D-e> <Esc>:w<CR>:silent make %<CR>

" map <D-e> :w<CR>:silent make<CR>
" imap <D-e> <Esc>:w<CR>:silent make<CR>




