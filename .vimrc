set rtp+=$GOROOT/misc/vim

set nocompatible

call pathogen#infect()

set history=1000

set showcmd
set showmode

set number

set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set wrap
set linebreak

syntax on
filetype plugin indent on
colorscheme vividchalk
au BufRead,BufNewFile *.rabl setf ruby
set tabstop=4
set shiftwidth=4
