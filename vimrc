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
" Plugin to show a status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin to manage Git
Plugin 'tpope/vim-fugitive'
" Plugin to use code snippets
Plugin 'SirVer/ultisnips'
" Snippets used by the former plugin
" Plugin 'honza/vim-snippets'
" Plugin for searching patterns inside project
Plugin 'mileszs/ack.vim'
" Plugin to generate c-tags
Plugin 'xolox/vim-easytags'
" Plugin required for easytags
Plugin 'xolox/vim-misc'
" Plugin to show tags (functions) on panel
Plugin 'majutsushi/tagbar'
" Plugin to open files last edit position
Plugin 'farmergreg/vim-lastplace'
" Plugin to add comments
Plugin 'tpope/vim-commentary'
" Plugin to zoom with <C-w>m
Plugin 'dhruvasagar/vim-zoom'
" Plugin to save vim sessions more easily
Plugin 'xolox/vim-session'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle configuration

" Configuration to use ag the silver searcher with ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Configuration to use different type of comments for c, cpp files
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" Turn spelling on for markdown files
autocmd FileType markdown set spell
autocmd FileType tex set spell

" Allows .vimrc for each project. Since this can be dangerous, we have to set secure
set exrc
set secure

" Highlight current line
set cursorline

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

" Display relative line numbers on the left
set number
set relativenumber

" Show the status bar all the time
set laststatus=2
" Use powerline fonts with the status bar
let g:airline_powerline_fonts = 1
" Define theme status bar
let g:airline_theme='light'
" Modify airline layout (see doc plugins github page)
let g:airline_section_y=''

" Configuration UtilSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" Set snippets directory
set runtimepath+=~/.vim
let g:UltiSnipsSnippetDirectories=["my-snippets"]

" Update easytags async
let g:easytags_async = 1

" Show tabs
set list
set listchars=tab:>-

" Ignore files NerdTREE
let NERDTreeIgnore = ['\.o$', '\.pyc$']
" Split on the right by defaul when pressing s
set splitright

" Disable preview
set completeopt-=preview

" Show all search coincidence (disable with F6, see below)
set hlsearch

" Disable autosave session
let g:session_autosave = 'no'

" Close VIM when only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Copy to system clipboard by default. You need to have clipboard feature flag
" enable to this to work. To check it, just execute vim --version and look for
" clipboard. If we have + is fine, if we have - we will need to install
" something extra. In the case of ubuntu, just install vim-gnome
set clipboard=unnamedplus

" Enhanced keyboard mappings:
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save and stay in normal mode
imap <F2> <ESC>:w<CR>
" Shortcut to eliminate all tabs and replace them with spaces, and also
" trailing spaces
nmap <F3> ggvG:retab<CR>:%s/\s\+$//e<CR>:nohlsearch<CR>
" Disable search highlight with F6
nmap <F6> :nohlsearch<CR>
" Build using makeprg with <F7>
map <F7> :make<CR>
" Toggle paste mode with F8
set pastetoggle=<F8>
"Use Ctr-t in normal mode to toggle Tagbar
nmap <C-t> :TagbarToggle<CR>
" Use Ctrl-n in normal mode to toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>
" Save and exit with Ctrl-c
nmap <C-c> :wq<CR>
imap <C-c> <ESC>:wq<CR>
" Insert line at diferent point with <SPACE>+Arrows
nmap <SPACE><LEFT> I
nmap <SPACE><RIGHT> A
"nmap <SPACE>k O
"nmap <SPACE>j o
" Enter shell
nmap <SPACE>; :sh<CR>
" Navigate between windows using <SPACE>+Arrows
nmap <SPACE>k <C-w>k
nmap <SPACE>j <C-w>j
nmap <SPACE>h <C-w>h
nmap <SPACE>l <C-w>l
" Execute the q macro
nnoremap <Space>m @q
" Activate/Deactivate relative line number
nmap <SPACE>n :set relativenumber!<CR>
" Add shortcut to search a word
nmap <SPACE>s "zyiw:Ack!<Space><C-r>z
" Add shortcut to go to definition in new window
nmap <SPACE>d "zyiw:stag<Space><C-r>z<CR>
" Toggle comments with <SPACE>c
nmap <SPACE>c :Commentary<CR>
vmap <SPACE>c :Commentary<CR>
" Search and replace
nmap <SPACE>r "zyiw:%s/\<<C-r>z\>//gc<LEFT><LEFT><LEFT>
" Insert/remove level indentation
nmap <SPACE><SPACE> I<TAB><ESC>l
nmap <SPACE><BS> I<BS><ESC>l
" Zoom in/out
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
