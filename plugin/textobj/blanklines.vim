" Blank line text object for Vim
" Copyright © 2016-2017 Zandr Martin

" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the "Software"),
" to deal in the Software without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distribute, sublicense,
" and/or sell copies of the Software, and to permit persons to whom the
" Software is furnished to do so, subject to the following conditions:

" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.

" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
" OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
" OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if exists('g:loaded_textobj_blanklines')
    finish
endif

call textobj#user#plugin('blanklines', {
    \ '-': {
    \   '*sfile*': expand('<sfile>:p'),
    \   'select-a-function': 's:blank_lines_a',
    \   'select-a': 'a<Space>',
    \   'select-i-function': 's:blank_lines_i',
    \   'select-i': 'i<Space>',
    \ },
    \ })

function! s:blank_lines_i()
    return s:get_selection(0)
endfunction

function! s:blank_lines_a()
    return s:get_selection(1)
endfunction

function! s:get_selection(before)
    normal! 0
    let l:current_line = line('.')
    let l:pnb = prevnonblank(l:current_line)
    let l:nnb = nextnonblank(l:current_line)

    if a:before
        if l:pnb == l:current_line
            return 0
        else
            let l:start_line = (l:pnb == 0) ? 1 : l:pnb + 1
            let l:end_line = l:current_line
        endif
    else
        if l:nnb == l:current_line
            return 0
        else
            let l:start_line = l:current_line
            let l:end_line = (l:nnb == 0) ? line('$') : l:nnb - 1
        endif
    endif

    let l:start_pos = getpos('.')
    let l:start_pos[1] = l:start_line
    let l:end_pos = deepcopy(l:start_pos)
    let l:end_pos[1] = l:end_line

    return ['V', l:start_pos, l:end_pos]
endfunction

let g:loaded_textobj_blanklines = 1
