#!/bin/bash

HELP="$0 DIR_OR_FILE"

DIR_OR_FILE="${1?$HELP}"

function mtimeFromExif {
	TIME=$( exiftool -S -createdate -d '%Y%m%d%H%M.%S' "$1" | awk '{print $2}' )
	touch -m -t "$TIME" "$1"
}

if [ -d "$DIR_OR_FILE" ]; then
	ls -1 "$DIR_OR_FILE" | while IFS= read -r FILE; do
		mtimeFromExif "$DIR_OR_FILE/$FILE"
	done
elif [ -e "$DIR_OR_FILE" ]; then
	mtimeFromExif "$DIR_OR_FILE"
else
	echo "$HELP" > /dev/stderr
	exit 1
fi
