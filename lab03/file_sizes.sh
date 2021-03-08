#!/bin/bash

# empty string used to store file names
small=""
medium=""
large=""

file_number=$(ls -l | wc -l)
file_number=$(expr $file_number - 1)
file_count=0 

# ``this is used to execute the sentence
wc -l `ls *` | while read line
do
        line_size=`echo $line | cut -d' ' -f1`
        file_name=`echo $line | cut -d' ' -f2`
        # Check the file lines and filename print
        # echo -n $line_size && echo -n ' ' && echo  $file_name
        if test $line_size -lt 10
        then
            # appending new string 
            # Source: https://stackoverflow.com/questions/2250131/how-do-you-append-to-an-already-existing-string
            small="$small $file"
        elif test $line_size -ge 10 && test $line_size -lt 100
        then
            medium="$medium $file"
        elif test $line_size -ge 100
        then
            large="$large $file"
        fi
done

echo "Small files: $small"
echo "Medium-sized files: $medium"
echo "large files: $large"