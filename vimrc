"Inspiration taken from:
"  http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
"  https://gist.github.com/rocarvaj/2513367
"  http://vim.wikia.com/wiki/Example_vimrc

" Vundle configuration:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Autocomplete code
Plugin 'Valloric/YouCompleteMe'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Auto-pairs (to complete {, (, [, etc.)
Plugin 'jiangmiao/auto-pairs'
" Plugin to change btw .h and .c
Plugin 'ericcurtin/CurtineIncSw.vim'
" Plugin to show a status bar
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle configuration

" Allows .vimrc for each project. Since this can be dangerous, we have to set secure
set exrc
set secure

" Identation and other stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Color column at 110 character
set colorcolumn=110
highlight ColorColumn ctermbg=darkblue

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Display line numbers on the left
set number

" Show the status bar all the time
set laststatus=2

" Close VIM when only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enhanced keyboard mappings:
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" build using makeprg with <F7>
map <F7> :make<CR>
" Use Ctrl-n in normal mode to toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>
" Save and exit in normal mode with Ctrl-c
nmap <C-c> :wq<CR>
" Change btw source and header by pressing <F1>
map <F1> :call CurtineIncSw()<CR>
