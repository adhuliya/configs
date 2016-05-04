#!/usr/bin/env bash

# bkp vim related files
if [ -f vim/vimrc ] ;  then rm -f vim/vimrc ; fi
cp ~/.vimrc vim/vimrc

if [ -a vim/vim ] ; then rm -Rf vim/vim ; fi
cp -R ~/.vim vim/vim


# bkp bash related files

if [ -f bash/bashrc ] ;  then rm -f bash/bashrc ; fi
cp ~/.bashrc bash/bashrc
