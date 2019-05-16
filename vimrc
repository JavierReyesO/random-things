set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'dikiaap/minimalist'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'

" Bottom Status Bar
Plugin 'vim-airline/vim-airline'

call vundle#end()

" syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" active to show errors
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = "~/.rbenv/shims/rubocop"
let g:syntastic_ruby_exec = "~/.rbenv/shims/ruby"
let g:syntastic_html_checkers = ['w3']

set number
syntax on
filetype plugin indent on
filetype on
filetype indent on

set t_Co=256
colorscheme minimalist
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
