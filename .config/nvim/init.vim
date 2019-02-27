set fenc=utf-8
set guifont="Fira Code"

set nobackup
set noswapfile
set noswapfile
set autoread
set hidden
set showcmd

set number
set smartindent
set visualbell
set laststatus=2
set wildmode=list:longest

nnoremap j gj
nnoremap k gk

set expandtab
set tabstop=2
set shiftwidth=2

let mapleader = "\<Space>"

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

if &compatible
  set nocompatible               " Be iMproved
endif

" ========== dein.vim ==========

set runtimepath+=/home/astellon/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/astellon/.cache/dein')
  call dein#begin('/home/astellon/.cache/dein')

  " Let dein manage dein
  call dein#add('/home/astellon/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  "call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

