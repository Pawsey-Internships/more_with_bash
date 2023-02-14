+++
title = "Dotfiles"
date = 2023-02-14
weight = 17
chapter = true
pre = "<b>17. </b>"
+++
## 17. Dotfiles

The behaviour of a Unix system is controlled through the setting of environment variables. For instance, we have already encountered the HOME variable, which contains the path to the current user's home directory:

	echo $HOME

Another important variable is the $PATH directory.

	echo $PATH

This contains a list of locations that Unix searches for executable files (starting from the first directory). For instance, if we use the command `/whereis` to search for the location of the `grep` program:

	whereis 'grep'

We see that it is located under `/bin`.

	echo $PATH | grep ':/bin:'

Which is one of the default locations included in PATH.

Let's bring our attention back to the HOME environment variable. This variable is important for several reasons:

1. On all Unix systems, the user will have read, write and execute permissions in the HOME directory.
2. HOME is (typically) the location of user-specific programs.
3. HOME is (typically) the location for user-specific configuration files.

Configuration files are hidden files in the Unix file system. Hidden files in Unix start with a `.`. For this reason, they are often referred to as `dotfiles`.

From with the user's home directory, the command:

	ls -a

typically displays several dotfiles.

The most notable of these is perhaps `.bashrc`. This dotfile is 'sourced' whenever a new Bash session is launched (e.g. when the terminal window is opened).

To have `del` avaliable whenever we start a terminal session we can append,

	. ~/recycle_bin/recycle_bin.sh

to `.bashrc`.

