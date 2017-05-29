
mydata = One folder with all necessary data
=============================

Each top level folder in this directory is as follows:

1. git    = house to all git repositories
   1. bin-git     = all common programs
   2. configs-git = all configuration files related to different things including this.
   3. mynotes-git = my notes in markdown format
   4. research    = git repos related to research
   5. ws          = the work space containing many git repos

2. local  = the local folder to a system that dies with the system. It is also a house to local saves until it makes its way to the `remote` folder.
   1. tmp = houses temporary files/folders
      1. downloads = set the default downloads dirctory to this
   2. packages-live = houses all locally installed programs

3. remote = This folder is named `master` on the system maintaining the master copy. All other systems call it `remote` and contain a subset of files w.r.t `master` at all times. House the files in `local/tmp` folder before moving them to the `master`. To add/remove/modify in this folder first add/remove/modify the `master` folder in whichever system it is located and then copy the changes to the local `remote` folder which is only a convenience copy of the `master`.


The '-git' suffix denotes that the folder contents are maintained in a remote git repository as well.

