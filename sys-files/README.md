This directory stores files with complete directory structure where they were copied from.

For example, the file `/etc/environment` will be stores as `./etc/environment`.

The file `./${HOST}/sys-files.list` contains the list of files to be copied. The program `bkp-configs` reads the list and copies the files into the directry named after the current host.
