#!/bin/bash -e

# pathogen
mkdir ~/.vim/{autoload,bundle}
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
rm -rf vim-pathogen

# lightline
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim

# jedi-vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim
