!#/bin/bash

FILE="$1"

if [ -z "$FILE" ]; then
        exit 1
fi

ffplay -nodisp -autoexit -loglevel quiet "$FILE" &
