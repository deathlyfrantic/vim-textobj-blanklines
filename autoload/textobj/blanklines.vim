function! s:get_selection(before)
  normal! 0
  let current_line = line('.')
  let pnb = prevnonblank(current_line)
  let nnb = nextnonblank(current_line)
  if a:before
    if pnb == current_line
      return 0
    else
      let start_line = (pnb == 0) ? 1 : pnb + 1
      let end_line = current_line
    endif
  else
    if nnb == current_line
      return 0
    else
      let start_line = current_line
      let end_line = (nnb == 0) ? line('$') : nnb - 1
    endif
  endif
  let start_pos = getpos('.')
  let start_pos[1] = start_line
  let end_pos = deepcopy(start_pos)
  let end_pos[1] = end_line
  return ['V', start_pos, end_pos]
endfunction

function! textobj#blanklines#i()
  return s:get_selection(0)
endfunction

function! textobj#blanklines#a()
  return s:get_selection(1)
endfunction
