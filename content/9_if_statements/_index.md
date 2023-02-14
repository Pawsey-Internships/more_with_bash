+++
title = "If Statements"
date = 2023-02-14
weight = 9
chapter = true
pre = "<b>9. </b>"
+++
## 9. If Statements

If statements allow us to write BASH scripts with conditional behaviour.

### If statement syntax:

	 if [ *some test* ]
	
	 then
	
		*conditional block 1*
	
	 elif [ *some other test* ]
	
	 then
	
		*conditional block 2*
	
	 else
	
		*conditional block 3*
	
	 fi

The square brackets reference the command 'test'. Look up the man page of 'test' to see the logical operations it supports.

### A (selective) summary of logical expertions:

* ! EXPRESSION, 	logical negation of EXPRESSION.
* -n STRING,	true if the length of STRING is greater than zero.
* -z STRING, 	true if the length of STRING is zero.
* STRING1 = STRING2, 	true if STRING1 is equal to STRING2.
* -e FILE,	true if FILE exists.
* INTEGER1 -eq INTEGER2, 	true if INTEGER1 is equal to INTEGER2.
* -d FILE, 	true if FILE exists and it is a directory
* INTEGER1 -gt INTEGER2,	true if INTEGER1 is greater than INTEGER2.
* INTEGER1 -lt INTEGER2,	true if INTEGER1 is less than INTEGER2.
* INTEGER -eq INTEGER2,		true if INTEGER1 is equal to INTEGER2.

Note:  '=' is different from '-eq',  [ 001 = 1 ] will return false as it performs a string comparison, whereas [ 001 -eq 1 ] will return true as it performs a numerical comparison.

___

Example 3: Create the '.recycle_bin' directory if it doesn't exist.

	#!/bin/bash

	SCRIPT_DIR="$(cd $(dirname ${BASH_SOURCE[0]});pwd)"

	RECYCLE_BIN_DIR="$SCRIPT_DIR/.recycle_bin"

	if [ ! -e "$RECYCLE_BIN_DIR" ]
	then
		mkdir $RECYCLE_BIN_DIR
	echo "Created new recycle bin directory at :" $RECYCLE_BIN_DIR
	fi
___

