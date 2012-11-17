set nocompatible
set autoindent
set ruler
set showcmd

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

filetype plugin indent on
