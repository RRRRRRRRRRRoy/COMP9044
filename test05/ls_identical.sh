#!/bin/dash

directory1=$ARGV[0]
directory2=$ARGV[1]

for files in $directory1/*
do
	filename=`echo "$files"|sed 's|.*\/||g'`
	if [ -e "$2/$filename" ] 
	then
		is_different=$(diff "$files" "$directory2/$filename"|wc -l)
		
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