#*mydata*: the information house

*mydata* is a data organization system. It safely keeps personal data safe and organized. It has three subsystems, namely *git*, *local*, *remote*. These are explained ahead.

Every user on each computer system using the mydata system, has to maintain a `mydata` folder somewhere in the director hierarchy. All the data is maintained inside this directory such that when moving away from the system, a straight forward copy of this single directory saved all relevant data.

##The Subsystems

###git

This subsystem maintains all the git repositories in one place. The benefit of this setup is the automated syncing of all git repos inside this directory with a single command whenever required. Many directories within it are suffixed with `-git` to identify these directories as git repos, just by look at their names. The `-git` suffix is also an important semantic component for the working of the automation scripts. The directories not ending with `-git` are either normal directories withing a git repository or a directory containing many git repositories within. It has the following standard git repositories within:

####bin-git
The scripts within this directory help maintain itself as well as other parts of the mydata system. All scripts are put in this directory.

####configs-git
The files in this directory are a safe place to put all configuration files for various software one is using on a Linux system. Configuration files for each program should be placed in its own directory. It has directories like, `bash/`, `vim/`, `vimperator/`, `python3/`, `mydata-data/` etc.

####mynotes-git
Contains the quick notes that one can write using a terminal.

####research
A folder containing subfolders related to the current research activity.

####ws
This is a workspace that contains all the other git projects. It has a special git repository `ws-misc-git` which contains practice programs for various languages.


###local
This directory contains local files relevant only for the current system. This is meant to contain those expendable files which are not relevant for a different system. Some important folders inside this directory are, `bin`, `tmp`, `tmp/downloads`, `packages-live` etc.

###remote
This folder is a subset copy of `master` folder, which is maintained on a designated server machine. All long-term storage files are stored here. If a file has to be added, it has to be added to the server's `master` folder first and then a copy to the local `remote` folder is made. Similarly, to remove or modify a file, first it should be done on the `master` and then reflected on the client's `remote` folder.

To modify a file on the `master` it is recommended to take a copy of the file to the `local/` folder of the client's system, modify it and replace the file as given above.

