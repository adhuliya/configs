# This is a test edit directly from github.com

echo "$(date) bashrc-common.sh executing" >> ${MYDATA}/local/mybash.log

################################
## MOST IMPORTANT
################################
export PATH="${PATH}:$MYDATA/local/ubin:${MYDATA}/git/bin-git"
export CDPATH="${MYDATA}/:${MYDATA}/git:${MYDATA}/local:${MYDATA}/remote"
export EDITOR="vim"
export PYTHONPATH="${MYDATA}/git/ws/ws-misc-git/python/mylib"

# MYDATA should be set in /etc/environment file.
# It should contain a line like given below:
#   MYDATA=/home/codeman/mydata
################################


################################
## Common shortcuts
################################
set -o vi
# the suffix $ or # is fixed separately for a user and root
export PS1="\n>>PROMPT(\#, \!, \t) \n\u@\h: \W "

export HISTFILESIZE=-1
export HISTSIZE=-1

alias ll='ls -lF'
alias lla='ls -alF'
alias la='ls -a'
alias l='ls -CF'
alias c="cd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# link to internet (lti)
alias lti="links internet.iitb.ac.in"

#alias n='echo -e "\n\n\n\n0000000\n!`date`\n@`date +%d%b%Y.%H%M%S`\n# CommaSeparatedKeywords\n\n\n0000000" >> ${MYDATA}/mynotes-git/record48-`uname -n`.txt; vi +/CommaSeparatedKeywords "${MYDATA}/mynotes-git/record48-`uname -n`.txt"'

export NOTESTUB="\n\n\n------------------------------------------------\nNote Heading <a name=\"`date +%Y%m%d-%H%M%S`\"></a>\n================================================\n* Keywords: CommaSeparatedKeyword1, CommaSeparatedKeyword2\n* Timestamp: `date +%Y%m%d-%H%M%S`\n\n------------------------------------------------\n------------------------------------------------\n\n\n\n------------------------------------------------\n\n"

# global notes
alias n='echo -e "$NOTESTUB" >> ${MYDATA}/git/mynotes-git/record48-nintel.md; vi +/CommaSeparatedKeyword "${MYDATA}/git/mynotes-git/record48-nintel.md"'
alias rn='vi + "${MYDATA}/git/mynotes-git/record48-nintel.md"'

# local notes
alias nl='echo -e "$NOTESTUB" >> record48-nintel.md; vi +/CommaSeparatedKeyword "record48-nintel.md"'
alias rnl='vi + "record48-nintel.md"'

alias s=sudo
alias ss="sudo su"

alias x="xscreensaver -nosplash &"
alias xl="xscreensaver-command --lock &"

alias g=grep
alias gr="grep -R"
alias eg=egrep
alias egr="egrep -R"

################
## python
################
alias py="python3 -q"
alias ipy="ipython3"
alias py3="python3 -q"
alias ipy3="ipython3"
export PYTHONSTARTUP=$MYDATA/git/configs-git/python3/python-startup.py
export PY="from re import *;import os.path as osp;import os;\
p=print;\
pl=lambda lst, end=os.linesep: [print(item,end=end) for item in lst];"
################

alias v=vim
alias r="vim -R"

alias ac="apt-cache"
alias acs="apt-cache search"
alias sag="sudo apt-get"
alias sagi="sudo apt-get install"
alias af="apt-file"
alias afs="apt-file search"

alias time="/usr/bin/time"

alias head1="head -n 1"
alias head2="head -n 2"
alias head3="head -n 3"

alias tail1="tail -n 1"
alias tail2="tail -n 2"
alias tail3="tail -n 3"

function o {
    xdg-open $1 &> /dev/null & 
}

function ev {
    evince $1 &> /dev/null &
}

function e {
    echo $@ ;
}

function b {
    "$@" &> /dev/null &
}

function psg {
    ps -aux | grep "$@" | grep -v "grep" | getcol 2 ;
}

function psgk {
    kill $(ps -aux | grep "$@" | grep -v "grep" | getcol 2) ;
}
################################



################################
## Git related
################################

function gitfm {
    # f for fetch, m for merge
    git fetch origin master ;
    git merge -m "merged" origin/master ;
}

function gitf {
    # f for fetch 
    git fetch origin master ;
}

function gitm {
    # m for merge
    git merge -m "merged" origin/master ;
}

function gitp {
    # p for push
    git add --all ;
    git commit -m '$1' ;
    git push origin master ;
}

function gits {
    git fetch origin master;
    git status;
}

#############################
## xscreensaver
#############################
function xsl {
    (xscreensaver -nosplash &) || echo -e "xscreensaver already running\n"
    xscreensaver-command --lock ;
    #killall xscreensaver ;
}

#END#########################

#START---CLANG/LLVM RELATED

# clangel = clang emit llvm assembly
function clangela {
    clang -emit-llvm -S -c $1 -o -;
}

# clangelb = clang emit llvm bitcode
function clangelb {
    clang -emit-llvm -c $1 -o ${1%.*}.bc;
}

alias clang14="clang++ -std=c++14"
alias clangel=clangela

#END-----CLANG/LLVM RELATED

#START---markdown related

function vmd {
  x=`mktemp /tmp/tmp-XXXXXX.html`
  markdown $1 > $x
  xdg-open $x
}

#END-----markdown related

#START---GOLANG golang setup
export GOPATH=$MYDATA/git/ws/ws-misc-git/golang-git
export GOBIN=$MYDATA/git/ws/ws-misc-git/golang-git/bin
export GOLIB=$MYDATA/git/ws/ws-misc-git/golang-git/lib
#END-----GOLANG golang setup



