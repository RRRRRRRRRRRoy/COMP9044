#!/bin/dash

# get the directory
directory1=$1
directory2=$2

# looping the files in the directory
for files in $directory1/*
do
	filename=$(echo "$files"|sed 's/..*\///g')
    # check the second file is exists or not
	if [ -e "$2/$filename" ] 
	then
		check_difference=$(diff "$files" "$directory2/$filename"|wc -l)
        # check the difference flag between 2 files
        if [ "$check_difference" -eq 0 ]
        then
            # print the file name
            echo "$filename"
        else
			:
		fi
    else
        :
	fi
done