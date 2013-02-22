setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal colorcolumn=80
setlocal foldmethod=marker
setlocal textwidth=80

setlocal include='goog.require('''
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
setlocal path='~/.vim/include/closure-library/closure'
setlocal suffixesadd=.js
