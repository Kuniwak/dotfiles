set encoding=utf-8
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle "https://github.com/AndrewRadev/switch.vim.git"
NeoBundle "https://github.com/OrgaChem/tsumekusa-syntax.vim.git"
NeoBundle "https://github.com/OrgaChem/vim-javascript.git"
NeoBundle "https://github.com/OrgaChem/vim-qrcode.git"
NeoBundle "https://github.com/Shougo/neobundle.vim.git"
NeoBundle "https://github.com/Shougo/neocomplete.git"
NeoBundle "https://github.com/Shougo/neomru.vim.git"
NeoBundle "https://github.com/Shougo/neosnippet-snippets.git"
NeoBundle "https://github.com/Shougo/neosnippet.git"
NeoBundle "https://github.com/Shougo/unite-outline.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
NeoBundle "https://github.com/Shougo/vimfiler.git"
NeoBundle "https://github.com/Shougo/vimproc.git", {'build': {'windows': 'make -f make_mingw64.mak', 'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak'}}
NeoBundle "https://github.com/altercation/vim-colors-solarized.git"
NeoBundle "https://github.com/cocopon/colorswatch.vim.git"
NeoBundle "https://github.com/cocopon/googkit.vim.git"
NeoBundle "https://github.com/cocopon/iceberg.vim.git"
NeoBundle "https://github.com/deris/vim-duzzle.git"
NeoBundle "https://github.com/fugalh/desert.vim.git"
NeoBundle "https://github.com/hail2u/vim-css3-syntax.git"
NeoBundle "https://github.com/helino/vim-json.git"
NeoBundle "https://github.com/hynek/vim-python-pep8-indent.git"
NeoBundle "https://github.com/itchyny/lightline.vim.git"
NeoBundle "https://github.com/jonathanfilip/vim-lucius.git"
NeoBundle "https://github.com/juanpabloaj/ShowMarks.git"
NeoBundle "https://github.com/kana/vim-submode.git"
NeoBundle "https://github.com/kana/vim-textobj-user.git"
NeoBundle "https://github.com/mattn/emmet-vim.git"
NeoBundle "https://github.com/mattn/gist-vim.git", {'depends' : 'https://github.com/mattn/webapi-vim.git'}
NeoBundle "https://github.com/mattn/webapi-vim.git"
NeoBundle "https://github.com/modsound/macdict-vim.git"
NeoBundle "https://github.com/nanotech/jellybeans.vim.git"
NeoBundle "https://github.com/nathanaelkane/vim-indent-guides.git"
NeoBundle "https://github.com/osyo-manga/vim-over.git"
NeoBundle "https://github.com/popkirby/lightline-iceberg.git"
NeoBundle "https://github.com/scrooloose/syntastic.git"
NeoBundle "https://github.com/taichouchou2/html5.vim.git"
NeoBundle "https://github.com/therubymug/vim-pyte.git"
NeoBundle "https://github.com/thinca/vim-qfreplace.git"
NeoBundle "https://github.com/thinca/vim-quickrun.git"
NeoBundle "https://github.com/thinca/vim-ref.git"
NeoBundle "https://github.com/thinca/vim-scouter.git"
NeoBundle "https://github.com/thinca/vim-splash.git"
NeoBundle "https://github.com/thinca/vim-visualstar.git"
NeoBundle "https://github.com/thoughtbot/vim-rspec.git", {'depends' : 'https://github.com/tpope/vim-dispatch.git'}
NeoBundle "https://github.com/tomasr/molokai.git"
NeoBundle "https://github.com/tomtom/tcomment_vim.git"
NeoBundle "https://github.com/tpope/vim-abolish.git"
NeoBundle "https://github.com/tpope/vim-dispatch.git"
NeoBundle "https://github.com/tpope/vim-fugitive.git"
NeoBundle "https://github.com/tpope/vim-surround.git"
NeoBundle "https://github.com/tyru/restart.vim.git"
NeoBundle "https://github.com/ujihisa/unite-colorscheme.git"
NeoBundle "https://github.com/vim-scripts/Zenburn.git"
NeoBundle "https://github.com/vim-scripts/chlordane.vim.git"
NeoBundle "https://github.com/vim-scripts/hybrid.vim.git"

" Unstable plugins :-(
"NeoBundle 'tpope/vim-dispatch'
"NeoBundle 'thoughbot/vim-rspec'

if has('mac')
	NeoBundle "https://github.com/airblade/vim-gitgutter.git"
endif

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

" Yで行末までヤンク
noremap Y y$

" Yで行末までヤンク
noremap S Di

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

" ファイルタイプ変更
nnoremap <silent> <Leader>ftp :<C-u>set filetype=python<CR>
nnoremap <silent> <Leader>ftj :<C-u>set filetype=javascript<CR>
nnoremap <silent> <Leader>ftm :<C-u>set filetype=markdown<CR>
nnoremap <silent> <Leader>fth :<C-u>set filetype=html<CR>

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

" 対応するリテラルの生成
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap (<Enter> (<C-m><C-m>)<Up><Tab>
inoremap [<Enter> [<C-m><C-m>]<Up><Tab>
inoremap {<Enter> {<C-m><C-m>}<Up><Tab>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>

" 閉じ括弧で直後の閉じ括弧の後に移動
inoremap ) <ESC>f)a
inoremap ] <ESC>f]a
inoremap } <ESC>f}a

" 縦分割したら新しいウィンドウは右に
set splitright

" 常にステータス行を表示
set laststatus=2

"command-line completion
set wildmenu
set wildmode=list:longest

" Uniteのカーソルライン 
setlocal updatetime=40

" Diffsplit を横分割に変更
set diffopt+=vertical

" Beep を消す
set visualbell t_vb=

set background=dark
colorscheme iceberg


" VimsualStar {{{
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N
"}}}

" Quickrun {{{
let g:quickrun_config = {}

" Vimproc で Quickrun
let g:quickrun_config['_'] = {
			\ 'runner': 'vimproc',
			\       "runner/vimproc/updatetime" : 100
			\ }

" JavaScript の実行環境を Node.js に指定
let g:quickrun_config['javascript'] = {'type': 'javascript/nodejs'}

" mocha の設定を追加
let g:quickrun_config['javascript/mocha'] = {
			\ 'command': 'mocha',
			\ 'cmdopt': '',
			\ 'tempfile': '%{tempname()}.js'
			\ }

" Python 3をつかう
let g:quickrun_config['python'] = {'command' : 'python3'}

nnoremap <silent> <Leader>l :<C-u>QuickRun<CR>
"}}}

" Vimfiler {{{
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1

" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

" 現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>vf :<C-u>VimFilerBufferDir<CR>
"}}}

" Unite {{{
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>uc :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> <Leader>uf :<C-u>Unite file<CR>
nnoremap <silent> <Leader>ul :<C-u>Unite line<CR>
nnoremap <silent> <Leader>um :<C-u>Unite -default-action=open file_mru:all<CR>
nnoremap <silent> <Leader>uo :<C-u>Unite outline<CR>
nnoremap <silent> <Leader>ui :<C-u>Unite neobundle/install<CR>
nnoremap <silent> <Leader>us :<C-u>Unite neobundle/search<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite neobundle/update<CR>
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
" }}}

" NeoComplete {{{
let g:neocomplete#enable_at_start_up = 1
let g:neocomplete#manual_completion_start_length = 3

call neocomplete#custom_source('buffer', 'converters', ['converter_delimiter', 'converter_remove_next_keyword', 'converter_abbr'])

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

" For tern
"let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" For Jedi
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:neocomplete#force_omni_input_patterns.python =
"			\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"}}}

" Jedi {{{
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#rename_command = '<leader>R'
"autocmd FileType python let b:did_ftplugin = 1
" }}}

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
			\ "passive_filetypes": ["html", "css", "javascript", "python", "json", "perl", "ruby"] }

"let g:syntastic_javascript_checkers = ["gjslint", "jshint"]
"let g:syntastic_javascript_gjslint_conf = " --disable 5,110 --strict"
let g:syntastic_javascript_checkers = ["jshint"]

let g:syntastic_python_checkers = ['flake8']
let gvsyntastic_python_flake8_args = '--ignore=E501,E303'

let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_css_checkers = ['csslint']

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_perl_perl_args = '-wc'

let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

nnoremap <silent> <Leader>sc :<C-u>SyntasticCheck<CR>
nnoremap <silent> <Leader>st :<C-u>SyntasticToggleMode<CR>
"}}}

" Fugitive {{{
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gp :Git pull<CR>
nnoremap <silent> <Leader>gP :Git push<CR>
" }}}

"Showmarks{{{
" 英字のマークのみ表示
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"}}}

"Gist-vim{{{
let g:gist_detect_filetype = 1
vnoremap <Leader>g :Gist<CR>
"}}}

" Restart.vim {{{
" 終了時に保存するセッションオプションを設定する
" このオプションはMacVimだと動かない
"
" ま た M a c V i m か
"
if !has("mac")
	let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
endif
"}}}

" Lightline {{{
let g:lightline = {
			\   'colorscheme': 'iceberg',
			\   'active': {
			\     'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
			\     'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\   },
			\   'component_function': {
			\     'fugitive': 'MyFugitive'
			\   },
			\   'component_expand': {
			\     'syntastic': 'SyntasticStatuslineFlag',
			\   },
			\   'component_type': {
			\     'syntastic': 'error',
			\   }
			\ }

function! MyFugitive()
	try
		if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
			let mark = ''  " edit here for cool mark
			let _ = fugitive#head()
			return strlen(_) ? mark._ : ''
		endif
	catch
	endtry
	return ''
endfunction

augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" }}}

" GitGutter {{{
nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>
" }}}

" Vim Indent Guides {{{
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 5

augroup my_indent_color
	au!
	au VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#282a2e'
	au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg='#282a2e'
augroup END
" }}}

" Splash {{{
let g:splash#path = $HOME . '/.vim/splashes/start.txt'
command! OrgaChem :Splash $HOME/.vim/splashes/profile_white.txt
command! SplashJavaScriptOperatorPriorityTable :Splash $HOME/.vim/splashes/js_op_priority.txt
command! SplashPullRequestManner :Splash $HOME/.vim/splashes/pull_request_manner.markdown
" }}}

" Switch {{{
nnoremap <Leader>s :Switch<CR>
" }}}

" Submode {{{
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
"}}}

" MacDict {{{
nnoremap <Leader>d :MacDictCWord<CR>

" q で閉じる
autocmd BufEnter MacDictBuffer nnoremap <buffer><silent> q :q<CR>
" }}} 

" vim-rspec {{{
let g:rspec_command = "Dispatch rspec {spec}"

map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
" }}} 
      
" 保存時に行末の空白を除去する
function! s:remove_dust()
	let cursor = getpos(".")
	%s/\s\+$//ge
	call setpos(".", cursor)
	unlet cursor
endfunction

augroup remove_dust
	autocmd BufWritePre *.js call <SID>remove_dust()
	autocmd BufWritePre *.py call <SID>remove_dust()
augroup END

augroup my_file_type
	autocmd!
	autocmd BufNewFile,BufRead *.js.map setf json
	autocmd BufNewFile,BufRead *.webapp setf json
	autocmd BufNewFile,BufRead .jshintrc setf json
	autocmd BufNewFile,BufRead .watsonrc setf json
	autocmd BufNewFile,BufRead .googkit setf config
	autocmd BufNewFile,BufRead *.tsumekusa setf tsumekusa
	autocmd BufNewFile,BufRead *.pac setf javascript
	autocmd BufNewFile,BufRead Guardfile setf ruby
	" setf を上書きするために set filetype=markdown で強制的に ft 変更
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

" Windows 用
cd $HOME

" vim: fdm=marker noet tw=0
