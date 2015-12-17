"set number
set ai

"expand tab to spaces: user :retab to change
"any previous tabs to spaces
set ts=4
set shiftwidth=4
set expandtab

set sm "shows matching parenthesis/brackets/braces momentarily

set relativenumber
set number

function NumberToggle()
  if(&relativenumber)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap  :call NumberToggle()<cr>

au FocusLost * :set number
au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

let a='int main() {'

" START FOR vim-latex package
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" END   FOR vim-latex package

let @a = ':!gcc %'
let @o = 'o'
let @c = ':cd ~:pwd:e cc'

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

"To search for visually selected text
"The :vnoremap command maps // in visual mode to run the commands y/<C-R>"<CR> which copies 
"the visually selected text, then starts a search command and pastes the copied 
"text into the search. <C-R> represents Ctrl-R and <CR> represents carriage return (Enter)kk
vnoremap // y/<C-R>"<CR>
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
" set textwidth=90

" Anshuman: C specific plugin
" #include <>
let mapleader = "-"
let maplocalleader= "\\"
nmap <localleader>ci <esc>o#include <><esc>i
nmap <localleader>cm oint main(int argc, char **argv) {<cr><cr><cr>return 0;<cr>}<esc>3ki<tab>
vmap <localleader><localleader> I//AN <esc>
map <f9> <esc>:make<cr>

" noremap ][ ][%
set makeprg=g++\ --std=c++11\ %
noremap [] []%
noremap <f12> <esc><esc>:TagbarToggle<cr>
noremap <f9> <esc><esc>:make<cr>
noremap <f5> <esc><esc>:!./a.out
vnoremap y "+y
