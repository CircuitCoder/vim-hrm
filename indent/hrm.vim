if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nolist
setlocal autoindent
setlocal indentexpr=GetHRMIndent(v:lnum)
set indentkeys+=<:>

function GetHRMIndent(lnum)
  let LABEL = '[a-z]\+'
  let COMMENT = '--.*$'

  echo a:lnum

  if getline(a:lnum) =~ LABEL
    return 0
  endif

  if getline(a:lnum) =~ COMMENT
    return 0
  endif

  return shiftwidth()
endfunction
