set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'rakr/vim-one'
Plugin 'bling/vim-airline'
Plugin 'blueshirts/darcula'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-dispatch'
Plugin 'henrik/vim-indexed-search'
Plugin 'klen/python-mode'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/taglist.vim'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable           " enable syntax processing

if (has("termguicolors"))
    set termguicolors
endif

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

set background=dark
let g:airline_theme='quantum'
let g:quantum_black = 1
colorscheme quantum
set hidden
set colorcolumn=80
set ttyfast                     " faster redraw
set backspace=indent,eol,start
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
set splitright
set splitbelow
set foldmethod=indent
set foldnestmax=10
set nofoldenable
"set foldlevel=1
set autoindent
set number              " show line numbers
set relativenumber      " show relative numbering from cursor (+1, +2, -1, -2)
set mouse=a             " Enable mouse scrolling
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
set showmatch           " higlight matching parenthesis
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
set nowrap
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.pyc$'
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = " "
map <leader>j :%!pypprint<CR>
map <leader>s :Gstatus<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>t :TlistToggle<CR>
map <leader>p :pta<CR>
map <leader>i oimport ipdb<CR>ipdb.set_trace()<esc>
map <leader>e :Vexplore<CR>
map <leader>h :Hexplore<CR>
map <leader>l :PymodeLint<CR>
map <leader>a :PymodeLintAuto<CR>
map <leader>x :%!xmllint --format -<CR>
map <leader>, f,a<CR><esc>
map <leader>. t.a<CR><esc>l
set wildignore+=*/tmp/*,*.pyc,htmlcov,*.swp,*.zip,cover,bootstrap,*_server,dists,logrotate.d,env
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

let g:pymode_rope = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_lint_options_pep8 = {'max_line_length': 150}
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
autocmd FileType python set omnifunc=python3complete#Complete

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
