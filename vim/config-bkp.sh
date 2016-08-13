#!/usr/bin/env bash

# bkp vim related files
if [ -f vimrc ] ;  then rm -f vimrc ; fi
cp ~/.vimrc vimrc

if [ -a vim ] ; then rm -Rf vim ; fi
cp -R ~/.vim vim
