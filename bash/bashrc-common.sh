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

#alias n='echo -e "\n\n\n\n0000000\n!`date`\n@`date +%d%b%Y.%H%M%S`\n# CommaSeparatedKeywords\n\n\n0000000" >> /home/codeman/mydata/mynotes-git/record48-`uname -n`.txt; vi +/CommaSeparatedKeywords "/home/codeman/mydata/mynotes-git/record48-`uname -n`.txt"'

export NOTESTUB="\n\n\n------------------------------------------------\nNote Heading <a name=\"`date +%Y%m%d-%H%M%S`\"></a>\n================================================\n* Keywords: CommaSeparatedKeyword1, CommaSeparatedKeyword2\n* Timestamp: `date +%Y%m%d-%H%M%S`\n\n------------------------------------------------\n------------------------------------------------\n\n\n\n------------------------------------------------\n\n"

# global notes
alias n='echo -e "$NOTESTUB" >> /home/codeman/mydata/git/mynotes-git/record48-nintel.md; vi +/CommaSeparatedKeyword "/home/codeman/mydata/git/mynotes-git/record48-nintel.md"'
alias rn='vi + "/home/codeman/mydata/git/mynotes-git/record48-nintel.md"'

# local notes
alias nl='echo -e "$NOTESTUB" >> record48-nintel.md; vi +/CommaSeparatedKeyword "record48-nintel.md"'
alias rnl='vi + "record48-nintel.md"'

alias psg="ps aux | egrep"

alias s=sudo
alias ss="sudo su"

alias x="xscreensaver -nosplash &"
alias xl="xscreensaver-command --lock &"

alias g=grep
alias gr="grep -R"
alias eg=egrep
alias egr="egrep -R"

alias py="python3"

alias v=vim

alias acs="apt-cache search"
alias sag="sudo apt-get"
alias sagi="sudo apt-get install"

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
    $@ &> /dev/null &
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

#END############################

export PATH=$PATH:/home/codeman/mydata/git/bin-git
export MYDATA=/home/codeman/mydata
