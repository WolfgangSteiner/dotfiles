""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'
Plugin 'sickill/vim-pasta'
Plugin 'kien/ctrlp.vim'
"Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-abolish'
Plugin 'embear/vim-localvimrc'
Plugin 'vim-scripts/SearchComplete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'chriskempson/base16-vim'
Plugin 'zah/nim.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf.vim'
Plugin 'wahidrahim/resize-font'

call vundle#end()            " required

"colorscheme base16-default-dark

syntax on
colorscheme base16-default-dark


filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set noswapfile


autocmd FileType cpp setlocal sw=2 sts=2 cino=g0,j1,:0,+2s, 

set guifont=Inconsolata\ 12
set go-=m
set go-=r
set cm=blowfish2


if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " " ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'results:100'
map <F1> :make<CR>
map <F5> :wall<CR>:FSHere<CR>


let g:localvimrc_sandbox=0



set diffopt+=vertical

au FocusLost * :silent! wall


inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


