#!/bin/sh
cd ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc

#My vim plugins are managed by Vundle, but have to install Vundle prior to other plugins
#ref:https://github.com/zanshin/dotfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#get other plugin installed
vim +PluginInstall +qall

#YouCompleteMe plugin need additional step
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

