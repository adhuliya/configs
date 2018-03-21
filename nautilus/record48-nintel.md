


------------------------------------------------
nautilus <a name="20180321-161304"></a>
================================================
* Keywords: nautilus settings
* Timestamp: 20180321-161304

------------------------------------------------
------------------------------------------------

Note: my scripts are in the `scripts` folder in the current directory.

Settings tested on "GNOME nautilus 3.14.3".

##Changing default editor to vim

1. Goto /usr/share/applications/ and check if vim.desktop exists (if not create one by referring other .desktop files)
2. Goto /etc/gnome/defaults.list and change all occurances of gedit.desktop to vim.desktop
3. Now things should work, if not, then logout and login.
4. For other type of files either edit /etc/gnome/defaults.list against proper MIME type or set defaults using Nautilus gui.

##Adding Scripts

1. Goto script folder: ~/.local/share/nautilus/scripts/
2. Create an *executable* script.
3. Open `nautilus` and right click on a file/folder and script name should be showing in the 'Scripts' submenu.

There are some environment variables availabe to the scripts called from `nautilus`:

* `NAUTILUS_SCRIPT_SELECTED_FILE_PATHS` : newline-delimited paths for selected files (only if local) 

* `NAUTILUS_SCRIPT_SELECTED_URIS` : newline-delimited URIs for selected files 

* `NAUTILUS_SCRIPT_CURRENT_URI` : current location 

* `NAUTILUS_SCRIPT_WINDOW_GEOMETRY` : position and size of current window 


##Adding a terminal opening shortcut

1. In the scripts folder : ~/.local/share/nautilus/scripts/ create an executable script that opens up a terminal. The contents of the script can be as given (assuming script-name 'terminal'):

        #!/bin/sh
        gnome-terminal

2. Logout and login again.
3. Open the file ~/.config/nautilus/accels and you would see many lines starting with a semicolon. Find the line like this:

        ; (gtk_accel_path "<Actions>/ScriptsGroup/script_file:\\s\\s\\shome\\scodeman\\s.local\\sshare\\snautilus\\sscripts\\sterminal" "")

   Note that this line is automatically generated when you logout and login (provided you have made the script file 'terminal', put it in the right place, and made it executable). Leading semicolon makes this line a comment, hence remove it. And add the shortcut F4 into the last pair of double quotes. Changed line would look like this:

        (gtk_accel_path "<Actions>/ScriptsGroup/script_file:\\s\\s\\shome\\scodeman\\s.local\\sshare\\snautilus\\sscripts\\sterminal" "F4")

4. Now test the shortcut, if it doesnot work, try logout and login again.



------------------------------------------------


