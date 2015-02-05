set rtp+=$GOROOT/misc/vim

set nocompatible

call pathogen#infect()

set history=1000

set showcmd
set showmode

set number

set ruler

set wrap
set linebreak

:set mouse=nicr

syntax on
filetype plugin indent on
colorscheme vividchalk
au BufRead,BufNewFile *.rabl setf ruby
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
