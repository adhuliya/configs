#!/usr/bin/env bash

# bkp vim related files
if [ -f ~/.vimrc ] ; then rm -f ~/.vimrc ; fi
cp vim/vimrc ~/.vimrc

if [ -a ~/.vim ] ; then rm -Rf ~/.vim ; fi
cp -R vim/vim ~/.vim


# bkp bash related files

if [ -f ~/.bashrc ] ; then rm -f ~/.bashrc ; fi
cp bash/bashrc ~/.bashrc
