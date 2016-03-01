let mapleader = " "
let maplocalleader= "\\"

""""""""""""""""""""""""""""""""
"" General Settings
""""""""""""""""""""""""""""""""
"set number
set ai

"expand tab to spaces: user :retab to change
"any previous tabs to spaces
"use :set list to see any tabs in the file as ^I
set ts=4
set shiftwidth=4
set expandtab

set sm "shows matching parenthesis/brackets/braces momentarily

set relativenumber
set number

" allows incrementing a to b ... too using <c-a> and <c-x>
set nrformats+=alpha

function NumberToggle()
  if(&relativenumber)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap  :call NumberToggle()<cr>

filetype plugin on
filetype indent on

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" wraps line at around column 79, at word boundaries.
set textwidth=79
""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""
"" Remap keys
""""""""""""""""""""""""""""""""

" takes you to normal mode when jk is typed
:inoremap jk <esc>

" disable esc key to use jk instead
" :inoremap <esc> <nop> 

" edit .vimrc file
:nnoremap <leader>ev :split $MYVIMRC<cr>

" source .vimrc file (read its settings in the current vim session)
:nnoremap <leader>sv :source $MYVIMRC<cr>

" To search for visually selected text
:vnoremap <leader>/ y/<C-R>"<CR>

" double quotes visually selected area
:vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>

" split vertical
:nnoremap <leader>e :vsp<cr>

" split horizontal
:nnoremap <leader>o :sp<cr>

:nnoremap L $
:nnoremap H 0

" paste from clipboard
:nnoremap <leader>v "+p

" add new line
:nnoremap <cr> o<esc>

" navigate between split windows
:nnoremap <c-h> <c-w>h
:nnoremap <c-j> <c-w>j
:nnoremap <c-k> <c-w>k
:nnoremap <c-l> <c-w>l

" list current buffers
:nnoremap <leader>b <esc>:ls<cr>

" copy text to system clipboard
:vnoremap y "+y
""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""
"" for cpp : TODO move to ftplugin folder
""""""""""""""""""""""""""""""""
:autocmd FileType c nnoremap <buffer> <localleader>i <esc>o#include <><esc>i
:autocmd FileType c nnoremap <buffer> <localleader>is <esc>o#include <stdio.h><esc>0j
:autocmd FileType c nnoremap <buffer> <localleader>ip <esc>oprintf("Hello, world");<esc>
:autocmd FileType c nnoremap <buffer> <localleader>m oint main(int argc, char **argv) {<cr><cr><cr>return 0;<cr>}<esc>3ki<tab>
:autocmd FileType c vnoremap <buffer> <localleader><localleader> I//AN <esc>
:autocmd FileType c nnoremap <buffer> <localleader><localleader> I//AN <esc>
:autocmd FileType c setlocal makeprg=g++\ --std=c++11\ %
:autocmd FileType c noremap <buffer> [] []%
:autocmd FileType c noremap <buffer> <f12> <esc><esc>:TagbarToggle<cr>
:autocmd FileType c noremap <buffer> <f9> <esc><esc>:make<cr>
:autocmd FileType c noremap <buffer> <f5> <esc><esc>:!./a.out

""""""""""""""""""""""""""""""""
