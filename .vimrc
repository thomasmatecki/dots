set rtp+=~/.vim/bundle/Vundle.vim

" --- Plugins
call vundle#begin()
Plugin 'Vundle/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()

" --- Tab Navgation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" --- Switch Panes
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

set foldmethod=indent
set foldlevel=99
set nocompatible
set number
set background=dark
set cindent

syntax on
filetype indent plugin on
colorscheme palenight

" --- YouCompleteMe; As recommended for django.
let g:ycm_collect_identifiers_from_tags_files = 1 	" Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1	" Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1	" Completion for programming language's keyword
let g:ycm_complete_in_comments = 1	" Completion in comments
let g:ycm_complete_in_strings = 1	" Completion in string

" --- YouCompleteMe; Default c-family compile flags
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__']
let g:NERDTreeWinPos = "left"

set wildignore+=*.pyc
set wildignore+=*__pycache__

" --- Easy Bracket, Parens & Braces
inoremap ( ()<Esc>i
inoremap { {<CR><CR>}<Esc>ki
inoremap [ []<Esc>i
inoremap <C-e> <Esc>$i
