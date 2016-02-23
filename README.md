# Jung-Feng, Chang's vimrc
---
My vimrc, inspired by internet resources, credit goes to them(See Reference section).

One step install
---
with curl:
```
curl -o - https://raw.githubusercontent.com/chang-jf/vimrc/master/auto-install.sh | sh
```

with wget:
```
wget -O - https://raw.githubusercontent.com/chang-jf/vimrc/master/auto-install.sh | sh
```

Manually install
---
- Check out from github  
```
git clone git://github.com/chang-jf/vimrc.git ~/.vim
```

- install ~/.vimrc  
```
ln -sf ~/.vim/vimrc ~/.vimrc
```

- Install plugins(Optional)  
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
```

Plugins
---
[Plugin manager]  
- [gmarik/Vundle.vim](https://github.com/VundleVim/Vundle.vim) : the plug-in manager for Vim  

[Look&Feel]  
- [twerth/ir_black](https://github.com/twerth/ir_black) : The original IR_Black color scheme for vim  
- [Lokaltog/vim-powerline](https://github.com/Lokaltog/vim-powerline) : The ultimate vim statusline utility. DEPRECATED in favor of [Lokaltog/powerline](https://github.com/Lokaltog/powerline)  
- [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) : A Vim plugin for visually displaying indent levels in code  
    `<leader>i` - enable/disable indent_guide

[Integrations]  
- [scrooloose/syntastic](https://github.com/scrooloose/syntastic) : Syntax checking hacks for vim  

[Interface]  
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) : A tree explorer plugin for vim.  
    `<c-n>` - toggle NerdTree on/off

[Completion]  
- [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate) : provides insert mode auto-completion for quotes, parens, brackets, etc.  
- [ervandew/supertab](https://github.com/ervandew/supertab) : a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).  
    `<tab>` - made UltiSnips work with YoucompleteMe, check [Django 的 vim 自动补全](http://guoqiao.me/post/2014/1030-vim-autocomplete-for-django)  
- [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe) : A code-completion engine for Vim  
    `<C-n><Down>` - select next completion  
    `<C-p><Up>` - select previous completion  
    `<leader>d` - Jump to Declaration  
    `<leader>e` - Jump to Definition  
- [SirVer/ultisnips](https://github.com/SirVer/ultisnips) : The ultimate snippet solution for Vim.  
    `<tab>` - complete snippet  
- [honza/vim-snippets](https://github.com/honza/vim-snippets) : vim-snipmate default snippets (Previously snipmate-snippets)  

[Comments]  
- [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter) : Vim plugin for intensely orgasmic commenting  
    `<leader><cc>` - Comment out the current line or text selected in visual mode.  
    `<leader><cs>` - Comments out the selected lines 'sexily'   
    `<leader><cy>` - Same as <leader>cc except that the commented line(s) are yanked first.  
    `<leader><c$>` - Comments the current line from the cursor to the end of line.  
    `<leader><cA>` - Adds comment delimiters to the end of line and goes into insert mode between them.   
    `<leader><cu>` - Uncomments the selected line(s).  


Reference
---
1. vim manual  
    - [usr_05](http://vimdoc.sourceforge.net/htmldoc/usr_05.html)  
    - [usr_06](http://vimdoc.sourceforge.net/htmldoc/usr_06.html)  
    - [usr_30](http://vimdoc.sourceforge.net/htmldoc/usr_30.html)  
2. [vgod's vimrc](https://github.com/vgod/vimrc)  
3. [tsung's vimrc](https://github.com/tsung/config/blob/master/shell/vimrc)  
4. [我的VIM配置及说明【K-VIM】](http://wklken.me/posts/2013/06/11/linux-my-vim.html)  
5. [clewn：在VIM中连接gdb调试](http://blog.sina.com.cn/s/blog_627bb2cf0101g1b9.html)  
6. [VIM常用配置及插件整理](http://blog.sina.com.cn/s/blog_627bb2cf0101ftdx.html)  
7. [强大的vim配置文件，让编程更随意](http://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html)  
8. [fanzeyi/.vimrc](https://gist.github.com/fanzeyi/754789)  
9. [vim编辑器配置及常用命令](http://blog.csdn.net/shulianghan/article/details/16821959)  

