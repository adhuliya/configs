# NOTE: Adapted from .bashrc

# MYDATA and ITSOFLIFE should be set in /etc/environment file.

_MYDATA=$MYDATA
_ITSOFLIFE=$ITSOFLIFE
_MYMLOCATEDB=$MYMLOCATEDB

echo "$(date) zshrc-common.sh executing" >> ${_MYDATA}/local/logs/mysystem.log

################################
## MOST IMPORTANT
################################
# set PATH in ~/.profile only
export CDPATH="${ITSOFLIFE}/:${_MYDATA}/:${_MYDATA}/git:${_MYDATA}/local:${_MYDATA}/remote"
export EDITOR="vim"
export PYTHONPATH="${_MYDATA}/git/ws/ws-misc-git/python/mylib"

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

alias tree='tree -la -L 2'
alias treee='tree -la -L 3'
alias treeee='tree -la -L 4'
alias treeeee='tree -la -L 5'

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

#alias n='echo -e "\n\n\n\n0000000\n!`date`\n@`date +%d%b%Y.%H%M%S`\n# CommaSeparatedKeywords\n\n\n0000000" >> ${_MYDATA}/mynotes-git/record48-`uname -n`.txt; vi +/CommaSeparatedKeywords "${_MYDATA}/mynotes-git/record48-`uname -n`.txt"'

export NOTESTUB="\n\n\n------------------------------------------------\n<a name=\"`date +%Y%m%d-%H%M%S`\"></a>\nNote Heading\n================================================\n* Keywords: CommaSeparatedKeyword1, CommaSeparatedKeyword2\n* Timestamp: `date +%Y%m%d-%H%M%S`\n\n------------------------------------------------\n------------------------------------------------\n\n\n\n------------------------------------------------\n\n"

# global notes
alias n='echo -e "$NOTESTUB" >> ${_MYDATA}/../knotes-git/quick_notes.md; vi +/CommaSeparatedKeyword "${_MYDATA}/../knotes-git/quick_notes.md"'
alias rn='vi + "${_MYDATA}/../knotes-git/quick_notes.md"'
alias knotes="cd ${_MYDATA}/../knotes-git; vi _knotes.md;"
alias tasks="cd ${_MYDATA}/../knotes-git; vi tasks.md;"

# local notes
alias nl='echo -e "$NOTESTUB" >> README.md; vi +/CommaSeparatedKeyword "README.md"'
alias rnl='vi + "README.md"'

alias s=sudo

alias x="xscreensaver -nosplash &"
alias xl="xscreensaver-command --lock &"

alias g=egrep
alias eg=egrep
alias gr="egrep -R"

################
## python
################
alias py="python3 -q"
alias ipy="ipython3"
alias py3="python3 -q"
alias ipy3="ipython3"
export PYTHONSTARTUP=$_MYDATA/git/configs-git/python3/python3-startup.py
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

alias timeit="/usr/bin/time"

alias head="head -n 1"
alias headd="head -n 2"
alias headdd="head -n 3"
alias headddd="head -n 4"
alias headdddd="head -n 5"

alias tail="tail -n 1"
alias taill="tail -n 2"
alias tailll="tail -n 3"
alias taillll="tail -n 4"
alias tailllll="tail -n 5"

alias myupdatedb="updatedb -l 0 -o $_MYMLOCATEDB";
alias mylocate="locate -d $_MYMLOCATEDB -r";

# take notes on ajit/sparc/llvm
alias ajitnote="cd $ITSOFLIFE/knotes-git/sparc; vi sparc.md;"

function mysource {
  # accepts name of the source file and sources it from the fixed location
  # Use: to setup complicated environments quickly
  if [[ -z $1 ]]; then
    # list the source scripts without the argument
    ls $_MYDATA/git/configs-git/sourceit;
  else
    source $_MYDATA/git/configs-git/sourceit/$1;
  fi
}

function shot {
  # invokes screenshot program `import`, giving it a filename.
  import $_MYDATA/local/home/Pictures/$(mktemp -u "`date +"%Y%m%d-%H%M%S"`-XXXXXXXX.png")
}

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

export GOPATH=$_MYDATA/git/ws/ws-misc-git/golang
export GOBIN=$_MYDATA/git/ws/ws-misc-git/golang/bin
export GOLIB=$_MYDATA/git/ws/ws-misc-git/golang/pkg
#export GOROOT=$_MYDATA/local/packages-live/go
#export PATH=$GOROOT/bin:$PATH

#END#########################


