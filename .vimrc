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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'chrisbra/csv.vim'
Plugin 'SirVer/ultisnips'
" Plugin 'SkyLeach/pudb.vim'
call vundle#end()

" ---
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" --- 
nnoremap <Space> a_<Esc>r

" --- Buffer Navigation
nnoremap <C-n>	:bn<CR>
nnoremap <C-p>	:bp<CR>
"  nnoremap <C-tab>   :tabnext<CR>
"  nnoremap <C-t>     :tabnew<CR>


" --- Tab Navgation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

let g:BASH_Ctrl_j = 'off' " --- makc c-j work; don't insert 0x0A
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
set backspace=indent,eol,start   "  Make backspace work better 

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
filetype indent plugin on
colorscheme palenight
hi Visual term=reverse cterm=reverse guibg=Grey

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

" let g;pudb_python_launcher = 

set wildignore+=*.pyc
set wildignore+=*__pycache__

" --- Easy Bracket, Parens & Braces
" inoremap ( ()<Esc>i 
" inoremap { {<CR><CR>}<Esc>ki
inoremap [ []<Esc>i
inoremap <C-e> <Esc>$i

" If you're line is longer than 80 chars, you're a punk.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set tags=tags;/
let g:airline#extensions#tabline#enabled=1
