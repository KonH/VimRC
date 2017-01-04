set nocompatible
filetype off
set langmenu=none

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'altercation/vim-colors-solarized'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'Shougo/vimproc.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'yegappan/grep'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'

" -------------------------------------
" ERLANG
" -------------------------------------

if has('macunix')
  Bundle 'vim-erlang/erlang-motions.vim'
  Bundle 'vim-erlang/vim-erlang-runtime'
  Bundle 'vim-erlang/vim-erlang-compiler'
  Bundle 'vim-erlang/vim-erlang-omnicomplete'
  Bundle 'vim-erlang/vim-erlang-tags'
endif

" -------------------------------------
" BundleMake
" -------------------------------------

function! MyBundleInitFunc()
  execute "!(git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim)"
endfunction
command! MyBundleInit call MyBundleInitFunc()

function! MyBundleMakeFunc()
  execute "!(cd ~/.vim/bundle/vimproc.vim && make clean && make)"
  execute "!(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --omnisharp-completer --tern-completer)"
  execute "!(cd ~/.vim/bundle/color_coded && cmake . && make && make install)"
  execute "!(cabal install hoogle && hoogle data)"
endfunction
command! MyBundleMake call MyBundleMakeFunc()

" -------------------------------------

filetype plugin on
filetype indent on
syntax on

" -------------------------------------

" разрешаем перегружать глобальные настройки
set exrc
set secure

" вырубаем бикалку
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" показ позиции курсора
set cursorline
set nocursorcolumn

" мышь в терминале
set mouse=a
set mousehide

" быстрый терминал
set lazyredraw
set ttyfast

" используем системный буфер обмена
set clipboard=unnamed

" убираем менюшки всякие и полосы прокрутки
set guioptions-=T
set guioptions-=m
set guioptions+=lLrRb
set guioptions-=lLrRb
set guioptions+=c

" показывает положение курсора всё время
set ruler

" показывает незавершенные команды в статусбаре
set showcmd

" вкл относительную нумерацию строк
" set relativenumber

" выкл перенос строк
set nowrap

" автозачитывание файла после изменения, без вопроса
set autoread

" удобный поиск
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Leader><CR> :nohlsearch<CR>

" высота строки набора комманд
set cmdheight=1

" отступы и табы
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4

" сколько строк оставлять при скроллинге
set scrolloff=4

" табы на пробелы
" set expandtab

" шрифт
if has("win32")
  set guifont=Anonymous\ Pro:h12
  set antialias
endif

" цветовая схема
 set background=dark
 let g:solarized_termcolors=256
 let g:solarized_visibility='low'
" colorscheme lucius
 colorscheme solarized

" для color_coded
exe 'hi! link Member Boolean'
exe 'hi! link Variable Boolean'
exe 'hi! link Namespace Boolean'
exe 'hi! link EnumConstant Boolean'

" кодировочки
set encoding=utf-8
set termencoding=utf-8

" дополнение команд в менюшке
set wildmenu
set wildmode=longest,full
set completeopt-=preview

" нормальный бекспейс
set backspace=indent,eol,start

" выкл своп файлы
set nobackup
set noswapfile

" показывать имя буфера в заголовке терминала
set title

" Фолдинг
set foldmethod=indent " Фолдинг по отступам
set foldnestmax=10    " Глубина фолдинга 10 уровней
set nofoldenable      " Не фолдить по умолчанию

" хранить больше истории команд
set history=10000
set undofile
set undodir=$HOME/.vim/undodir
set undolevels=10000
set undoreload=10000

" подсветка <>
set showmatch
set matchpairs+=<:>

" Подсвечивать табы и пробелы в конце строки
set list
set listchars=tab:»·,trail:·,extends:$,nbsp:= 
nnoremap <silent> <F11> :set list<CR>

" quick search
nnoremap * *N
map <Space> /
map <S-Space> ?

" -------------------------------------
" move text
" -------------------------------------

nnoremap <silent> <C-J> :m .+1<CR>==
nnoremap <silent> <C-K> :m .-2<CR>==
inoremap <silent> <C-J> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-K> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-J> :m '>+1<CR>gv=gv
vnoremap <silent> <C-K> :m '<-2<CR>gv=gv

" -------------------------------------
" buffers
" -------------------------------------

nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" -------------------------------------
" syntastic
" -------------------------------------

let g:syntastic_enable_signs=1
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options=' -std=c++14 -stdlib=libc++'

" -------------------------------------
" nerdtree-tabs
" -------------------------------------

map <Leader>n :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0

" -------------------------------------
" vim-session
" -------------------------------------

let g:session_autoload='yes'
let g:session_autosave='yes'

" -------------------------------------
" multiple-cursors
" -------------------------------------

let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

" -------------------------------------
" tagbar
" -------------------------------------

map <Leader>t :TagbarToggle<CR>

" -------------------------------------
" tabular
" -------------------------------------

vmap <Leader>a :Tabularize /

" -------------------------------------
" youcompleteme
" -------------------------------------

let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_semantic_triggers={'haskell':['.']}
let g:ycm_max_diagnostics_to_display = 0
map <Leader>g :YcmCompleter GoTo<CR>

" -------------------------------------
" clever tab
" -------------------------------------

function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
