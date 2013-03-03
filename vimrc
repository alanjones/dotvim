
" VIM configuration file for Alan Jones <alanjones19@gmail.com>

execute pathogen#infect()

filetype plugin on

set viminfo=
syntax on

set tabstop=2         " Set tabs to 4 spaces
set softtabstop=2     " Set tabs to 4 spaces
set shiftwidth=2      " set indent to 4 spaces
set expandtab         " Convert tabs to spaces

" Wildmenu owns your face
set wildmenu
set wildmode=list:longest,full

" set mouse=a           " Enable terminal mouse support
set nohlsearch        " Don't highlight search results
set incsearch         " Incremental search is cool
set ruler
set nowrap            " Disable text wrapping
set number            " Show numbers on the left of each line
set cursorline        " Highlight the current line
"set cursorcolumn      " Highlight the currst column
"set colorcolumn=80
set nohidden          " Close buffers when the tab is removed

" Set up status bar
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%04lx%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Set up tab bar
set showtabline=2

" set foldenable
" set foldmethod=syntax
" set foldlevel=1
" let xml_syntax_folding=1  

" Apply colorscheme
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
  :colorscheme zenburn
endif

let g:Powerline_symbols = 'fancy'

:let g:ctrlp_map = '<Leader>o'
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<c-t>'],
"    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"    \ }

" Key mappings

:nmap j gj
:nmap k gk
  
:nmap \e :NERDTreeToggle<CR>

:nmap \n :tabnext<CR>
:nmap \p :tabprevious<CR>
:nmap \t :tabnew<CR>

:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

