+++
title = "BASH Scripts and BASH Script Arguments"
date = 2023-02-14
weight = 2
pre = "<b>2.2. </b>"
+++

A BASH script is a text file containing lines of BASH compatible commands. These scripts start with a *shebang* and the path to the BASH interpreter:

	#!/bin/bash

BASH scripts accept an arbitrary number of whitespace delimited input arguments. These are accessed from within the BASH script like so:

* `$0`, 	        The script (or function) name.
* `$N`, 	        The Nth argument.
* `$#`, 	        The number of variables passed to the script (or function).
* `$*` and `$@`,	All of the positional arguments.

Where `$*` expands to a single string and `$@` expands to a sequence of strings.

___

Example 1: Parsing arguments.

	#!/bin/bash
	echo "The name of the script
	echo "This is the first argument $1."
	echo "There are $# argument(s) in total:"
	echo "$@"

___

