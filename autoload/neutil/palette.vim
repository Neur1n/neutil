scriptencoding utf-8

function! neutil#palette#Palette() abort
  return {
        \ 'bgh':    {'c': 234, 'g': '#1c1c1c'},
        \ 'bgm':    {'c': 235, 'g': '#262626'},
        \ 'bgs':    {'c': 236, 'g': '#303030'},
        \ 'fgh':    {'c': 144, 'g': '#afaf87'},
        \ 'fgm':    {'c': 223, 'g': '#ffd7af'},
        \ 'fgs':    {'c': 230, 'g': '#ffffd7'},
        \ 'gray':   {'c': 239, 'g': '#4e4e4e'},
        \ 'red':    {'c': 203, 'g': '#ff5f5f'},
        \ 'orange': {'c': 208, 'g': '#ff8700'},
        \ 'yellow': {'c': 214, 'g': '#ffaf00'},
        \ 'green':  {'c': 142, 'g': '#afaf00'},
        \ 'cyan':   {'c': 108, 'g': '#87af87'},
        \ 'blue':   {'c': 109, 'g': '#87afaf'},
        \ 'purple': {'c': 175, 'g': '#d787af'}
        \ }
endfunction

" function! neutil#palette#Highlight(group, fg, bg, sty) abort
"   if type(a:fg) == v:t_dict
"     let l:fgc = a:fg.c
"     let l:fgg = a:fg.g
"   else
"     let l:fgc = a:fg
"     let l:fgg = a:fg
"   endif

"   if type(a:bg) == v:t_dict
"     let l:bgc = a:bg.c
"     let l:bgg = a:bg.g
"   else
"     let l:bgc = a:bg
"     let l:bgg = a:bg
"   endif

"   execute printf('highlight %s ctermfg=%s ctermbg=%s guifg=%s guibg=%s cterm=%s gui=%s',
"         \ a:group, l:fgc, l:bgc, l:fgg, l:bgg, a:sty, a:sty)
" endfunction

function! neutil#palette#Highlight(group, fg, ...) abort
  " Arguments: group, fg, bg, sty, sp; fg and bg should be dict or str.
  if type(a:fg) == v:t_dict
    let l:fgc = a:fg.c
    let l:fgg = a:fg.g
  else
    let l:fgc = a:fg
    let l:fgg = a:fg
  endif

  if a:0 >= 1
    if type(a:1) == v:t_dict
      let l:bgc = a:1.c
      let l:bgg = a:1.g
    else
      let l:bgc = a:1
      let l:bgg = a:1
    endif
  else
    let l:bgc = 'NONE'
    let l:bgg = 'NONE'
  endif

  if a:0 >= 2
    let l:sty = a:2
  else
    let l:sty = 'NONE'
  endif

  let l:cmd = ['highlight', a:group, 'ctermfg='.l:fgc, 'ctermbg='.l:bgc,
        \ 'guifg='.l:fgg, 'guibg='.l:bgg, 'cterm='.l:sty, 'gui='.l:sty]

  if a:0 >= 3
    if type(a:3) == v:t_dict
      let l:sp = a:3.g
    else
      let l:sp = a:3
    endif
    call add(l:cmd, 'guisp='.l:sp)
  endif

  execute join(l:cmd, ' ')

  " execute printf('highlight %s ctermfg=%s ctermbg=%s guifg=%s guibg=%s cterm=%s gui=%s',
  "       \ a:group, l:fgc, l:bgc, l:fgg, l:bgg, l:sty, l:sty)
endfunction
