" VIM configuration file for Alan Jones <alanjones19@gmail.com>
" Modernized 2025 - Compatible with Vim 8+ and Neovim

" ============================================================================
" VIM-PLUG SETUP
" ============================================================================
" Auto-install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" File navigation (replaces Unite/VimFiler)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing enhancements
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Linting and LSP
Plug 'dense-analysis/ale'

" Editor config support
Plug 'editorconfig/editorconfig-vim'

" UI/Appearance (kept from original)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'

call plug#end()

" ============================================================================
" GENERAL SETTINGS
" ============================================================================
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set hidden                    " Allow switching buffers without saving
set clipboard=unnamedplus     " Use system clipboard
set updatetime=300            " Faster completion and gitgutter updates
set timeoutlen=500            " Mapping timeout
set viminfo=                  " Disable viminfo (from original)

" Backup, swap, and undo directories
set nobackup
set nowritebackup
set noswapfile
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

filetype plugin indent on
syntax on

" ============================================================================
" UI SETTINGS
" ============================================================================
set background=dark
colorscheme gruvbox
set termguicolors

set number                    " Show line numbers
set cursorline                " Highlight current line
set colorcolumn=80            " Show column marker at 80
set ruler                     " Show cursor position
set laststatus=2              " Always show status line
set showtabline=2             " Always show tab line
set showmatch                 " Show matching brackets
set nowrap                    " Disable text wrapping
set signcolumn=yes            " Always show sign column for gitgutter/ALE

" Wildmenu configuration
set wildmenu
set wildmode=list:longest,full

" ============================================================================
" INDENTATION
" ============================================================================
set tabstop=2                 " Tab width
set softtabstop=2             " Soft tab width
set shiftwidth=2              " Indent width
set expandtab                 " Convert tabs to spaces
set autoindent                " Copy indent from current line
set smartindent               " Smart autoindenting

" ============================================================================
" SEARCH
" ============================================================================
set incsearch                 " Incremental search
set nohlsearch                " Don't highlight search results (from original)
set ignorecase                " Ignore case in search
set smartcase                 " Override ignorecase if pattern has uppercase

" ============================================================================
" PLUGIN CONFIGURATION
" ============================================================================

" --- Airline ---
let g:airline_powerline_fonts = 1

" --- Rainbow Brackets ---
let g:rainbow_active = 1

" --- NERDTree ---
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.git$', '\.DS_Store$']
" Close vim if NERDTree is the only window left
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" --- fzf.vim ---
" Use ripgrep if available
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
endif
let g:fzf_layout = { 'down': '40%' }

" --- ALE (Asynchronous Lint Engine) ---
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 0
" Enable completion where available
let g:ale_completion_enabled = 1

" --- GitGutter ---
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" ============================================================================
" KEY MAPPINGS
" ============================================================================
let mapleader = "\\"

" --- Basic Mappings (from original) ---
vnoremap <BS> d
nmap j gj
nmap k gk

nmap <leader>l :setlocal number!<CR>
nmap <leader>p :setlocal paste! paste?<CR>

" --- Tab Navigation (from original) ---
nmap <leader>] :tabnext<CR>
nmap <leader>[ :tabprevious<CR>
nmap <leader>t :tabnew<CR>

" --- File Navigation ---
" Ctrl+P: Fuzzy file finder (was: Unite file/file_mru/file_rec)
nnoremap <C-P> :Files<CR>

" \e: File explorer toggle (was: VimFilerExplorer)
nmap <leader>e :NERDTreeToggle<CR>

" \E: Find current file in NERDTree
nmap <leader>E :NERDTreeFind<CR>

" --- fzf Shortcuts ---
" \b: Buffer list (new)
nmap <leader>b :Buffers<CR>

" \h: Recent files (was: Unite file_mru, now fzf :History)
nmap <leader>h :History<CR>

" \f: Grep/search in files (new, requires ripgrep)
nmap <leader>f :Rg<CR>

" \c: Command history
nmap <leader>c :History:<CR>

" --- Git Shortcuts (vim-fugitive) ---
" \gs: Git status (new)
nmap <leader>gs :Git<CR>

" \gb: Git blame (new)
nmap <leader>gb :Git blame<CR>

" \gd: Git diff (new)
nmap <leader>gd :Gdiffsplit<CR>

" \gl: Git log (new)
nmap <leader>gl :Git log<CR>

" --- ALE Navigation ---
nmap ]e <Plug>(ale_next_wrap)
nmap [e <Plug>(ale_previous_wrap)
nmap <leader>af :ALEFix<CR>

" --- Bash-style Command Line Mappings (from original) ---
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" --- iTerm Keypad Mappings (from original) ---
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -
