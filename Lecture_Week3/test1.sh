#!/bin/bash

echo -e 'Enter a number: '
read number

if test "$number" -gt 0
then 
    echo "$number is positive!"
elif test "$number" -eq 0
then
    echo "$number is zero"
else
    echo "$number is negative"
fi