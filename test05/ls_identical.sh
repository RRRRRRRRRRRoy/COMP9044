#!/bin/dash

directory1=$1
directory2=$2

for files in $directory1/*
do
	filename=`echo "$files"|sed 's|.*\/||g'`
	if [ -e "$2/$filename" ] 
	then
        get_diff=`diff "$files" "$directory2/$filename"`
		is_different=$($get_diff|wc -l)
		
        if [ "$is_different" -eq 0 ]
        then
            echo "$filename"
        else
			:
		fi
    else
        :
	fi
done