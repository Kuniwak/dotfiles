"" pathogenでパッケージを読込
"filetype off
"" syntax off
"filetype indent off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"set helpfile=$VIMRUNTIME/doc/help.txt
"filetype plugin on

" Vundle {{{
set nocompatible
filetype off

" Refer: http://d.hatena.ne.jp/holypp/20110516/1305552171
if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif

Bundle 'mattn/zencoding-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'tpope/vim-surround'
Bundle 'OrgaChem/JavaScript-syntax'
Bundle 'thinca/vim-qfreplace'
Bundle 'thinca/vim-quickrun'
Bundle 'tomtom/tcomment_vim'
Bundle 'timcharper/textile.vim'

filetype plugin indent on
" }}}

" 未使用のkaoriyaプラグインを無効化
let plugin_dicwin_disable=1

" Key
" Disable Ctrl+@
imap <C-@> <Nop>
" ESCキー2度押しでハイライトを消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nmap <C-[><C-[> :nohlsearch<CR><ESC>
" Insertモードを抜けるときIMEをOff
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
inoremap <silent> <C-[> <C-[>:set iminsert=0<CR>
" Intuitive cursor movement if `:set wrap`
noremap j gj
noremap gj j
noremap k gk
noremap gk k
noremap <Down> gj
noremap <Up> gk
" ウィンドウ切替
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>
nnoremap <C-l> <C-w>l
" 単語単位の移動をcamelcasemotionプラグインの動作に置き換え
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e


" Indent
set tabstop=2
set shiftwidth=2
set list
set listchars=tab:>\ 
set autoindent
set nosmartindent
autocmd FileType html set indentexpr&
autocmd FileType js set indentexpr&
autocmd FileType xhtml set indentexpr&

" Search
set noignorecase
set incsearch

" Insert mode
set completeopt=menu,menuone,preview

" Netrw
" Vキーで垂直分割で開く際、右に展開
let g:netrw_altv=1
" プレビューで開く際、垂直分割
let g:netrw_preview=1

let g:neocomplcache_enable_at_startup=1

" Neocomplcache-snippets-complete
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
g:neocomplcache_snippets_dir='~/.vim/snippets'
" command! -nargs=0 Es NeoComplCacheEditSnippets

" Misc
set display=lastline
set nobackup
set noswapfile
set number


" Plugins
" git clone https://github.com/tpope/vim-pathogen
" git clone https://github.com/vim-scripts/camelcasemotion
" git clone https://github.com/vim-scripts/AutoComplPop
" git clone https://github.com/MarcWeber/snipmate.vim
" git clone https://github.com/thinca/vim-quickrun
" git clone https://github.com/Shougo/vimproc 
" git clone https://github.com/msanders/cocoa.vim
" Colors
" git clone https://github.com/nanotech/jellybeans.vim 
" git clone https://github.com/vim-scripts/candyman.vim
" Syntax
" git clone https://github.com/vim-scripts/javascript.vim

set cursorline

" Keep indent
"nnoremap o o<Left><Right>
"nnoremap O O<Left><Right>
"inoremap <Enter> <Enter>a<Backspace>

set foldcolumn=3
set foldmethod=marker

" for GJsLint
" http://d.hatena.ne.jp/eagletmt/20100910/1284136430
autocmd QuickfixCmdPost make copen

map n nzz
map N Nzz
map * *zz
map # #zz

" Textile
let g:TextileBrowser="Google Chrome"
