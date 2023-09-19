#!/bin/bash

yum install python3-pip

mkdir $HOME/.vim
git clone https://github.com/Yggdroot/indentLine.git $HOME/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags $HOME/.vim/pack/vendor/start/indentLine/doc" -c "q"

mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
pip3 install --user yamllint


pip3 install shyaml


sudo add-apt-repository ppa:rmescandon/yq
sudo apt-get install yq

