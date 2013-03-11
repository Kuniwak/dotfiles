" NeoBundle {{{
"
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle "https://github.com/Lokaltog/vim-easymotion.git"
NeoBundle "https://github.com/Lokaltog/vim-powerline.git"
NeoBundle "https://github.com/OrgaChem/vim-javascript.git"
NeoBundle "https://github.com/Shougo/neocomplcache.git"
NeoBundle "https://github.com/Shougo/neosnippet.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
NeoBundle "https://github.com/Shougo/vimfiler.git"
NeoBundle "https://github.com/Shougo/vimproc.git", {'build': {'windows': 'make -f make_mingw64.mak', 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak'}}
NeoBundle "https://github.com/Shougo/vimshell.git"
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle "https://github.com/hail2u/vim-css3-syntax.git"
NeoBundle "https://github.com/mattn/mkdpreview-vim.git"
NeoBundle "https://github.com/mattn/webapi-vim.git"
NeoBundle "https://github.com/mattn/zencoding-vim.git"
NeoBundle "https://github.com/nanotech/jellybeans.vim.git"
NeoBundle "https://github.com/scrooloose/syntastic.git"
NeoBundle "https://github.com/supermomonga/vimshell-kawaii.vim.git", {'depends' : 'Shougo/vimshell'}
NeoBundle "https://github.com/taichouchou2/html5.vim.git"
NeoBundle "https://github.com/thinca/vim-qfreplace.git"
NeoBundle "https://github.com/thinca/vim-quickrun.git"
NeoBundle "https://github.com/thinca/vim-ref.git"
NeoBundle "https://github.com/timcharper/textile.vim.git"
NeoBundle "https://github.com/tomtom/tcomment_vim.git"
NeoBundle "https://github.com/tpope/vim-fugitive.git"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/tsaleh/vim-matchit.git"
NeoBundle "https://github.com/vim-scripts/hybrid.vim.git"
NeoBundle "https://github.com/vim-scripts/str2numchar.vim.git"
NeoBundle "https://github.com/vim-scripts/sudo.vim.git"

filetype plugin indent on

NeoBundleCheck
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
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 横幅を87桁にする
" 87桁は80桁折り返しルールのときに都合がよい
nnoremap <silent>,rw :<C-u>vertical resize 87<CR>

" .vimrcを開く
nnoremap <silent>,ev :<C-u>tabnew $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <silent>,rv :<C-u>source $MYVIMRC<CR> 

" Indent
set tabstop=2
set shiftwidth=2
set list
set listchars=eol:¬,tab:▸\ 
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

" Misc
set display=lastline
set nobackup
set noswapfile
set number
set scrolloff=10

set cursorline

map n nzz
map N Nzz
map * *zz
map # #zz

" 縦分割したら新しいウィンドウは右に
set splitright	

" Avoid error of BandleInstall! on Windows
" https://github.com/gmarik/vundle/issues/192
set shellxquote=""

" Vimfiler {{{
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" 現在開いているバッファをIDE風に開く
nnoremap <silent>,vf :<C-u>VimFiler -split -simple -winwidth=35 -no-quit<CR>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
endfunction

"}}}

" Unite {{{
let g:unite_enable_start_insert = 0
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite -default-action=open file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,ul :<C-u>Unite line<CR>
" }}}

" NeoCompleCache {{{

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'javascript' : '~/.vim/dictionary/closurelibrary.dict'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

" NeoSnippet {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has("conceal")
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory="~/.vim/snippets"
"}}}

" Syntastic {{{
" http://poozxxx.hatenablog.com/entry/2012/06/21/000914
let g:syntastic_mode_map = { "mode": "active",
  \ "active_filetypes": [], 
  \ "passive_filetypes": ["html", "javascript"] }
let g:syntastic_auto_loc_list = 1 
let g:syntastic_javascript_checker = "gjslint"

" Ignoring 2 errors
"   0005 Illegal tab in white space
"   0110 Line too long
let g:syntastic_javascript_gjslint_conf = " --ignore_errors=5,110 --strict"

nnoremap <silent> ,sc :<C-u>SyntasticCheck<CR>
nnoremap <silent> ,st :<C-u>SyntasticToggleMode<CR>
"}}}

" Fugitive {{{
"command-line completion
set wildmenu
set wildmode=list:longest

nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,ge :Gedit 
" }}}

" VimShell {{{
let g:vimshell_split_command = "vsplit"
" 縦分割でVimShellを開く
nnoremap <silent> ,vs :<C-u>VimShell -split %:p:h<CR>
nnoremap <silent> ,vp :<C-u>VimShellPop %:p:h<CR>
"}}}

" Str2Numchar {{{
vmap <silent> ,sn :Str2NumChar<CR> 
vmap <silent> ,sh :Str2HexLiteral<CR> 
"}}}

" Textile
let g:TextileBrowser="Google Chrome"

" vim: fdm=marker
