"seth/tmux.vimt nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'tmhedberg/SimpylFold'
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ColorSchemeMenuMaker'
Bundle 'desert-warm-256'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'keith/tmux.vim'
" Plugin 'Valloric/YouCompleteMe'
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"Plugin 'powerline/powerline'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"g:Powerline_symbols = 'fancy'
"
"set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
let g:airline_powerline_fonts = 1
set laststatus=2
set timeoutlen=50
set pastetoggle=<F2>

syntax on
set encoding=utf-8
set background=dark
" solarized options
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

autocmd BufRead,BufNewFile hosts set filetype=hosts

cmap w!! w !sudo tee "%" >/dev/null

map <C-J> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_

let g:SimpylFold_docstring_preview = 1

let g:airline#extensions#tabline#enabled = 1
:nnoremap <C-N> :bnext<CR>
:nnoremap <C-P> :bprevious<CR>
