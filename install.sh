#!/bin/sh

# Install Pack
PACK='vim zsh git curl'
apt update -y
apt install -y $PACK

# Setup Vim
vimrc_path="$HOME/.vimrc"

vimrc_content='set nu
set ai
set si
set expandtab
set cindent
set autoindent
set smartindent
set sts=4
set ts=4
set shiftwidth=4
set wmnu
set laststatus=2
set ignorecase
set hlsearch
set nocompatible
set mouse=a
set ruler
set fileencodings=utf=8,euc-kr
set fencs=ucs=bom,utf-8,euc-kr
set showmatch
syntax on
filetype indent on
set bs=indent,eol,start
set title
set autoread
set autowrite'

echo "$vimrc_content" > "$vimrc_path"

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
