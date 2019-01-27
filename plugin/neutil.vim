scriptencoding utf-8

if exists('g:loaded_neutil')
  finish
endif
let g:loaded_neutil = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

nnoremap <leader>db :call neutil#general#DelHiddenBuf()<cr>
nnoremap <leader>ro :call neutil#general#ToggleReadOnly()<cr>
nnoremap <leader>ln :call neutil#general#ToggleRelLnr()<cr>

let &cpoptions = s:save_cpo
unlet s:save_cpo
