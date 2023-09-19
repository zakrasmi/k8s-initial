#!/bin/bash

mkdir $HOME/.vim
git clone https://github.com/Yggdroot/indentLine.git $HOME/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags $HOME/.vim/pack/vendor/start/indentLine/doc" -c "q"
