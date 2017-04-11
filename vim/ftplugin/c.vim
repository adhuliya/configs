""""""""""""""""""""""""""""""""
"" for cpp : TODO move to ftplugin folder
""""""""""""""""""""""""""""""""
:nnoremap <localleader>i <esc>o#include <><esc>i
:nnoremap <localleader>is <esc>o#include <stdio.h><esc>0j
:nnoremap <localleader>ip <esc>oprintf("Hello, world");<esc>
:nnoremap <localleader>m oint main(int argc, char **argv) {<cr><cr><cr>return 0;<cr>}<esc>3ki<tab>
:vnoremap <localleader><localleader> I//AD <esc>
:nnoremap <localleader><localleader> I//AD <esc>
:setlocal makeprg=g++\ --std=c++14\ %
:noremap [] []%
:noremap <f12> <esc><esc>:TagbarToggle<cr>
:noremap <f9> <esc><esc>:make<cr>
:noremap <f5> <esc><esc>:!./a.out

""""""""""""""""""""""""""""""""
