" Chang, Jung-Feng's vimrc
" Fork me on github git://github.com/chang-jf/vimrc
" Read https://github.com/chang-jf/vimrc/blob/master/README.md for detail
"
" 1.vim manual(usr_05.txt, usr_06.txt, usr_30.txt)
" 2.vgod's vimrc
" 3.tsung's vimrc
" 4.vimrc from china
"       http://wklken.me/posts/2013/06/11/linux-my-vim.html
"       http://blog.sina.com.cn/s/blog_627bb2cf0101g1b9.html
"       http://blog.sina.com.cn/s/blog_627bb2cf0101ftdx.html
"       http://www.cnblogs.com/ma6174/archive/2011/12/10/2283393.html
"       http://wklken.me/posts/2013/06/11/linux-my-vim.html
"       https://gist.github.com/fanzeyi/754789
"       http://blog.csdn.net/shulianghan/article/details/16821959
"
"---------------------------------------------------------------------------
" General Settings
"---------------------------------------------------------------------------
" Look&Feel
set hls                                                                         " high light search matching
set t_vb=
set ruler                                                                       " show cursor position on bottom-right
set nowrap
set number                                                                      " 顯示行號
set nolist                                                                      " turn tab and line end visible, display tab as ^I and $ and line end, prefer disable by default
set showmode                                                                    " Show current mode
set showmatch                                                                   " Cursor shows matching ) and }
set cursorline                                                                  " 啟用行游標提示
"set cursorcolumn                                                                " 啟用列游標提示
set noerrorbells                                                                " disable sound on errors
set novisualbell                                                                " disable visualbell
set background=dark                                                             " set background to dark, place this before "syn on"
syntax on
colorscheme default                                                             " elflord or default is good as well
"colorscheme elflord                                                             " elflord or default is good as well
autocmd FileType text setlocal textwidth=82                                     " while filetype determined as text, set vim change to new line while input exceed 81
" Behavior
set nobackup                                                                      " backup file with ~
set autoread                                                                    " auto read when file is changed from outside
set mouse=nv                                                                    " 只有Normal及Visual支援滑鼠, 取消Insert模式時的滑鼠支援
set incsearch                                                                   " highlight next matched string while typing search pattern
set smartcase                                                                   " ignore case if search pattern is all lowercase,case-sensitive otherwise, require :set ignorecase in order to work.
set ignorecase                                                                  " ignore case when searching
set history=50                                                                  " too much no use
set iskeyword+=-                                                                " default iskeyword=all letters, 0~9, _, visible latin characters, now add -, so VIM consider string which consisted by these item as a "word"
set nocompatible                                                                " not compatible with the old-fashion vi mode
set encoding=utf8                                                               " vim所使用的內部編碼
set fileencoding=utf-8                                                          " 建立新檔時以utf-8編碼建立, fileencodings成功判斷出文件編碼後會將fileencoding改為判斷出的編碼好保持編碼一致
set termencoding=utf-8                                                          " 其實可以不用設, 只影響顯示在螢幕上的編碼, 大部分影響到的是透過終端機(putty之類)連入的vim編輯行為
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,latin1                          " 依序按設定編碼打開文件, 編碼嚴謹的放前面, 編碼寬鬆容易誤判的放後面, 不常用的也放後面
set clipboard=unnamed                                                           " yank to the system register (*) by default
autocmd! bufwritepost .vimrc source ~/.vimrc                                    " auto reload vimrc when editing it
" Movement
set backspace=indent,eol,start                                                  " allow backspacing over everything in the insert mode equal to set bs=2
set whichwrap=b,s,<,>,[,]                                                       " enable additional bs,<LEFT> move cursor back to end of previous line regardless in insert mode or normal mode, space and <RIGHT> vice versa
set sidescroll=10                                                               " scroll 10 characters while cursor reach visible line end, useless while "set wrap"
" Indent
set autoindent                                                                  " copy inednt from current line while creating new line, smartindent better, cindent even better,
                                                                                " set default indent to autoindent for files which have no indent file for them
set tabstop=8                                                                   " each tab advance 8 characters, better stay at default
set expandtab                                                                   " use space instead of ^I
set shiftwidth=4                                                                " typically equal to tabstop, set 4 space while autoindent
set softtabstop=4                                                               " initial line with a tab key will place 4 space instead
filetype plugin indent on                                                       " enable filetype detection affect filetype plugin and indent, will auto set cindent for filetype C
autocmd FileType Makefile set noexpandtab                                       " Need tab is ^I while editing Makefile
" Folding
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" auto complete
set wildchar=<TAB>                                                              " start wild expansion in the command line using <TAB>
set wildmenu                                                                    " wild char completion menu
set wildignore=*.o,*.class,*.pyc                                                " ignore these files while expanding wild chars
" status line
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" status line
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" Tip #382: Search for <cword> and replace with input() in all open buffers 
fun! Replace()
    let s:word = input("Replace " . expand('<cword>') . " with:")
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    :unlet! s:word
endfun

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
"map <leader>r :call Replace()<CR>                                              " Do we really need global replace? 

" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                                                                       " set the min width of a window to 0 so we can maximize others 
set wmh=0                                                                       " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"---------------------------------------------------------------------------

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
"map <C-[> <ESC>:po<CR>                                                         "have bug, disable unless you know what are you doing

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" ========================================Global plugin         -       setting for plugin in $VIMRUNTIME/macros        eg.~/.vim/plugin==============================================================
"
"------------------------------------------------------------------------------
" Install vundle automatically
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"------------------------------------------------------------------------------
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif 

"------------------------------------------------------------------------------
" Vundle setting.
"------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Look&Feel
"Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'

" Integrations
Plugin 'scrooloose/syntastic'

" Completion
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()                                                               " required
filetype plugin indent on                                                       " enable filetype detection affect filetype plugin and indent, will auto set cindent for filetype C
" Brief help-------------------------------------------------------------------
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
" Install plugins automatically
"------------------------------------------------------------------------------
if iCanHazVundle == 3
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
    :qall
endif

" PowerLine
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_colorscheme='solarized256'
" ========================================Filetype plugin       -       setting for plugins in $VIMRUNTIME/ftplugin     eg.~/.vim/ftplugin============================================================
"
" YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_global_ycm_extra_conf='/home/land/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>                                                 "Jump to Definition
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1
" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
