+++
title = "Case Statements"
date = 2023-02-14
weight = 9
pre = "<b>2.9. </b>"
+++

Case statements are another way of implementing logical branching. They are easier to write and read in many instances than a long sequence of 'if' and 'elif' statements.

### case syntax:

	 case *option* in
	
		*pattern 1*)
	
			*commands*
	
			;;
	
		*pattern 2*)
	
			*commands*
	
			;;
	
		*pattern n*)
	
			*commands*
	
			;;
	
	 esac
	
Note: Case statement patterns support shell pattern matching only ('*', '?' and '.').

___

Example 7: A case statement defining option-dependant behaviour in 'del.

	OPTION=${OPTIONS[0]}

	case $OPTION in

		-l*)
			echo "This option will list recylced files."
			return 0
			;;

		-u*)
			echo "This option will restore recycled files."
			return 0
			;;
		*)
			echo "ERROR: Option not recognised"
			return 1
			;;

	esac

___


