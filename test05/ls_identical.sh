#!/bin/dash

directory1=$1
directory2=$2

for files in $directory1/*
do
	filename=`echo "$files"|sed 's/.+\///g'`
	if [ -e "$2/$filename" ] 
	then
		check_difference=$(diff "$files" "$directory2/$filename"|wc -l)
		
        if [ "$check_difference" -eq 0 ]
        then
            echo "$filename"
        else
			:
		fi
    else
        :
	fi
done