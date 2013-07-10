set encoding=utf-8
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

if has("mac")
" https://powerline.readthedocs.org/en/latest/installation/linux.html#i-get-e858-e860-error-in-vim-eval-did-not-return-a-valid-python-object
  NeoBundle "https://github.com/Lokaltog/powerline.git", {'rtp' : 'powerline/bindings/vim'}
endif
NeoBundle "https://github.com/Lokaltog/vim-easymotion.git"
NeoBundle "https://github.com/OrgaChem/tsumekusa-syntax.vim.git"
NeoBundle "https://github.com/OrgaChem/vim-javascript.git"
NeoBundle "https://github.com/Shougo/neocomplcache.git"
NeoBundle "https://github.com/Shougo/neosnippet.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
NeoBundle "https://github.com/Shougo/vimfiler.git"
NeoBundle "https://github.com/Shougo/vimproc.git", {'build': {'windows': 'make -f make_mingw64.mak', 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak'}}
NeoBundle "https://github.com/Shougo/vimshell.git"
NeoBundle "https://github.com/altercation/vim-colors-solarized.git"
NeoBundle "https://github.com/fugalh/desert.vim.git"
NeoBundle "https://github.com/h1mesuke/unite-outline.git"
NeoBundle "https://github.com/hail2u/vim-css3-syntax.git"
NeoBundle "https://github.com/helino/vim-json.git"
NeoBundle "https://github.com/itchyny/thumbnail.vim"
NeoBundle "https://github.com/juanpabloaj/ShowMarks.git"
NeoBundle "https://github.com/mattn/gist-vim.git", {'depends' : 'https://github.com/mattn/webapi-vim.git'}
NeoBundle "https://github.com/mattn/webapi-vim.git"
NeoBundle "https://github.com/mattn/zencoding-vim.git"
NeoBundle "https://github.com/nanotech/jellybeans.vim.git"
NeoBundle "https://github.com/scrooloose/syntastic.git"
NeoBundle "https://github.com/supermomonga/vimshell-kawaii.vim.git", {'depends' : 'https://github.com/Shougo/vimshell.git'}
NeoBundle "https://github.com/taichouchou2/alpaca_powertabline.git"
NeoBundle "https://github.com/taichouchou2/html5.vim.git"
NeoBundle "https://github.com/therubymug/vim-pyte.git"
NeoBundle "https://github.com/thinca/vim-qfreplace.git"
NeoBundle "https://github.com/thinca/vim-quickrun.git"
NeoBundle "https://github.com/thinca/vim-ref.git"
NeoBundle "https://github.com/thinca/vim-scouter.git"
NeoBundle "https://github.com/thinca/vim-visualstar.git"
NeoBundle "https://github.com/tomasr/molokai.git"
NeoBundle "https://github.com/tomtom/tcomment_vim.git"
NeoBundle "https://github.com/tpope/vim-abolish"
NeoBundle "https://github.com/tpope/vim-fugitive.git"
NeoBundle "https://github.com/tpope/vim-repeat"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/vim-scripts/ViewOutput.git"
NeoBundle "https://github.com/vim-scripts/Zenburn.git"
NeoBundle "https://github.com/vim-scripts/chlordane.vim.git"
NeoBundle "https://github.com/vim-scripts/dw_colors.git"
NeoBundle "https://github.com/vim-scripts/hybrid.vim.git"
NeoBundle "https://github.com/vim-scripts/str2numchar.vim.git"
NeoBundle "https://github.com/vim-scripts/sudo.vim.git"

" if has("ruby")
"   NeoBundle 'taichouchou2/alpaca_english', {
"         \ 'rev' : 'development',
"         \ 'build' : {
"         \   "mac" : "bundle",
"         \   "unix" : "bundle",
"         \   "other" : "bundle"
"         \ },
"         \ 'autoload' : {
"         \   'commands' : ["AlpacaEnglishDisable", "AlpacaEnglishEnable", "AlpacaEnglishSay"],
"         \   'unite_sources': ['english_dictionary', 'english_example', 'english_thesaurus']
"         \ }
"         \ }
" endif

filetype plugin indent on

" 未使用のkaoriyaプラグインを無効化
let plugin_dicwin_disable=1

" <Leader> を , に指定
let g:mapleader = ','

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

" 日本語の行連結のときに空白を入力しない
set formatoptions+=mB

" 全角文字を半角に判定されることを回避
set ambiwidth=double

" カーソルを表示行で移動
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
" 87桁は80桁折り返しルールで、行数が1000未満のときに都合がよい
nnoremap <silent> <Leader>rw :<C-u>vertical resize 87<CR>

" .vimrcを開く
nnoremap <silent> <Leader>ev :<C-u>tabnew $HOME/.orgachem-vim/_vimrc<CR>

" .vimrc を適用する（.gvimrcも）
nnoremap <silent> <Leader>rv :<C-u>source $HOME/.orgachem-vim/_vimrc<CR>:<C-u>source $HOME/.orgachem-vim/_gvimrc<CR>

" .gvimrcを開く
nnoremap <silent> <Leader>eg :<C-u>tabnew $HOME/.orgachem-vim/_gvimrc<CR>
" .gvimrc を適用する
nnoremap <silent> <Leader>rg :<C-u>source $HOME/.orgachem-vim/_gvimrc<CR>

" バッファのディレクトリに移動
nnoremap <silent> <Leader>cd :<C-u>cd %:h<CR>

" インデント操作後も行選択を保つ
vnoremap > >gv
vnoremap < <gv

" Ctrl+hでBS
inoremap <C-h> <Backspace>

" タブ幅:2, インデント幅:2, 折り返し幅:無効
set tabstop=2
set shiftwidth=2
set textwidth=0

" 編集記号を表示
set list
set listchars=eol:¬,tab:▸\ 

" 改行後もインデントを維持
set autoindent

" インデントは各プラグインにまかせる
set nosmartindent

autocmd FileType html set indentexpr&
autocmd FileType js set indentexpr&
autocmd FileType xhtml set indentexpr&

" 検索時にケースインセンティブにする
" ただし検索条件に大文字が含まれる場合のみケースセンシティブにする
set noignorecase

" インクリメンタル検索（逐次検索）を有効にする
set incsearch

" 補完をポップアップ表示する
set completeopt=menu,menuone,preview

" 長すぎる行も最後まで表示
set display=lastline

" バックアップファイルをつくらない
set nobackup

" スワップファイルをつくらない
set noswapfile

" 行番号を表示
set number

" カーソルが上下20行以内にいかないようにする
set scrolloff=20

" カーソル行を強調
set cursorline

" 検索結果を画面の中央に表示させる
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz

" 縦分割したら新しいウィンドウは右に
set splitright

" 常にステータス行を表示
set laststatus=2

" 起動時にフルスクリーンにする
if has("mac") && has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

if has("win32") && has("win64")
  cd $HOME
endif

" 保存時に行末の空白を除去する
function! s:remove_dust()
  let cursor = getpos(".")
  %s/\s\+$//ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre *.js call <SID>remove_dust()


au BufNewFile,BufRead *.tsumekusa setf tsumekusa
au BufNewFile,BufRead *.pac setf javascript

" VimsualStar {{{
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N
"}}}

" QuickRun {{{
let g:quickrun_config = {}

" JavaScript の実行環境を Node.js に指定
let g:quickrun_config['javascript'] = {'type': 'javascript/nodejs'}

" mocha の設定を追加
let g:quickrun_config['javascript/mocha'] = {
      \ 'command': 'mocha',
      \ 'cmdopt': '',
      \ 'tempfile': '%{tempname()}.js'
      \ }

nnoremap <silent> <Leader>l :<C-u>QuickRun<CR>
"}}}

" Vimfiler {{{
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"
let g:vimfiler_enable_auto_cd = 1
" 現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>vf :<C-u>VimFilerBufferDir -split -simple -no-quit -winwidth=35<CR>
nnoremap <silent> <Leader>vd :<C-u>VimFilerBufferDir -split -simple -no-quit -winwidth=35 -double<CR>
"}}}

" VimShell {{{
let g:vimshell_split_command = "vsplit"
" 縦分割でVimShellを開く
nnoremap <silent> <Leader>vs :<C-u>VimShellBufferDir -split<CR>
nnoremap <silent> <Leader>vp :<C-u>VimShellPop %:p:h<CR>
"}}}

" Unite {{{
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>uf :<C-u>Unite file<CR>
nnoremap <silent> <Leader>ul :<C-u>Unite line<CR>
nnoremap <silent> <Leader>um :<C-u>Unite -default-action=open file_mru<CR>
nnoremap <silent> <Leader>uo :<C-u>Unite outline<CR>
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Leader>ui :<C-u>Unite neobundle/install<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite neobundle/update<CR>
nnoremap <silent> <Leader>us :<C-u>Unite neobundle/search<CR>
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
set completeopt-=preview

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
let g:syntastic_mode_map = { "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": ["html", "javascript"] }
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 2
let g:syntastic_javascript_checker = "gjslint"

" Ignoring 2 errors
"   0005 Illegal tab in white space
"   0110 Line too long
"
" エラー回避できるようにgjslintをビルドし直すこと
"
" https://codereview.appspot.com/4291044/patch/1/2 {{{
" Index: errorrules.py
" ===================================================================
" --- errorrules.py	(revision 7)
" +++ errorrules.py	(working copy)
" @@ -25,6 +25,7 @@
"  FLAGS = flags.FLAGS
"  flags.DEFINE_boolean('jsdoc', True,
"                       'Whether to report errors for missing JsDoc.')
" +flags.DEFINE_list('ignore_errors', [], 'List of error codes to ignore.')
"
"
"  def ShouldReportError(error):
" @@ -34,9 +35,9 @@
"      True for all errors except missing documentation errors.  For these,
"      it returns the value of the jsdoc flag.
"    """
" -  return FLAGS.jsdoc or error not in (
" +  return (FLAGS.jsdoc or error not in (
"        errors.MISSING_PARAMETER_DOCUMENTATION,
"        errors.MISSING_RETURN_DOCUMENTATION,
"        errors.MISSING_MEMBER_DOCUMENTATION,
"        errors.MISSING_PRIVATE,
" -      errors.MISSING_JSDOC_TAG_THIS)
" +      errors.MISSING_JSDOC_TAG_THIS)) and str(error) not in FLAGS.ignore_errors
""}}}

let g:syntastic_javascript_gjslint_conf = " --ignore_errors=5,110 --strict"

nnoremap <silent> <Leader>sc :<C-u>SyntasticCheck<CR>
nnoremap <silent> <Leader>st :<C-u>SyntasticToggleMode<CR>
"}}}

" Fugitive {{{
"command-line completion
set wildmenu
set wildmode=list:longest

nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gp :Git pull<CR>
nnoremap <silent> <Leader>gP :Git push<CR>
" }}}

" Str2Numchar {{{
" 選択文字列をHTMLの実態文字参照に変換
vmap <silent> <Leader>sn :Str2NumChar<CR>
vmap <silent> <Leader>sh :Str2HexLiteral<CR>
"}}}

"Showmarks{{{
" 英字のマークのみ表示
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"}}}

"Alpaca-english{{{
let g:alpaca_english_enable=1
let g:alpaca_english_max_candidates=100
let g:alpaca_english_enable_duplicate_candidates=1

" 補完を有効にするファイルタイプを追加
"let g:neocomplcache_text_mode_filetypes = {
"  \ 'markdown' : 1,
"  \ 'gitcommit' : 1,
"  \ 'text' : 1,
"  \ }

" DEVELOPMENT VERSION
let g:alpaca_english_web_search_url = 'http://eow.alc.co.jp/%s/UTF-8/'
let g:alpaca_english_web_search_xpath = "div[@id='resultsList']/ul/li"
"}}}

"Gist-vim{{{
let g:gist_detect_filetype = 1
vnoremap <Leader>g :Gist<CR>
"}}}

set background=dark
colorscheme hybrid

" vim: fdm=marker et tw=0
