""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'
Plugin 'sickill/vim-pasta'
Plugin 'kien/ctrlp.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'jamessan/vim-gnupg'
call vundle#end()            " required


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set guifont=Inconsolata\ 14
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
syntax on

set diffopt+=vertical

