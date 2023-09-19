#!/bin/bash

echo
echo -e "+++"
echo "Install python3-pip"
echo -e "+++"
yum install python3-pip -y

echo
echo -e "+++"
echo "Install vim-indentLine-plugin"
echo -e "+++"
mkdir $HOME/.vim
git clone https://github.com/Yggdroot/indentLine.git $HOME/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags $HOME/.vim/pack/vendor/start/indentLine/doc" -c "q"

echo
echo -e "+++"
echo "Install vim-ale-plugin"
echo -e "+++"
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
pip3 install --user yamllint

echo
echo -e "+++"
echo "Install pip3-shyaml"
echo -e "+++"
pip3 install --user shyaml


echo
echo -e "+++"
echo "Install yq"
echo -e "+++"
# sudo add-apt-repository ppa:rmescandon/yq
# sudo apt-get install yq
BINARY=yq_linux_amd64 
LATEST=$(wget -qO- https://api.github.com/repos/mikefarah/yq/releases/latest 2>/dev/null | grep browser_download_url | grep $BINARY\"\$|awk '{print $NF}' )
sudo wget -q $LATEST -O /usr/bin/yq 
sudo chmod +x /usr/bin/yq

cat <<EOT >> $HOME/.vimrc
" ls -l /usr/share/vim/vim80/colors
"""colorscheme torte
set paste
set ruler

""" basic settings for yaml and python files
"autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab number autoindent
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:indentLine_color_term = 239
"let g:indentLine_char = '⦙'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_sign_error = '✘'
"let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_text_changed = 'never'

""" folding can help troubleshoot indentation syntax
"set foldenable
"set foldlevelstart=20
"set foldmethod=indent
"nnoremap <space> za
EOT

echo
echo -e "+++"
echo "All set"
echo -e "+++"

exit 0
exit
