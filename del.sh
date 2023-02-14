#!/bin/bash

del () {

	if $( echo $@ | grep -q '\-h'  ) || $(echo $@ | grep -q '\--help')
	then
		echo "Usage del [OPTION].. [FILE]..."
		echo "Move FILE(s) to a recycle bin folder."
		echo "	-lN,	list the last N recycled FILES."
		return 0
	fi

	get_number(){
		N_OPTION=$( echo $1 | sed 's/[^0-9]//g' )
		echo $N_OPTION
	}

	SCRIPT_DIR="$(cd $(dirname ${BASH_SOURCE[0]});pwd)"	

	RECYCLE_BIN_DIR="$SCRIPT_DIR/.recycle_bin"

	LOG_PATH="$RECYCLE_BIN_DIR/.recycle_log"

	if [ ! -e "$RECYCLE_BIN_DIR" ]
	then
		mkdir $RECYCLE_BIN_DIR
	fi

	FILES=()
	OPTIONS=()

	for input in $@
	do
		if $(echo $input | grep -Eq '\-[a-zA-Z]?[0-9]+')
		then
			OPTIONS+=( $input  )
		else
			FILES+=( $input )
		fi
	done


	if [ ${#OPTIONS[@]} -gt 1 ]
	then
		echo "ERROR: More than 1 option." >&2
		return 1
	elif [ ${#OPTIONS[@]} -eq 1 ]
	then

		OPTION=${OPTIONS[0]}

		case $OPTION in

			-l*)
				tail -n$( get_number $OPTION) "$LOG_PATH"
				return 0
				;;

			-d*)
				tail -n$( get_number $OPTION) "$LOG_PATH" | awk '{size+=$1} END{print size}'
				return 0
				;;

			-u*)
				N=$(get_number $OPTION)
				MV_FROM=( $(tail -n$N "$LOG_PATH" | awk '{print $2}') )
				MV_TO=( $(tail -n$N "$LOG_PATH" | awk '{print $3}' )  )

				for i in $( seq 0 $(( $N - 1 )) )
				do
					mv "${MV_FROM[$i]}" "${MV_TO[$i]}"

					if [ ! -e "${MV_FROM[$i]}"  ]
					then
						M=$( grep -n "${MV_FROM[$i]}" "$LOG_PATH" | cut -f1 -d: )
						echo "$M"
						sed -i "${M}d" "$LOG_PATH"
					fi
				done
				return 0
				;;

			*)
				echo "ERROR: Option $OPTION not recognised." >&2
				return 1
				;;
		esac

	fi

	for FILE in ${FILES[@]}
	do
		if [ -e $FILE ]
		then
			NEW_PATH="$RECYCLE_BIN_DIR/$(date +%s_$FILE)"
			OLD_PATH="$(cd $(dirname $FILE);pwd)/$(basename $FILE)"
			echo $(du "$OLD_PATH" | cut -f1 ) "$NEW_PATH" "$OLD_PATH" >> "$LOG_PATH"
			mv $FILE $NEW_PATH
		else
			echo "ERRO: File '$FILE' does not exist!"
		fi
	done
}

