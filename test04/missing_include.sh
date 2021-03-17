#!/bin/sh

for c in "$@"
do 
    cat "$c" | egrep "^#include.\"" | cut -d'"' -f2,2| while read header
    do
        if test -f  "$header"
        then
            continue
        else
            echo "$header" included into "$c" does not exist
        fi
    done
done
