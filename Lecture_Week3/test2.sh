#!/bin/sh

# This -This is for debug
set -u

echo -n 'Enter a number: '
read n

if [ "$number" -gt 0 ]
then
    echo "$number is positive"
elif [ "$number" -eq 0 ]
then 
    echo "$number is zero"
else
    echo "$number is negative"
fi