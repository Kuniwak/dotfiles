scriptencoding utf-8

set lines=40
set columns=130
set showtabline=2
set guioptions-=T

if has('gui_macvim')
	set guifont=Source\ Code\ Variable\ Light:h11
	set guifontwide=HiraKakuPro-W3:h10

	" 起動時にフルスクリーンにする
	set fuoptions=maxvert,maxhorz
	nnoremap <Leader>fs :set fullscreen<CR>
end

if has("win32") || has("win64")
	set ambiwidth=auto
	set guifont=BDF_UM+:h9
end

set background=dark
colorscheme iceberg

" vim: fdm=marker noet tw=0
