scriptencoding utf-8

function! neutil#palette#Palette() abort
  return {
        \ 'bgh':    {'c': 235, 'g': '#262626'},
        \ 'bgs':    {'c': 236, 'g': '#303030'},
        \ 'fgh':    {'c': 222, 'g': '#ffd787'},
        \ 'fgs':    {'c': 229, 'g': '#ffffaf'},
        \ 'gray':   {'c': 245, 'g': '#8a8a8a'},
        \ 'red':    {'c': 203, 'g': '#ff5f5f'},
        \ 'orange': {'c': 214, 'g': '#ffaf00'},
        \ 'yellow': {'c': 220, 'g': '#ffd700'},
        \ 'green':  {'c': 148, 'g': '#afd700'},
        \ 'cyan':   {'c': 113, 'g': '#87d75f'},
        \ 'blue':   {'c': 159, 'g': '#afffff'},
        \ 'purple': {'c': 141, 'g': '#af87ff'},
        \ }
endfunction

function! neutil#palette#Highlight(group, fg, bg, sty) abort
  if type(a:fg) == v:t_dict
    let l:fgc = a:fg.c
    let l:fgg = a:fg.g
  else
    let l:fgc = a:fg
    let l:fgg = a:fg
  endif

  if type(a:bg) == v:t_dict
    let l:bgc = a:bg.c
    let l:bgg = a:bg.g
  else
    let l:bgc = a:bg
    let l:bgg = a:bg
  endif

  execute printf('highlight %s ctermfg=%s ctermbg=%s guifg=%s guibg=%s cterm=%s gui=%s',
        \ a:group, l:fgc, l:bgc, l:fgg, l:bgg, a:sty, a:sty)
endfunction
