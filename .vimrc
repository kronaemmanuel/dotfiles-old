" Syntax Highligting: On
syntax on

" Audible Error Beeps: off
set noerrorbells

" Tab: 2 chars long, SoftTab: 2 spaces long
set tabstop=2 softtabstop=2

" Indents: 2 chars long
set shiftwidth=2

" Convert Tab into Spaces
set expandtab

" Auto Indents
set smartindent

" Set Line Numbers
set number relativenumber
set nu rnu

" Wrapping: off
set nowrap

" Swap Files: off
set noswapfile

" Undo Directory and Undo File
set undodir=~/.vim/undodir

" Undo File Per File
set undofile

" Get results While you search
set incsearch

" Smart casing while searching
set smartcase

" Color Column settings
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [ 'coc-tsserver' ]
Plug 'Rigellute/shades-of-purple.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'powerline/powerline'

call plug#end()

" Coc Settings
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" use Tab for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use Tab and Shift+Tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" TODO: Fix this, Shift Tab doesn't work properly
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use Enter to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Enter selects the first completion item when none has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Show documentation on errors on hover
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Coc settings end

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Set term colors
if (has("termguicolors"))
  set termguicolors
endif

" Colorscheme
colorscheme shades_of_purple 
set background=dark

" Airline theme
let g:airline#extensions#tabline#enabled = 1
set showcmd
let g:shades_of_purple_airline = 1

" Set current cursor line
set cursorline

" Ctrl P Ignore settings
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Set Leader
let mapleader=" "

" Ctrl P Caching: false
let g:ctrlp_use_caching = 0

" Leader + h,j,k,l to switch to differen vim windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Leader + q to quit current vim window
nnoremap <leader>q :wincmd q<CR>

" Show UndoTree
nnoremap <leader>u :UndotreeToggle<CR>

" NerdTree Toggle: Ctrl + n
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 20 

" Buffer controls
noremap <C-j> :bprevious<CR>
noremap <C-k> :bnext<CR>
