+++
title = "Parsing Delimited Text Files with 'awk'."
date = 2023-02-14
weight = 10
pre = "<b>2.10. </b>"
+++

Sections 3 to 9 defined the main control structures needed to implement `del`. However, we need a means of tracking the 'recycled' files and their original location. To achieve this, we will use a log file in the `.recycle_bin` directory called `.recycle_log` that will store the file size, file path in `.recycle_bin` and the original file path in a single line for each recycled file.

___

Example 8: Recycle files and write to `$LOG_DIR`.

	for FILE in ${FILES[@]}
	do
		if [ -e $FILE ]
		then
			NEW_PATH="$RECYCLE_BIN_DIR/$(date +%s)_$FILE"
			OLD_PATH="$(cd $(dirname $FILE);pwd)/$(basename "$FILE")"
			echo $(du "$OLD_PATH" | cut -f1)  "$NEW_PATH" "$OLD_PATH"  $LOG_DIR
			mv $FILE $NEW_PATH
		else
			echo "File '$FILE' does not exist!"
		fi
	done

___

We will use the `awk` command to parse this log file. Awk is a scripting language used for manipulating data and generating reports. It supports variables, numeric functions, string functions and logical operators.

Awk allows a programmer to write tiny programs to search for a pattern on each line of a file and carry out an action when that pattern is detected.

Some `awk` examples:

* `awk '{print}' [FILE]`, 	print the contents of `[FILE]` to stdout.
* `awk '{print $1}' [FILE]`, 	print the first column of `[FILE]`, by default white space is treated as the separator.
* `awk '{print $1 ""$3}' [FILE]`,	 print the first and the third column of `[FILE]` with a space in-between.
* `awk '/example/ {print}' [FILE]`,	 print all lines in `[FILE]` that contain the word example.
* `awk '[0-9]/{print}' [FILE]`,	 print all lines in `[FILE]` that contain numbers.
* `awk ‘^[0-9]/{print}’ [FILE]`,	 print all lines in `[FILE]` that start with a number
* `awk -F',' '{sum+=$1} END{print sum;}' [FILE]`,	sum the first column of `[FILE]` using `,` as the column delimiter.

___

Example 9: Sum the first column (file size) of the `del` log file.

	tail -n4 ~/recycle_bin/.recycle_bin/.recycle_log | awk '{size+=$1} END{print size}'

___

