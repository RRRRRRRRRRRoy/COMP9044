#!/bin/sh

for c in "$@"
do 
    car "$c" | egrep "^#include.\"" | cut -d'"' -f2,2| while read header
    do
        if test -d "$header"
        then
            echo c.h included into b.c does not exist
        else
            continue
        fi
    done
done
