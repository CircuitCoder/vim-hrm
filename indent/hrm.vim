if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nolist
setlocal autoindent
setlocal indentexpr=GetHRMIndent(v:lnum)
set indentkeys+=<:>
set indentkeys+=<Space>

function GetHRMIndent(lnum)
  let curPos = getpos('.')

  call cursor(a:lnum, 0)
  normal! ^
  let column = getpos('.')[2]
  call setpos('.', curPos)

  let synid = join(map(synstack(v:lnum, column), 'synIDattr(v:val,"name")'),' ')

  if synid =~ '^HRMDefine'
    return 0
  endif

  if synid =~ '^HRMComment'
    return 0
  endif

  if synid =~ '^HRMLabel'
    return 0
  endif

  return shiftwidth()
endfunction
