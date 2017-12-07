" Vundle

filetype on

" Plugins
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" Vundle installed
 Bundle 'gmarik/vundle'
 Bundle 'tomtom/tcomment_vim'
 Bundle 'godlygeek/tabular'

" Syntax
Bundle 'pangloss/vim-javascript'

" Color Schemes
Bundle 'ap/vim-css-color'

filetype plugin indent on
syntax enable
set background=dark

" recognize .md files as markdown
au BufRead,BufNewFile *.md set filetype=markdown

set cursorline
hi CursorLineNR cterm=bold, ctermfg=2
hi LineNR ctermbg=none

set showcmd
set autoindent
set foldmethod=manual
set showmatch
set smarttab
set clipboard=unnamed
set mouse-=a
set wildignore+=node_modules,javascripts-built,bower_components,test-result
set ruler
set wildmenu
set incsearch
set autoread
set gdefault " always use g flag in s///
set completeopt-=preview "prevent scratch window

" Gutter
set number
set hlsearch

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set laststatus=2
set shiftround

" Store swapfiles and backup files in .vim/tmp
set dir=~/.vim/tmp
set backupdir=~/.vim/tmp

" Mappings
let mapleader=',' " use , for leader instead of backslash

nmap <leader>w <C-W>

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#show_buffers = 0

let user_emmet_expandabbr_key='<C-e>'
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.svn$']
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let Tlist_Show_One_File=1

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

map <leader>d :NERDTreeToggle<CR>
map <leader>D :NERDTreeFocus<CR>
map <leader>v :vs<CR>

nnoremap <silent> <leader>/ :nohlsearch<CR> " Unhighlight search results
map \ :TComment<cr>
vmap \ :TComment<cr>gv

set noerrorbells

nnoremap j gj
nnoremap k gk

" http://vim.wikia.com/wiki/VimTip906
nnoremap <leader>pm :set invpaste paste?<CR>
set pastetoggle=<leader>pm
set showmode
