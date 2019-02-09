set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdTree' "Documents tree
Plugin 'davidhalter/jedi-vim' "python autocompletion
Plugin 'tpope/vim-fugitive' "git integration
Plugin 'scrooloose/syntastic' "code syntaxis
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on
if $TERM == "xterm-256color"
  set t_Co=256
endif
colorscheme gruvbox
set background=dark
