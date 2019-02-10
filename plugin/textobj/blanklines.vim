if exists('g:loaded_textobj_blanklines')
  finish
endif

call textobj#user#plugin('blanklines', {
      \ '-': {
      \   '*sfile*': expand('<sfile>:p'),
      \   'select-a-function': 'textobj#blanklines#a',
      \   'select-a': 'a<Space>',
      \   'select-i-function': 'textobj#blanklines#i',
      \   'select-i': 'i<Space>',
      \ },
      \ })

let g:loaded_textobj_blanklines = 1
