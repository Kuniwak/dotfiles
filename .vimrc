set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set encoding=utf-8
scriptencoding utf-8
filetype off

if has('vim_starting')
	let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
	exec 'set runtimepath+=' . g:opamshare . '/merlin/vim'
	exec 'set runtimepath^=' . g:opamshare . '/ocp-indent/vim'
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))
	let s:bundle_file = '~/.vimrc.bundle'
	if filereadable(expand(s:bundle_file))
		exec ':source '.s:bundle_file
	endif

	let s:bundle_file_local = '~/.vimrc.bundle.local'
	if filereadable(expand(s:bundle_file_local))
		exec ':source '.s:bundle_file_local
	endif
call neobundle#end()
filetype plugin indent on

NeoBundleCheck

" $VIMRUNTIME/syntax/sh.vim で bash を有効にするため
let g:is_bash = 1

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

set termguicolors

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


function! PutFilename()
	let pos = getpos('.')
	execute ':normal a' . expand('%')
	call setpos('.', pos)
endfunction
nnoremap <Leader>wp :<C-u>call PutFilename()<CR>


" コマンドモードでemacsキーバインドを使えるようにする
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

inoremap <silent> <C-a> <C-o>:call g:MoveCursorToHome()<CR>
inoremap <C-b> <Left>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
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

" Undo履歴をファイルに保存する
function! s:make_dir_if_not_found(path) abort
	let dirname = expand(a:path . ':h')
	let basename = expand(a:path . ':t')

	if !isdirectory(a:path)
		call mkdir(a:path, 'p')
	endif
endfunction

function! s:set_undodir(path) abort
	let undodir = expand(a:path)
	call s:make_dir_if_not_found(undodir)
	let &undodir = undodir
endfunction

function! s:set_bkupdir(path) abort
	let bkupdir = expand(a:path)
	call s:make_dir_if_not_found(bkupdir)
	let &backupdir = bkupdir
endfunction

call s:set_undodir('~/.vim-undo')
set undofile
call s:set_bkupdir('~/.vim-bkup')
set backup


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
	autocmd BufWritePre *.swift call <SID>remove_dust()
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

function! s:SetSPMTestIfUnderTestDir()
	if match(expand('%:p'), '\<Tests\>') > 0
		set filetype+=.swift-package-manager
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
	autocmd BufNewFile,BufRead .babelrc setf json
	autocmd BufNewFile,BufRead .googkit setf config
	autocmd BufNewFile,BufRead *.pac setf javascript
	autocmd BufNewFile,BufRead Guardfile setf ruby
	autocmd BufNewFile,BufRead Gruntfile setf javascript
	autocmd BufNewFile,BufRead .perlcriticrc setf perlcriticrc
	autocmd BufNewFile,BufRead Jenkinsfile setf groovy
	autocmd BufNewFile,BufRead *.jenkinsfile setf groovy
	autocmd BufNewFile,BufRead Podfile setf ruby
	autocmd BufNewFile,BufRead *.podspec setf ruby
	autocmd BufNewFile,BufRead Cartfile setf ruby
	autocmd BufNewFile,BufRead Cartfile.private setf ruby
	autocmd BufNewFile,BufRead *.tsv setf tsv

	autocmd FileType python call s:SetPytestIfUnderTestDir()
	autocmd FileType javascript call s:SetMochaIfUnderTestDir()
	autocmd FileType swift call s:SetSPMTestIfUnderTestDir()

	autocmd BufNewFile,BufRead cpanfile setf perl
	autocmd FileType perl set filetype=perl.carton
	autocmd BufNewFile,BufRead *.t set filetype=perl.carton-prove

	" setf を上書きするために set filetype=markdown で強制的に ft 変更
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END
" }}}

" Quickrun {{{
let g:quickrun_config = {}

" Vimproc で Quickrun
let g:quickrun_config['_'] = {
			\ 'split': 'vertical',
			\ 'runner': 'job',
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

let g:quickrun_config['swift.swift-package-manager'] = {
			\ 'exec': 'swift test',
			\ }


nnoremap <silent> <Leader>l :<C-u>QuickRun<CR>
"}}}

" Vaffle {{{
nnoremap <silent> <Leader>vf :<C-u>execute 'Vaffle ' . fnameescape(expand('%:h'))<CR>
"}}}

" Syntastic {{{
let g:syntastic_debug = 0

let g:syntastic_mode_map = { 'mode': 'passive', "active_filetypes": ["json", "python", "javascript", "swift", "yaml", "ocaml", "sh"] }

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

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E303'

let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_yaml_checkers = ['yamllint']

let g:syntastic_css_checkers = ['csslint']

let g:syntastic_perl_checkers = ['perl', 'perlcritic', 'podchecker']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_lib_path = ['./lib', './t_lib', './local/lib/perl5', './local/lib/perl5/x86_64-linux']
let g:syntastic_perl_perlcritic_args = '--harsh'

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args = '--fail-level warning'

let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']

let g:syntastic_vim_checkers = ['vint']

let g:syntastic_swift_checkers = ['swiftlint']

let g:syntastic_markdown_checkers = ['textlint']

let g:syntastic_ocaml_checkers = ['merlin']

let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6

let g:syntactic_sh_checkers = ['shellcheck']
let g:syntactic_sh_shellcheck_args = '-x'

nnoremap <silent> <Leader>sc :<C-u>SyntasticCheck<CR>
nnoremap <silent> <Leader>sr :<C-u>SyntasticReset<CR>
"}}}

nnoremap <silent> <Leader>gs :!tig status<CR>

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

" Splash {{{
let g:splash#path = $HOME . '/.vim/splashes/start.txt'
command! Kuniwak :Splash $HOME/.vim/splashes/profile_white.txt
command! SplashJavaScriptOperatorPriorityTable :Splash $HOME/.vim/splashes/js_op_priority.txt
command! SplashPullRequestManner :Splash $HOME/.vim/splashes/pull_request_manner.markdown
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
