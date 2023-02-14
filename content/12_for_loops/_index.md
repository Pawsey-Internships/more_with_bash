+++
title = "For Loops"
date = 2023-02-14
weight = 12
chapter = true
pre = "<b>12. </b>"
+++
## 12. For Loops

A BASH for loop applies the same sequence of operations multiple times while iterating through a sequence.

### For loop syntax 1:

	 for OUTPUT in $(*command*)
	
	 do
	
			*commands*
	
	 done

e.g.:

	for i in $(seq 0 10)
	do
		echo $i
	done

or

### For loop syntax 2:

	 for (( *initializer*; *condition*; *step* ))
	
	 do
	
		 *commands*
	
	 done

e.g.:

	for (( c=1; c*=5; c++ ))
	do
		echo $c
	done

___

Example 5: Classifying input arguments.

	for input in $@
	do
		if $(echo $input | grep -Eq '\-[a-zA-Z]?[0-9]+')
		then
			echo "Input '$input' is an option."
		else
			echo "Input '$input' is (probably) a path."
		fi
	done

___

