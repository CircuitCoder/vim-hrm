" Vim syntax for Human Resource Machine by Tomorrow Corporation

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "hrm"

syn match HRMNumber '\d\+' contained
syn match HRMCell '\d\+\|\[\d\+\]' contains=HRMNumber
syn match HRMAddr '[a-z]\+' contained
syn match HRMLabel '[a-z]\+:' contains=HRMAddr

syn region HRMDefine start='DEFINE' end=';'

syn keyword HRMPrimaryCommand INBOX OUTBOX skipwhite
syn keyword HRMCommand COPYTO COPYFROM nextgroup=HRMCell skipwhite
syn keyword HRMCommand SUB ADD nextgroup=HRMCell skipwhite
syn keyword HRMJumpCommand JUMPN JUMP JUMPZ nextgroup=HRMAddr skipwhite
syn keyword HRMCommand BUMPUP BUMPDN nextgroup=HRMCell skipwhite

syn match HRMComment "--.*$"

hi def link HRMCommand Statement
hi def link HRMPrimaryCommand Type
hi def link HRMJumpCommand PreProc
hi def link HRMComment Comment
hi def link HRMNumber Constant
hi def link HRMAddr Identifier
hi def link HRMLabel Label
hi def link HRMDefine Constant
