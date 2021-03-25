#!/bin/dash

directory1=$ARGV[1]
directory2=$ARGV[2]

for files in $directory1/*
do
    filename=$(echo "$filename" | sed 's|.+\/||g') 
    # if exist
    if [ ! -e "$directory2/$filename" ]
    then
        :
    else
        is_different=$(diff "$files" "$directory2/$filename"|wc -l)
        # check the differences flag
        if [ $is_different -eq 0 ]
        then
            echo "$filename"
        else
            :
        fi
    fi
done