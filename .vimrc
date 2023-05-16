" Файл настройки Vim Linux
"
" плагины =================================================================
" устанавливаем sudo apt install curl git build-essential cmake python3-dev
" если не уст-сь авто, заходим в vim жмем :PlugInstall
" заходим в папку с плагином YCM
" запускаем python3 install.py

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins =================================================================
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'    " передвижение по тексту \s
Plug 'vim-airline/vim-airline'  " статусбар
Plug 'vim-airline/vim-airline-themes'   " цветные темы для airline
Plug 'arzg/vim-colors-xcode'

" Initialize plugin system
call plug#end()
" =========================================================================

"let g:airline_theme='onedark'
"set clipboard=unnamedplus   " системный буфер на y p, install vim-gtk

set nocompatible    " откл. совместимость с vi
set nobackup        " don't save backup files
set noswapfile      " отключить своп файлы

filetype on         " enable file type detection
filetype plugin on  " Enable plugins and load plugin for the detected file type
filetype indent on  " Load an indent file for the detected file type

syntax on           " включить синтакс
"set number          " нумера строк
set cursorline      " Highlight cursor line underneath the cursor horizontally.
"set cursorcolumn    " Highlight cursor line underneath the cursor vertically.

set encoding=utf-8  " кодировка файлов и редактора
set scrolloff=3     " сколько строк внизу/вверху при скролинге
set wrap            " перенос длинных строк
set linebreak       " перенос целых слов
colorscheme xcodedark " тема
set background=dark " темный фон

set expandtab       " табы в пробелы
set tabstop=4       " ширина таба
set softtabstop=4
set shiftwidth=4
set autoindent

set hlsearch        " подсветка слов при поиске
set incsearch       " highlight matching characters when text
set ignorecase      " ignore capital letters
set smartcase       " search specifically for capital letters
"set showmatch       " Show matching words during a search
"set showcmd         " Show partial cmd you type in the last line of the screen
"set showmode        " Show the mode you are on the last line

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ `` 
