# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000
HISTSIZE=5000
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='l -al'
alias la='l -a'
alias l='ls -CF'
alias lc='ls --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


set -o vi
echo -e "From ~/.bashrc: PATH=$PATH"

export OPATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
#export GCC520=/home/codeman/setup/gcc/gcc520/gcc-5.2.0
export GCC520a=/home/codeman/setup/gcc/gcc520/gcc520a/install
export GCC472b=/home/codeman/setup/gcc/gcc472/gcc472b/install
export LD_LIBRARY_PATH=$GCC520a/lib64
export withGCC480PATH=/home/codeman/setup/gcc-python-plugin:/home/codeman/setup/gcc-python-plugin/examples:$OPATH
export withGCC520aPATH=$GCC520a/bin:$OPATH
export withGCC472bPATH=$GCC472b/bin:$OPATH
export PATH=$withGCC520aPATH
export GPP=/home/codeman/setup/gcc-python-plugin
export w="/home/codeman/mydata/ws"
export PYTHONPATH=$GPP:$PYTHONPATH
#export PS1=">>\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
export PS1="\n>>PROMPT(\#, \!, \t) \n\u@\h: \W $ "
export HISTFILESIZE=50000
export HISTSIZE=5000

#alias n='echo -e "\n\n`date`\n\n" >> /home/codeman/mydata/mynotes/record48.txt; vi + /home/codeman/mydata/mynotes/record48.txt'
#alias n='echo -e "\nNOTE#BEGIN\n{\n  datetime: \"`date`\",\n  label: \"`date +%d%b%Y.%H%M%S`\",\n  keywords:[],\n  note: \"\"\"\"\n\n    STARTFROMHERE\n\n  \"\"\"\"\n}\nNOTE#END" >> /home/codeman/mydata/mynotes/record48.txt; vi +/STARTFROMHERE /home/codeman/mydata/mynotes/record48.txt'
alias n='echo -e "\n\n\n\n0000000\n!`date`\n@`date +%d%b%Y.%H%M%S`\n# CommaSeparatedKeywords\n\n\n0000000" >> /home/codeman/mydata/mynotes-git/record48-`uname -n`.txt; vi +/CommaSeparatedKeywords "/home/codeman/mydata/mynotes-git/record48-`uname -n`.txt"'
alias cc='echo -e "\n\n`date`\n\n" >> /home/codeman/cc; vi + /home/codeman/cc'
alias rn='vi + "/home/codeman/mydata/mynotes/record48-`uname -n`.txt"'
alias psg="ps aux | grep"
alias std="sudo shutdown -h now"
alias s=sudo
alias x="xscreensaver -nosplash &"
alias xl="xscreensaver-command --lock &"
alias g=grep
alias gr="grep -R"
alias eg=egrep
alias egr="egrep -R"
alias f="find . -name"
alias p="ipython3"
#alias g52="export PATH=$withGCC520aPATH; export LD_LIBRARY_PATH=$GCC520a/lib64"
alias g520a="export PATH=$withGCC520aPATH; export LD_LIBRARY_PATH=$GCC520a/lib64"
alias g520ap="export PATH=$withGCC520aPATH; export LD_LIBRARY_PATH=$GCC520a/lib64; cd $GCC520a/../plugins;"
alias g520ai="export PATH=$withGCC520aPATH; export LD_LIBRARY_PATH=$GCC520a/lib64; cd $GCC520a; cscope -R"
alias g484a="export PATH=$withGCC480PATH; export LD_LIBRARY_PATH=''"
alias g472b="export PATH=$withGCC472bPATH; export LD_LIBRARY_PATH='$GCC472b/lib'"
alias g472bp="export PATH=$withGCC472bPATH; export LD_LIBRARY_PATH='$GCC472b/lib'; cd $GCC472b/../plugins;"
alias g472bi="export PATH=$withGCC472bPATH; export LD_LIBRARY_PATH='$GCC472b/lib'; cd $GCC472b; cscope -R"

function ev {
    evince $1 &> /dev/null & 
}
function e {
    echo $@ ;
}
function psgk {
    kill `ps -e | grep $@ | cut -d' '  -f1` ;
}
function xsl {
    (xscreensaver -nosplash &) || echo -e "xscreensaver already running\n"
    xscreensaver-command --lock ;
    #killall xscreensaver ;
}
function gimpl {
    gcc -fdump-tree-all -fdump-rtl-all -fdump-ipa-all -O3 -c $1 ;
    gcc -O0 $1 ;
    vi $1.004t.gimple $1 ;
}

test "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' || (script -f $HOME/mydata/bash_record/$(date +"%Y-%m-%d_%H-%M-%S")_shell.log)
