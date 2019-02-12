" Vim syntax for Human Resource Machine by Tomorrow Corporation

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "hmr"

syn match HMRNumber '\d\+' contained
syn match HMRCell '\d\+\|\[\d\+\]' contains=HMRNumber
syn match HMRAddr '[a-z]\+' contained
syn match HMRLabel '[a-z]\+:' contains=HMRAddr

syn keyword HMRPrimaryCommand INBOX OUTBOX skipwhite
syn keyword HMRCommand COPYTO COPYFROM nextgroup=HMRCell skipwhite
syn keyword HMRCommand SUB ADD nextgroup=HMRCell skipwhite
syn keyword HMRJumpCommand JUMPN JUMP JUMPZ nextgroup=HMRAddr skipwhite
syn keyword HMRCommand BUMPUP BUMPDN nextgroup=HMRCell skipwhite

syn match HMRComment "--.*$"

hi def link HMRCommand Statement
hi def link HMRPrimaryCommand Type
hi def link HMRJumpCommand PreProc
hi def link HMRComment Comment
hi def link HMRNumber Constant
hi def link HMRAddr Identifier
