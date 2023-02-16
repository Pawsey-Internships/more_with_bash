+++
title = "Arrays"
date = 2023-02-14
weight = 13
chapter = true
pre = "<b>2.7 </b>"
+++
## 13. Arrays

BASH arrays are a sequence of indexable strings separated.

For example,

	SEQ1=(2 4 6 8 10 12)
or

	SEQ1=( "First Element" "Second Element" "Third Element")

### A (selective) summary of BASH array syntax:

* `arr=()`, 	 empty array.
* `arr=(1 2 3)`, 	 initialise array.
* `${arr[2]}`, 	 retrieve the third element (Note: BASH arrays are 0-indexed).
* `${arr[@]}`, 	retrieve all elements.
* `${!arr[@]}`, 	 retrieve array indices.
* `${#arr[@]}`, 	 calculate the array size.
* `arr[0]=3`, 	 overwrite the first element.
* `arr+=(4)`, 	 append value(s).
* `str=$(ls)`, 	 save ls output as a string.
* `arr=($(ls))`, 	 save ls output as an array of files.
* `${arr[@]:S:N}`, 	 Retrieve N elements starting at index S.
___

Example 6: Classify arguments as options and files. Append the corresponding matched file to the FILES and OPTIONS arrays.

	FILES=()
	OPTIONs=()

	for input in $@
	do
		if $(echo $input | grep -Eq '\-[a-zA-Z]?[0-9]+')
		then
			OPTIONs+=($input)
		else
			FILES+=($input)
		fi
	done
___

