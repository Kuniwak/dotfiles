" Vim syntax file
" Language:    Verbose TAP Output
" Maintainer:  Rufus Cable <rufus@threebytesfull.com>
" Remark:      Simple syntax highlighting for TAP output
" License:
" Copyright (c) 2008 Rufus Cable

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'tap'
endif

"" Drop fold if it is set but VIM doesn't support it.
let b:tap_fold='true'
if version < 600    " Don't support the old version
  unlet! b:tap_fold
endif

syn match tapTestStatusOK    /^\s*ok\s\+[0-9]\+/
syn match tapTestStatusNotOK /^\s*not ok\s\+[0-9]\+/
syn match tapTestPlan        /^\s*[0-9]\+\.\.[0-9]\+/
syn match tapTestComment     /^\s*#.*/
syn match tapTestResult      /^\s*Result:/ contains=tapTestPass,tapTestFail
syn keyword tapTestPass      PASS contained
syn keyword tapTestFail      FAIL contained

syn region tapTestRegion start=/^\(not \)\?ok.*$/me=e+1 end=/^\(\(not \)\?ok\|# Looks like you \(planned\|failed\)\|All tests successful\|Bailout called\)/me=s-1 fold transparent excludenl

set foldtext=TAPTestLine_foldtext()
function! TAPTestLine_foldtext()
    let line = getline(v:foldstart)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    return sub
endfunction

set foldminlines=5
set foldcolumn=2
set foldenable
set foldmethod=syntax
syn sync fromstart

if !exists("did_tapverboseoutput_syntax_inits")
  let did_tapverboseoutput_syntax_inits = 1

  " Define the default highlighting.
  " For version 5.7 and earlier: only when not done already
  " For version 5.8 and later: only when an item doesn't have highlighting yet
  if version >= 508 || !exists("did_tap_syn_inits")
    if version < 508
      let did_tap_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
    else
      command -nargs=+ HiLink hi def link <args>
    endif

    HiLink tapTestStatusOK    SpecialChar
    HiLink tapTestStatusNotOK Error
    HiLink tapTestPlan        Comment
    HiLink tapTestRegion      Normal
    HiLink tapTestResult      Comment
    HiLink tapTestPass        SpecialChar
    HiLink tapTestFail        Error
    HiLink tapTestComment     Comment

    delcommand HiLink
  endif
endif

let b:current_syntax = "tap"
if main_syntax == 'tap'
  unlet main_syntax
endif
