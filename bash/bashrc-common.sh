################################
## Common shortcuts
################################
set -o vi
# the suffix $ or # is fixed separately for a user and root
export PS1="\n>>PROMPT(\#, \!, \t) \n\u@\h: \W "

export HISTFILESIZE=50000
export HISTSIZE=5000

alias ll='ls -lF'
alias lla='ls -alF'
alias la='ls -a'
alias l='ls -CF'
alias f="find . -name"
alias c="cd"
alias ..="cd .."

alias n='echo -e "\n\n\n\n0000000\n!`date`\n@`date +%d%b%Y.%H%M%S`\n# CommaSeparatedKeywords\n\n\n0000000" >> /home/codeman/mydata/work/mynotes-git/record48-`uname -n`.txt; vi +/CommaSeparatedKeywords "/home/codeman/mydata/work/mynotes-git/record48-`uname -n`.txt"'
alias rn='vi + "/home/codeman/mydata/work/mynotes-git/record48-`uname -n`.txt"'

alias psg="ps aux | egrep"

alias s=sudo

alias x="xscreensaver -nosplash &"
alias xl="xscreensaver-command --lock &"

alias g=grep
alias gr="grep -R"
alias eg=egrep
alias egr="egrep -R"

alias py="python3"
alias ipy="python3"

alias v=vim

alias acs="apt-cache search"
alias sag="sudo apt-get"
alias sagi="sag install"

function ev {
    evince $1 &> /dev/null & 
}

function e {
    echo $@ ;
}

function psgk {
    kill `ps -e | grep $@ | cut -d' '  -f1` ;
}
################################



################################
## Git related
################################

function gitfm {
    # f for fetch, m for merge
    git fetch origin master ;
    git merge origin/master ;
}

function gitf {
    # f for fetch 
    git fetch origin master ;
}

function gitm {
    # m for merge
    git merge origin/master ;
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

function xsl {
    (xscreensaver -nosplash &) || echo -e "xscreensaver already running\n"
    xscreensaver-command --lock ;
    #killall xscreensaver ;
}

#END############################

