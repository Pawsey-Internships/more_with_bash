+++
title = "Aliases"
date = 2023-02-14
weight = 18
chapter = false
pre = "<b>3.2. </b>"
+++

Aliases are user-defined commands built out of a sequence of terminal commands; with them, we can define 'shortcuts' to longer commands.

### Alias syntax:

	 alias *shortcut name*=*command*

e.g.:

	alias rm='rm -i'

will prompt the user for confirmation before deleting the file.

Aliases are a great way of making your system more comfortable to use. Modifications to .bashrc are the simplest way to change the behaviour of your Unix shell.

Be sure to do so with care, though. Comment on any changes, and add new commands to the bottom of the file wherever possible. Even better is to store your custom environment variables in a file that is 'sourced' by .bashrc.

