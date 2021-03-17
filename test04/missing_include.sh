#!/bin/sh

for c in "$@"
do 
    cat "$c" | egrep "^#include.\"" | cut -d'"' -f2,2| while read header
    do  
        # -d is for dir not for files 
        if [ ! -f  "$header" ]
        then
            # not exist print error
            echo "$header" included into "$c" does not exist
        else
            # exist continue
            continue
        fi
    done
done
