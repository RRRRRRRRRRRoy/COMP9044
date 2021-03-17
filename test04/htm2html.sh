#!/bin/sh

ls | ls | egrep ".*\.htm$" | while read old_name
do
    new_file_name=$(echo "$old_name" | sed "s/\.htm$/\.html/g")
    # test file exist
    if [ ! -f "$new_file_name" ]
    then 
        # not exist change the name
        mv "$old_name" "$new_file_name" 1>&2
    else
        # if exist quit
        echo "$new_file_name exists" 1>&2
        exit 1
    fi
done