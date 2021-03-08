#!/bin/bash

small=""
medium=""
large=""

file_number=$(ls -l | wc -l)
file_number=$(expr $file_number - 1)
file_count=0 

wc -l $(ls *) | while read line
do
        line_size=$(echo $line | cut -d' ' -f1)
        file_name=$(echo $line | cut -d' ' -f2)
        # Check the file lines and filename print
        # echo -n $line_size && echo -n ' ' && echo  $file_name
        if test $line_size -lt 10
        then
            :
        elif test $line_size -ge 10 && test $line_size -lt 100
        then
            :
        elif test $line_size -ge 100
        then
            :
        fi
done