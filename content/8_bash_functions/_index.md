+++
title = "BASH Functions"
date = 2023-02-14
weight = 8
chapter = true
pre = "<b>8. </b>"
+++
## 8. BASH Functions

BASH functions allow the same piece of BASH code to be reused multiple times in a terminal session or script.

### BASH function syntax:

	*function name* () {
	
		*...*
	
		}

Typically, a  BASH function outputs to stdin if sucessful:

    echo 'Everything is fine!'

And outputs to stderr otherwise:

    echo 'Everything is awful!' 1>&2 

Standard practice is to return the exit status of the function (or script) where,

	return 0

indicates success, and `return [N]`, where [N]=1,2,3..., indicates an error.
___

Example 2: A BASH function that returns the number of input arguments.

	#!/bin/bash
	del () {
		echo "There are $# arguments"
		return 0
	}

___

To use a bash function outside of the bash script itself, **source** (read and execute) the script in the current shell environment:

	. ./recycle_bin/recyle_bin.sh

