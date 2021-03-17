#!/bin/sh

ls | ls | egrep ".*\.htm$" | while read old_name
do
    new_file_name=$(echo "$old_name" | sed "s/\.htm$/\.html$/g")
    # test file exist
    if test -f "$new_file_name"
    then 
        echo "$new_file_name exists" 1>&2
        exit
    else
        mv "$old_name" "$new_file_name" 1>&2
    fi
done