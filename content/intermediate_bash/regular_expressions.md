+++
title = "Regular Expressions"
date = 2023-02-14
weight = 6
pre = "<b>2.6. </b>"
+++

Regular expressions are sequences of characters that specify a search pattern. For example, `*.dat` refers to any file ending in `.dat` and `?.dat` to any file ending with `.dat` with a prefix that is zero or more characters long.

Regular expressions use the special characters `.?*+{|()[\^$`.

### A (selective) summary of regular expression syntax:

* `.` 	matches any single character zero or one times.
* `?`, 	match to a single preceeding character.
* `*`,	 the preceding item is matched zero or more times.
* `+`,	 the preceding item is matched once or twice.
* `{n}`	 the preceding item is matched exactly n times.
* `|`,	 joins regular expressions and returns whatever matches either of the two strings.
* `[]`,	matches against a list or range of characters. e.g. `[^adf]` matches to anything that is not a `d` or `f` and `[0-9A-Za-z]` matches to all alphanumeric characters

A special character may be included as a normal character in a regular expression by preceding (`escaping`) it with a `\` character.

Not all BASH commands support the full range of regular expressions. However, the `.`, `?` and `*` operators are (almost) universally recognised for `shell pattern matching.

___

Example 4: Pattern matching to identify option flags (e.g. -l and -u).

	echo $@ | grep -Eq '\-[a-zA-Z]?[0-9]+'

___

