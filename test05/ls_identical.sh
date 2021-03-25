#!/bin/dash

directory1=$1
directory2=$2

for files in $directory1/*
do
	filename=`echo "$files"|sed 's|.*\/||g'`
	if [ -e "$2/$filename" ] 
	then
		is_different=$(diff "$files" "$directory2/$filename"|wc -l)
		if [ "$is_different" -eq 0 ]
		then
			echo "$filename"
		fi
	fi
done