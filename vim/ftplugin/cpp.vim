""""""""""""""""""""""""""""""""
"" for cpp : 
""""""""""""""""""""""""""""""""
:nnoremap <localleader>i o#include <><esc>i
:nnoremap <localleader>is o#include <iostream><esc>0o
:nnoremap <localleader>ip oprintf("");<esc>hhi
:nnoremap <localleader>un ousing namespace std;<cr><esc>
:nnoremap <localleader>m oint main(int argc, char **argv) {<cr><cr><cr>return 0;<cr>}<esc>3ki<tab>
:vnoremap <localleader><localleader> I//AD <esc>
:nnoremap <localleader><localleader> I//AD <esc>
:setlocal makeprg=g++\ --std=c++14\ %
:noremap [] []%
:noremap <f12> <esc><esc>:TagbarToggle<cr>
:noremap <f9> <esc><esc>:make<cr>
:noremap <f5> <esc><esc>:!./a.out

""""""""""""""""""""""""""""""""
