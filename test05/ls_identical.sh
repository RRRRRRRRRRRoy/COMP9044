#!/bin/dash

directory1=$ARGV[1]
directory2=$ARGV[2]

for files in $directory1/*
do
    filename=$(echo "$filename" | sed 's/.+\///g') 
    # if exist
    if [ ! -e "$directory2/$filename" ]
    then
        :
    fi

    if [ -e "$directory2/$filename" ]
    then
        is_different=$(diff "$files" "$directory2/$filename"|wc -l)
        # check the differences flag
        if [ $is_different -ne 0 ]
        then
            :
        else
            echo "$filename"
        fi
    fi
done