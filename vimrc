" General Config
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread
set hidden

" UI Option
set laststatus=2
set ruler
set wildmenu
set noerrorbells
set title

" Swap/Backup Options
set noswapfile
set nobackup
set nowb

" Search Options
set incsearch
set hlsearch
set ignorecase

" Replace W with w, on save :Wq -> :wq
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("Wq","wq")
call SetupCommandAlias("WQ","wq")
call SetupCommandAlias("Wqa","wqa")

runtime macros/matchit.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'dikiaap/minimalist'
Plugin 'w0rp/ale'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'vim-scripts/groovy.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'hashivim/vim-terraform'

call vundle#end()

" ALE configs
let g:ale_linters = { 'ruby': ['rubocop'] , 'go': ['gometalinter', 'gofmt'], 'json': ['jsonlint']}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" Disable ALE auto highlights
let g:ale_set_highlights = 1

" Minimalist Tem
set number
syntax on
filetype plugin indent on
filetype on
filetype indent on

colorscheme minimalist
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" Groovy syntax highlighting
au BufNewFile,BufRead Jenkinsfile set filetype=groovy
au BufNewFile,BufRead Jenkinsfile setlocal expandtab shiftwidth=2 tabstop=2
au BufNewFile,BufRead *.json setlocal expandtab shiftwidth=2 tabstop=2

" extraspaces
highlight ExtraWhitespace ctermbg=1 guibg=red
highlight Cursor guifg=white
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
