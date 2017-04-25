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

Plugin 'Valloric/YouCompleteMe'

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
set noexpandtab

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

" Enhanced keyboard mappings:
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" build using makeprg with <F7>
map <F7> :make<CR>
