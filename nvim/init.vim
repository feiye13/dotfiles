let mapleader = ' '

syntax on
set number
" set relativenumber

set encoding=utf-8

set nocompatible

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set incsearch
set hlsearch
set smartcase
set ignorecase

" 搜索完成取消高亮
nnoremap <leader><CR> :nohlsearch<CR>

" colorscheme slate

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set scrolloff=7


inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>

nnoremap <leader>w :w<CR>


" 切换窗口
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l






