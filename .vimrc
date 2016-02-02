set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set encoding=utf-8
scriptencoding utf-8
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call g:neobundle#begin(expand('~/.vim/bundle'))
	let s:bundle_file = '~/.vimrc.bundle'
	if filereadable(expand(s:bundle_file))
		exec ':source '.s:bundle_file
	endif

	let s:bundle_file_local = '~/.vimrc.bundle.local'
	if filereadable(expand(s:bundle_file_local))
		exec ':source '.s:bundle_file_local
	endif
call g:neobundle#end()
filetype plugin indent on

NeoBundleCheck

" 未使用のkaoriyaプラグインを無効化
let g:plugin_dicwin_disable = 1

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
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
inoremap <silent> <C-[> <C-[>:set iminsert=0<CR>

" 日本語の行連結のときに空白を入力しない
set formatoptions+=mB

" 全角文字を半角に判定されることを回避
set ambiwidth=double

augroup highlightIdegraphicSpace
	autocmd!
	autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" カーソルを表示行で移動
noremap j gj
noremap gj j
noremap k gk
noremap gk k
noremap <Down> gj
noremap <Up> gk

"" Ctrl-a Ctrl-eで移動できるようにする
function! g:MoveCursorToHome()
  let l:c = col('.')
  exec 'normal! ^'
  if col('.') == l:c
    exec 'normal! 0'
  endif
endfunction

" コマンドモードでemacsキーバインドを使えるようにする
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <Backspace>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

inoremap <silent> <C-a> <C-o>:call g:MoveCursorToHome()<CR>
inoremap <C-b> <Left>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <Backspace>
inoremap <C-f> <Right>
inoremap <C-k> <C-o>D

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

xnoremap <silent> <C-a> :call g:MoveCursorToHome()<CR>

" Yで行末までヤンク
noremap Y y$
noremap vv V

" 検索時に/をエスケープ
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'

" 横幅を87桁にする
" 87桁は80桁折り返しルールで、行数が1000未満のときに都合がよい
nnoremap <silent> <Leader>rw :<C-u>vertical resize 87<CR>

" .vimrcを開く
nnoremap <silent> <Leader>ev :<C-u>tabnew $HOME/.dotfiles/.vimrc<CR>

" .vimrc を適用する
nnoremap <silent> <Leader>rv :<C-u>source $MYVIMRC<CR>
" .gvimrcを開く
nnoremap <silent> <Leader>eg :<C-u>tabnew $HOME/.dotfiles/.gvimrc<CR>
" .gvimrc を適用する
nnoremap <silent> <Leader>rg :<C-u>source $MYGVIMRC<CR>

nnoremap <silent> <Leader>eb :<C-u>tabnew ~/.dotfiles/.vimrc.bundle<CR>
nnoremap <silent> <Leader>elb :<C-u>tabnew ~/.dotfiles.local/.vimrc.bundle.local<CR>

" ファイルタイプ変更
nnoremap <silent> <Leader>ftp :<C-u>set filetype=python<CR>
nnoremap <silent> <Leader>ftj :<C-u>set filetype=javascript<CR>
nnoremap <silent> <Leader>ftm :<C-u>set filetype=markdown<CR>
nnoremap <silent> <Leader>fth :<C-u>set filetype=html<CR>

nnoremap <Leader>p :echo expand('%')<CR>

" Ctrl+hでBS
inoremap <C-h> <Backspace>

" タブ幅:2, インデント幅:2, 折り返し幅:無効
set tabstop=2
set shiftwidth=2
set textwidth=0

set backspace=2

" 検索結果文字列のハイライトを有効にする
set hlsearch

" 編集記号を表示
set list
set listchars=eol:¬,tab:▸\ 
set foldtext=MyFold()
function! g:MyFold()
    let l:line = getline(v:foldstart)
    let l:sub = substitute(l:line, '{{{', '', 'g') "}}}
    return ' ⇳ ' . l:sub
endfunction

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

" 行番号を表示
set number

" カーソルが上下20行以内にいかないようにする
set scrolloff=20
set sidescroll=1
set sidescrolloff=16

set laststatus=2

" 検索結果を画面の中央に表示させる
noremap n nzz
noremap N Nzz

" 対応するリテラルの生成
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap (<CR> (<C-m>)<C-o>O
inoremap [<CR> [<C-m>]<C-o>O
inoremap {<CR> {<C-m>}<C-o>O
inoremap (<Space> (<Space><Space>)<Left><Left>
inoremap [<Space> [<Space><Space>]<Left><Left>
inoremap {<Space> {<Space><Space>}<Left><Left>

" 閉じ括弧で直後の閉じ括弧の後に移動
inoremap ) <ESC>f)a
inoremap ] <ESC>f]a
inoremap } <ESC>f}a

" jj で ESC
inoremap jj <ESC>

" Undo履歴をファイルに保存する
set undodir=$HOME/.vim-undodir
set undofile

" 縦分割したら新しいウィンドウは右に
set splitright

"command-line completion
set wildmenu
set wildmode=list:longest

" Uniteのカーソルライン 
setlocal updatetime=40

" Diffsplit を横分割に変更
set diffopt+=vertical

" Beep を消す
set visualbell t_vb=

set pastetoggle=<Leader>tp

noremap ,v :<c-u>cexpr system('~/Development/vint/bin/vint --style ' . expand('%'))<cr>

" 保存時に行末の空白を除去する {{{
function! s:remove_dust()
	" It hold cursor position, so these policies are false positive.
	" vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
	let l:gdefault_save = &gdefault
	let l:cursor = getpos('.')

	%s/\s\+$//ge

	call setpos('.', l:cursor)
	unlet l:cursor
	let &gdefault = l:gdefault_save
	unlet l:gdefault_save
	" vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
endfunction

augroup remove_dust
	autocmd!
	autocmd BufWritePre *.js call <SID>remove_dust()
	autocmd BufWritePre *.py call <SID>remove_dust()
	autocmd BufWritePre *.pl call <SID>remove_dust()
	autocmd BufWritePre *.t call <SID>remove_dust()
augroup END

augroup force_utf8
	autocmd!
	autocmd FileType gitcommit set fileencoding=utf8
augroup END
" }}}

" ファイルタイプ設定 {{{
function! s:SetPytestIfUnderTestDir()
	if match(expand('%:p'), '\<test\>') > 0
		set filetype+=.pytest
	endif
endfunction

function! s:SetMochaIfUnderTestDir()
	if match(expand('%:p'), '\<tests\?\>') > 0
		set filetype+=.mocha
	endif
endfunction

augroup my_file_type
	autocmd!
	autocmd BufNewFile,BufRead *.js.map setf json
	autocmd BufNewFile,BufRead *.webapp setf json
	autocmd BufNewFile,BufRead .jslintrc setf json
	autocmd BufNewFile,BufRead .jscsrc setf json
	autocmd BufNewFile,BufRead .jshintrc setf json
	autocmd BufNewFile,BufRead .eslintrc setf json
	autocmd BufNewFile,BufRead .jscsrc setf json
	autocmd BufNewFile,BufRead .bowerrc setf json
	autocmd BufNewFile,BufRead .watsonrc setf json
	autocmd BufNewFile,BufRead .csslintrc setf json
	autocmd BufNewFile,BufRead .googkit setf config
	autocmd BufNewFile,BufRead *.pac setf javascript
	autocmd BufNewFile,BufRead Guardfile setf ruby
	autocmd BufNewFile,BufRead Gruntfile setf javascript
	autocmd BufNewFile,BufRead .perlcriticrc setf perlcriticrc

	autocmd FileType python call s:SetPytestIfUnderTestDir()
	autocmd FileType javascript call s:SetMochaIfUnderTestDir()

	autocmd BufNewFile,BufRead cpanfile setf perl
	autocmd FileType perl set filetype=perl.carton
	autocmd BufNewFile,BufRead *.t set filetype=perl.carton-prove

	" setf を上書きするために set filetype=markdown で強制的に ft 変更
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END
" }}}

" Quick quit {{{
augroup my_quick_quit
	autocmd!
	autocmd BufEnter MacDictBuffer nnoremap <buffer> q :<C-u>q<CR>
	autocmd FileType help,qf,quickrun nnoremap <buffer> q :<C-u>q<CR>
	autocmd FileType qf nnoremap <buffer> q :<C-u>cclose<CR>
augroup END
" }}}

" Quickrun {{{
let g:quickrun_config = {}

" Vimproc で Quickrun
let g:quickrun_config['_'] = {
			\ 'split': 'vertical',
			\ 'runner': 'vimproc',
			\       'runner/vimproc/updatetime' : 100
			\ }

" JavaScript の実行環境を Node.js に指定
let g:quickrun_config['javascript'] = {'type': 'javascript/nodejs'}

" mocha の設定を追加
let g:quickrun_config['javascript.mocha'] = {
			\ 'command': 'mocha',
			\ 'cmdopt': '-R spec',
			\ 'tempfile': '%{tempname()}.js'
			\ }

" 明示的に Python 3をつかう
let g:quickrun_config['python.python3'] = {'command' : 'python3'}

let g:quickrun_config['python.unittest'] = {
			\ 'command' : 'python',
			\ 'cmdopt' : '-m unittest',
			\ }

let g:quickrun_config['python.pytest'] = {
			\ 'command' : 'py.test',
			\ }

let g:quickrun_config['perl'] = {
			\ 'cmdopt': '-Ilib',
			\ 'command': 'perl',
			\ }

let g:quickrun_config['perl.prove'] = {
			\ 'cmdopt': '-lvfm --norc',
			\ 'command': 'prove',
			\ 'outputter/buffer/filetype': 'prove-output',
			\ 'shebang': 0,
			\ }

let g:quickrun_config['perl.carton'] = {
			\ 'cmdopt': '-Ilib -It_lib',
			\ 'exec': 'carton exec "perl %o %s:p %a"',
			\ }

let g:quickrun_config['perl.carton-prove'] = {
			\ 'cmdopt': '-It_lib -lvfm --norc',
			\ 'exec': 'carton exec "prove %o %s:p %a"',
			\ 'outputter/buffer/filetype': 'prove-output',
			\ 'shebang': 0,
			\ }

let g:quickrun_config['d'] = {
			\ 'command': 'rdmd',
			\ 'cmdopt': '-unittest'
			\ }

nnoremap <silent> <Leader>l :<C-u>QuickRun<CR>
"}}}

" Vimfiler {{{
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1

" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0

" VimFiler で無視するファイルを指定
"   - 隠しファイル
"   - swap ファイル
"   - python の byte code cache
let g:vimfiler_ignore_pattern='\(^\.\|\~$\|\.sw[opn]\|\.pyc$\|__pycache__\)'

function! s:change_vimfiler_mapping()
	" unmap <buffer> <C-j>
	" unmap <buffer> <C-l>
endfunction

augroup vimrc_vimfiler
	autocmd!
	autocmd FileType vimfiler call s:change_vimfiler_mapping()
augroup END

nnoremap <silent> <Leader>vf :<C-u>VimFilerBufferDir<CR>
"}}}

" Unite {{{
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>uc :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap <silent> <Leader>uf :<C-u>Unite file<CR>
nnoremap <silent> <Leader>ul :<C-u>Unite line<CR>
nnoremap <silent> <Leader>um :<C-u>Unite -default-action=open file_mru<CR>
nnoremap <silent> <Leader>uo :<C-u>Unite outline<CR>
nnoremap <silent> <Leader>ui :<C-u>Unite neobundle/install<CR>
nnoremap <silent> <Leader>us :<C-u>Unite neobundle/search<CR>
nnoremap <silent> <Leader>uu :<C-u>Unite neobundle/update<CR>
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
" }}}

" NeoComplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#manual_completion_start_length = 2
let g:neocomplete#use_vimproc = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#file_include#exprs')
	let g:neocomplete#sources#file_include#exprs = {}
endif
let g:neocomplete#sources#file_include#exprs.perl =
			\ "fnamemodify(substitute(v:fname, '/', '::', 'g'), ':r')"

let g:neocomplete#sources#omni#input_patterns.perl =
			\ "[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?"

let s:neocomplete_dict_home = $HOME.'/.vim/dictionary'
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default': '',
			\ 'javascript': s:neocomplete_dict_home.'/javascript.dict',
			\ 'javascript.mocha': s:neocomplete_dict_home.'/javascript.mocha.dict',
			\ 'javascript.closure': s:neocomplete_dict_home.'/javascript.closure.dict',
			\ 'perl': s:neocomplete_dict_home.'/perl.dict',
			\ 'perlcriticrc': s:neocomplete_dict_home.'/perlcriticrc.dict',
			\ }

augroup my_omni_completion
	autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTag
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTag
augroup END

augroup my_neocomplete
	autocmd!
	autocmd VimEnter call neocomplete#initialize()
augroup END

" For tern
"let g:neocomplete#force_omni_input_patterns.javascript = "[^. \t]\.\w*"

" For Jedi
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:neocomplete#force_omni_input_patterns.python =
"			\ "\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*"
"}}}

" Jedi {{{
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#rename_command = "<leader>R"
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

nnoremap <Leader>ens :<C-u>NeoSnippetEdit -split -vertical<CR>

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

augroup my_neosnippet
	autocmd!
	autocmd InsertLeave * NeoSnippetClearMarkers
augroup END
"}}}

" Syntastic {{{
let g:syntastic_debug = 0

let g:syntastic_mode_map = { 'mode': 'passive', "active_filetypes": ["json", "typescript", "python"] }

let g:syntastic_html_tidy_quiet_messages = {
			\ 'regex': [
			\   '\V\ctrimming empty <i>',
			\   '\V\cproprietary attribute "ng-',
			\   '\V\cproprietary attribute "min',
			\   '\V\cproprietary attribute "max',
			\   '\V\cunescaped &',
			\   '\V\clacks "action',
			\   '\m\c<ng-[^>]\+> is not recognized',
			\   '\m\c<x-[^>]\+> is not recognized',
			\   '\V\cdiscarding unexpected',
			\   '\V\chas invalid value "{{',
			\ ]}

let g:syntastic_typescript_checkers = ['tslint']

let g:syntastic_closure_library_checkers = ['gjslint']
let g:syntastic_closure_library_gjslint_conf = ' --disable 5,110 --strict'

let g:syntastic_javascript_checkers = ['eslint', 'jscs']

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E303'

let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_css_checkers = ['csslint']

let g:syntastic_perl_checkers = ['perl', 'perlcritic', 'podchecker']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_lib_path = ['./lib', './t_lib', './local/lib/perl5', './local/lib/perl5/x86_64-linux']
let g:syntastic_perl_perlcritic_args = '--harsh'

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args = '--fail-level warning'

let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']

let g:syntastic_vim_checkers = ['vint']

let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3

nnoremap <silent> <Leader>sc :<C-u>SyntasticCheck<CR>
nnoremap <silent> <Leader>sr :<C-u>SyntasticReset<CR>
"}}}

" Fugitive {{{
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gs :!tig status<CR>
nnoremap <silent> <Leader>gp :Git pull<CR>
nnoremap <silent> <Leader>gP :Git push<CR>
" }}}

" Showmarks{{{
" 英字のマークのみ表示
let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
"}}}

" Gist-vim{{{
let g:gist_detect_filetype = 1
vnoremap <Leader>g :Gist<CR>
"}}}

" Restart.vim {{{
" 終了時に保存するセッションオプションを設定する
" このオプションはMacVimだと動かない
"
" ま た M a c V i m か
"
if !has('mac')
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
			\     'fugitive': 'g:MyFugitive'
			\   },
			\   'component_expand': {
			\     'syntastic': 'SyntasticStatuslineFlag',
			\   },
			\   'component_type': {
			\     'syntastic': 'error',
			\   }
			\ }

function! g:MyFugitive()
	try
		if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &filetype !~? 'vimfiler' && exists('*fugitive#head')
			let l:mark = ''
			let l:_ = g:fugitive#head()
			return strlen(l:_) ? l:mark._ : ''
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
	call g:lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" }}}

" GitGutter {{{
let g:gitgutter_realtime = 0
" }}}

" Vim Indent Guides {{{
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 5

augroup my_indent_color
	autocmd!
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#282a2e'
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg='#282a2e'
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

" MacDict {{{
if has('mac')
	nnoremap <Leader>d :MacDictCWord<CR>
endif
" }}} 

" EasyMotion {{{
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
" }}} 

" Perl lib {{{
let g:rooter_use_lcd = 1
augroup my_perl_lib_path
	autocmd!
	autocmd FileType perl PerlLocalLibPath
augroup END
" }}}

" Unite pt {{{
nnoremap <silent> <Leader>pt :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
	let g:unite_source_grep_command = 'pt'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor'
	let g:unite_source_grep_recursive_opt = ''
	let g:unite_source_grep_encoding = 'utf-8'
endif
" }}}

" Tsuquyomi {{{
" Syntastic do it
let g:tsuquyomi_disable_quickfix = 0

augroup tsuquyomi_configs
	autocmd!
	autocmd FileType typescript setlocal completeopt+=menu,preview
	autocmd FileType typescript nnoremap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
augroup END
" }}}

" hdevtools {{{
augroup MyHaskell
	autocmd!
	autocmd FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
	" autocmd FileType haskell nnoremap <buffer> <silent> <leader> :HdevtoolsClear<CR>
augroup END

let g:syntastic_haskell_hdevtools_args = '-g-isrc -g-Wall'
" }}}

syntax enable
set background=dark
set t_Co=256
colorscheme iceberg

let s:vimrc_local = '~/.vimrc.local'
if filereadable(expand(s:vimrc_local))
	exec ':source '.s:vimrc_local
	nnoremap <Leader>elv :<C-u>tabnew ~/.dotfiles.local/.vimrc.local<CR>
endif

" vim: fdm=marker noet tw=0
