" VIM configuration file for Alan Jones <alanjones19@gmail.com>

runtime bundle/pathogen/autoload/pathogen.vim
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
set colorcolumn=80
set nohidden          " Close buffers when the tab is removed

" Set up status bar
set laststatus=2

" Set up tab bar
set showtabline=2

" Apply colorscheme
" if $TERM == "xterm-256color" || $TERM == "screen-256color" 
  set t_Co=256
  set background=dark
  set fillchars+=stl:\ ,stlnc:\
  set term=xterm-256color
  set termencoding=utf-8
  set encoding=utf-8
  :colorscheme solarized
" endif

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1 
let g:rainbow_active = 1

vnoremap <BS> d

" Key mappings
:nmap j gj
:nmap k gk
  
:nmap \l :setlocal number!<CR>
:nmap \p :setlocal paste! paste?<CR>

:nmap \e :VimFilerExplorer<CR>

:nmap \] :tabnext<CR>
:nmap \[ :tabprevious<CR>
:nmap \t :tabnew<CR>

" :nnoremap <silent> <C-p> :Unite -auto-resize -toggle file file_mru file_rec/async<cr>
let g:unite_split_rule = "botright"
let g:unite_enable_start_insert = 1
let g:unite_force_overwrite_statusline = 1
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-P> :<C-u>Unite file file_mru file_rec/async:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Bash style command mappings
:cnoremap <C-a>  <Home>
:cnoremap <C-e>  <End>
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

" Make the keypad work in iTerm on OSX
:map <Esc>Oq 1
:map <Esc>Or 2
:map <Esc>Os 3
:map <Esc>Ot 4
:map <Esc>Ou 5
:map <Esc>Ov 6
:map <Esc>Ow 7
:map <Esc>Ox 8
:map <Esc>Oy 9
:map <Esc>Op 0
:map <Esc>On .
:map <Esc>OQ /
:map <Esc>OR *
:map <kPlus> +
:map <Esc>OS -
:map! <Esc>Oq 1
:map! <Esc>Or 2
:map! <Esc>Os 3
:map! <Esc>Ot 4
:map! <Esc>Ou 5
:map! <Esc>Ov 6
:map! <Esc>Ow 7
:map! <Esc>Ox 8
:map! <Esc>Oy 9
:map! <Esc>Op 0
:map! <Esc>On .
:map! <Esc>OQ /
:map! <Esc>OR *
:map! <kPlus> +
:map! <Esc>OS -
