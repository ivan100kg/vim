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

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " файловый менеджер
"Plug 'morhetz/gruvbox'          " цветовая схема
"Plug 'Valloric/YouCompleteMe'   " автокомплит смотри установку на Github
"Plug 'jiangmiao/auto-pairs'     " автоскобки и ковычки
Plug 'tpope/vim-fugitive'       " git встроенный в vim
"Plug 'airblade/vim-gitgutter'   " git изменения на полях
Plug 'ctrlpvim/ctrlp.vim'       " ctrl-p поиск файлов по каталогам
Plug 'easymotion/vim-easymotion'    " передвижение по тексту \s
Plug 'vim-airline/vim-airline'  " статусбар
Plug 'vim-airline/vim-airline-themes'   " цветные темы для airline
"Plug 'rking/ag.vim'   " поиск строк в файлах в рабочем каталоге
"Plug 'python-mode/python-mode', { 'branch': 'develop' } " python mode

" Initialize plugin system
call plug#end()
" =========================================================================

let g:airline_theme='onedark'
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
colorscheme onedark " тема
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

"let g:pymode_python = 'python3'

" назначение кнопок
map <C-n> :NERDTreeToggle<CR>
map <leader> <Plug>(easymotion-prefix)
" перемещение между окнами и самих окон ctrl + hjkl
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

" функция для перемещения
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
