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

" Submode {{{

"""
" guifont形式の文字列から、[フォント名, フォントサイズ]の配列を返す。
" @param {stirng} guifont guifont形式の文字列。
" @return {Array} [フォント名, フォントサイズ]の配列。
"""
function! s:split_guifont(guifont)
	let comps = split(a:guifont, ':')
	let hsize = comps[1]
	let matches = matchlist(hsize, 'h\(\d\+\)')
	return [comps[0], str2nr(matches[1])]
endfunction

"""
" [フォント名, フォントサイズ]の配列から、guifont形式の文字列を返す。
" @param {string} font_name フォント名。
" @param {number} font_size フォントサイズ。
" @return {stirng} guifont形式の文字列。
"""
function! s:join_guifont(font_name, font_size)
	return printf('%s:h%d', a:font_name, a:font_size)
endfunction

"""
" guifont形式の文字列から、フォントサイズを返す。
" @param {stirng} guifont guifont形式の文字列。
" @return {number} フォントサイズ。
"""
function! s:get_guifont_size(guifont)
	return s:split_guifont(a:guifont)[1]
endfunction

"""
" guifont形式の文字列から、フォント名を返す。
" @param {stirng} guifont guifont形式の文字列。
" @return {number} フォント名。
"""
function! s:get_guifont_name(guifont)
	return s:split_guifont(a:guifont)[0]
endfunction

let s:current_guifont_size = s:get_guifont_size(&guifont)
let s:default_guifont_size = s:current_guifont_size

let s:current_guifontwide_size = s:get_guifont_size(&guifontwide)
let s:default_guifontwide_size = s:current_guifontwide_size

"""
" s:current_guifont_size、s:current_guifontwide_sizeで指定されたフォントサイズにあわせる。
"""
function! s:apply_guifont_size()
	let guifont_name = s:get_guifont_name(&guifont)
	let guifontwide_name = s:get_guifont_name(&guifontwide)
	let &guifont = s:join_guifont(guifont_name, s:current_guifont_size)
	let &guifontwide = s:join_guifont(guifontwide_name, s:current_guifontwide_size)
endfunction

function! FontLarger()
	let s:current_guifont_size += 1
	let s:current_guifontwide_size += 1
	call s:apply_guifont_size()
endfunction

function! FontSmaller()
	let s:current_guifont_size -= 1
	let s:current_guifontwide_size -= 1
	call s:apply_guifont_size()
endfunction

function! FontDefault()
	let s:current_guifont_size = s:default_guifont_size
	let s:current_guifontwide_size = s:default_guifontwide_size
	call s:apply_guifont_size()
endfunction
" }}}

set background=dark
colorscheme iceberg

" vim: fdm=marker noet tw=0
