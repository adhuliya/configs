# NOTE: Adapted from .bashrc

# MYDATA should be set in /etc/environment file.
# It should contain a line like given below:
#   MYDATA=/home/codeman/mydata

echo "$(date) zshrc-common.sh executing" >> ${MYDATA}/local/logs/mybash.log

################################
## MOST IMPORTANT
################################
export PATH="$MYDATA/local/bin:${MYDATA}/git/bin-git:${PATH}"
export CDPATH="${MYDATA}/:${MYDATA}/git:${MYDATA}/local:${MYDATA}/remote"
export EDITOR="vim"
export PYTHONPATH="${MYDATA}/git/ws/ws-misc-git/python/mylib"

#END############################

################################
## Make Home and End key work over ssh
################################

#bindkey '\e[1~' beginning-of-line
#bindkey '\e[4~' end-of-line

bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

################################

################################
## fullscreen VIM based command editing, like in bash
################################

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#END############################

################################
## Common shortcuts
################################
set -o vi
# the suffix $ or # is fixed separately for a user and root
# export PS1="\n>>PROMPT(\#, \!, \t) \n\u@\h: \W "

#export HISTFILESIZE=-1
#export HISTSIZE=-1

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
alias bullets="cd ${MYDATA}/git/research/writeups/research-notes-git/tiddlywiki/others; vi bullets.md;"

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
export PY="import re;import os.path as osp;import os;import sys;\
pl=lambda lst, func=lambda x: x, end=os.linesep: [print(func(item),end=end) for item in lst];"
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
    nohup "$@" &> /dev/null &
}

function psg {
    ps -aux | grep "$@" | grep -v "grep" | getcol 2 ;
}

function psgk {
    kill $(ps -aux | grep "$@" | grep -v "grep" | getcol 2) ;
}

#END############################


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


#############################
## CLANG/LLVM RELATED
#############################

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

#END#########################


#############################
## MARKDOWN RELATED
#############################

function vmd {
  x=`mktemp /tmp/tmp-XXXXXX.html`
  markdown $1 > $x
  xdg-open $x
}

alias mdv=vmd

#END#########################


#############################
## GOLANG golang setup
#############################

export GOPATH=$MYDATA/git/ws/ws-misc-git/golang
export GOBIN=$MYDATA/git/ws/ws-misc-git/golang/bin
export GOLIB=$MYDATA/git/ws/ws-misc-git/golang/pkg
#export GOROOT=$MYDATA/local/packages-live/go
#export PATH=$GOROOT/bin:$PATH

#END#########################



