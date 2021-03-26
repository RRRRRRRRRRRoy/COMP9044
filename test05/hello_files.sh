#!/bin/dash

number=$ARGV[0]
name=$ARGV[1]

if  "$number" -lt 0
then
    exit 1
fi

counter=0
while test "$counter" -le "$number" 
do
    echo "hello $name" >> "hello$($counter+1)".txt
done