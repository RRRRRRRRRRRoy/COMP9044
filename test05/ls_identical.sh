#!/bin/dash

directory1=$ARGV[1]
directory2=$ARGV[2]

for files in $directory1/*
do
    filename=$(echo "$filename" | sed 's|.+\/||g'`) 
    if [ -e "$directory2/$filename" ]
    then
        is_different=$(diff "$files" "$directory2/$filename"|wc -l)
        